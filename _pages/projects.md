---
title: "Dự án"
layout: single
permalink: /projects/
author_profile: false
classes: wide
---

<ul class="archive-projects-list">
  {% assign all_projects = site.projects | sort: "date" | reverse %}
  {% for prj in all_projects %}
    <li class="archive-project-item">
      <h3 class="archive-project-title">
        <a href="{{ prj.url | relative_url }}">{{ prj.title }}</a>
        {% if prj.project_type %}
          <span class="project-type-badge project-type-badge--{{ prj.project_type | slugify }}">{{ prj.project_type }}</span>
        {% endif %}
      </h3>
      {% if prj.description %}
        <p class="archive-project-description">{{ prj.description }}</p>
      {% endif %}
      {% if prj.tech_stack %}
        <ul class="tech-tags">
          {% for tech in prj.tech_stack %}
            <li>{{ tech }}</li>
          {% endfor %}
        </ul>
      {% endif %}
    </li>
  {% endfor %}
</ul>
