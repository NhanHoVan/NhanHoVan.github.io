---
title: "Bài viết"
layout: single
permalink: /articles/
author_profile: false
classes: wide
---

<div class="archive-posts-grouped">
  {% assign sorted_posts = site.posts | sort: "date" | reverse %}
  {% assign current_year = "" %}
  {% for post in sorted_posts %}
    {% assign post_year = post.date | date: "%Y" %}
    {% if post_year != current_year %}
      {% if current_year != "" %}
        </ul>
      {% endif %}
      <h2 class="archive__subtitle">{{ post_year }}</h2>
      <ul class="archive-posts-list">
      {% assign current_year = post_year %}
    {% endif %}
    <li class="archive-post-item">
      <h3 class="archive-post-title">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h3>
      <div class="archive-post-meta">
        <span class="archive-post-date">
          <i class="far fa-calendar-alt"></i> {{ post.date | date: "%d/%m/%Y" }}
        </span>
        {% if post.read_time %}
          {% assign words = post.content | strip_html | number_of_words %}
          <span class="archive-post-readtime">
            <i class="far fa-clock"></i> {% if words < 360 %}1{% else %}{{ words | divided_by: 180 }}{% endif %} phút đọc
          </span>
        {% endif %}
      </div>
      {% if post.excerpt %}
        <p class="archive-post-excerpt">{{ post.excerpt | strip_html | truncate: 200 }}</p>
      {% endif %}
    </li>
  {% endfor %}
  {% if current_year != "" %}
    </ul>
  {% endif %}
</div>
