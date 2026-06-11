---
title: "Bài viết"
layout: single
permalink: /articles/
author_profile: false
classes: wide
---

<ul class="archive-posts-list">
  {% assign sorted_posts = site.posts | sort: "date" | reverse %}
  {% for post in sorted_posts %}
    <li class="archive-post-item">
      <h3 class="archive-post-title">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h3>
      <div class="archive-post-meta">
        <span class="archive-post-date">
          <i class="far fa-calendar-alt"></i> {{ post.date | date: "%d/%m/%Y" }}
        </span>
        {% if post.read_time %}
          <span class="archive-post-readtime">
            <i class="far fa-clock"></i> {{ post.read_time }} phút đọc
          </span>
        {% endif %}
      </div>
      {% if post.excerpt %}
        <p class="archive-post-excerpt">{{ post.excerpt | strip_html | truncate: 200 }}</p>
      {% endif %}
    </li>
  {% endfor %}
</ul>
