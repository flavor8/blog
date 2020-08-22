---
layout: page
---

{% for post in site.categories.linuxstudio limit:30 %}

  <div class="post">
    <ul>
      <li><a href="{{ post.url }}">{{ post.title | truncate:200 }} </a><small>{{ post.date }}</small>
         {% if post.summary %}
            <p class="entry">{{ post.summary }}</p>
         {% endif %}
      </li>
    </ul>
  </div>
{% endfor %}
