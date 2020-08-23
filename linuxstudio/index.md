---
layout: default
---

{% for post in site.categories.linuxstudio limit:30 %}

  <div class="post">
	{% if post.thumb %}
		<img class="entrythumb" src="/images/small/{{ post.thumb }}"/>

		<div class="entry">
			<a href="{{ post.url }}">{{ post.title | truncate:200 }} </a><small>{{ post.date | date_to_long_string: "ordinal" }}</small>
			<div class="entryexcerpt">{{ post.excerpt }}</div>
		</div>
	{% else %}
	         <div class="entry">{{ post.excerpt }}</div>
	{% endif %}
  </div>
{% endfor %}
