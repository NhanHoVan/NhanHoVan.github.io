require 'rss'
require 'open-uri'
require 'time'

module Jekyll
  module RSSFetcher
    # Memory cache to prevent fetching RSS on every incremental build in development mode
    @posts_cache = nil

    def self.fetch_feeds(urls)
      return @posts_cache if @posts_cache

      urls = Array(urls)
      
      if urls.empty?
        Jekyll.logger.info "RSS Fetcher:", "No external RSS feeds configured."
        @posts_cache = []
        return @posts_cache
      end

      Jekyll.logger.info "RSS Fetcher:", "Fetching external posts from #{urls.size} feed(s) in parallel..."

      threads = urls.map do |url|
        Thread.new do
          thread_posts = []
          begin
            parsed_url = URI.parse(url.to_s.strip)
            unless ['http', 'https'].include?(parsed_url.scheme)
              raise "Invalid URL scheme: #{parsed_url.scheme}. Only http/https are allowed."
            end

            # User-Agent header helps avoid 403 Forbidden errors from some feeds
            options = {
              "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
              :read_timeout => 8 # 8 seconds timeout to avoid hanging the build
            }
            URI.open(url, options) do |rss|
              feed = RSS::Parser.parse(rss, false)
              next unless feed
              
              items = feed.respond_to?(:items) ? feed.items : (feed.respond_to?(:entries) ? feed.entries : [])
              items = Array(items) # Safeguard against nil items
              items.first(5).each do |item|
                # Handle title (RSS item.title vs Atom item.title.content)
                title = item.respond_to?(:title) ? (item.title.respond_to?(:content) ? item.title.content : item.title) : "No Title"
                
                # Handle link (RSS item.link vs Atom item.link.href)
                link = nil
                if item.respond_to?(:link)
                  link = item.link.respond_to?(:href) ? item.link.href : item.link
                end
                if (link.nil? || link.to_s.strip.empty?) && item.respond_to?(:links) && item.links.any?
                  link = item.links.first.href
                end

                # Handle date (standard pubDate, dc:date, or Atom updated/published)
                date = nil
                [:pubDate, :date, :dc_date, :updated, :published].each do |m|
                  if item.respond_to?(m) && item.send(m)
                    val = item.send(m)
                    date = val.respond_to?(:content) ? val.content : val
                    break if date
                  end
                end

                parsed_date = nil
                if date
                  begin
                    parsed_date = date.is_a?(Time) ? date : Time.parse(date.to_s)
                  rescue => e
                    parsed_date = Time.now
                  end
                else
                  parsed_date = Time.now
                end

                domain = nil
                begin
                  parsed_uri = URI.parse(link.to_s.strip)
                  domain = parsed_uri.host
                  domain = domain.sub(/^www\./, '') if domain
                rescue => e
                  # Fallback if URI parsing fails
                end

                thread_posts << {
                  "title" => title.to_s.strip,
                  "link" => link.to_s.strip,
                  "date" => parsed_date,
                  "domain" => domain || "Không xác định"
                }
              end
            end
          rescue => e
            Jekyll.logger.warn "RSS Fetcher:", "Failed to fetch/parse feed '#{url}': #{e.message}"
          end
          thread_posts
        end
      end

      # Wait for all threads and flatten results
      posts = threads.flat_map(&:value).compact

      # Sort posts by date descending
      @posts_cache = posts.sort_by { |p| p["date"] }.reverse
      Jekyll.logger.info "RSS Fetcher:", "Successfully loaded #{@posts_cache.size} external posts."
      @posts_cache
    end
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  # Make the fetched posts available under site.data['external_posts']
  begin
    feeds = site.config['rss_feeds'] || []
    site.data['external_posts'] = Jekyll::RSSFetcher.fetch_feeds(feeds)
  rescue => e
    Jekyll.logger.warn "RSS Fetcher:", "Unexpected error during post_read hook: #{e.message}"
    site.data['external_posts'] = []
  end
end
