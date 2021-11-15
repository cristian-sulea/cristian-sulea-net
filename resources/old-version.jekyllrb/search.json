---

layout: null

---
{%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
[
  {% for post in site.posts %}
    {
      "title"         : "{{ post.title | escape }}",
      "description"   : "{{ post.description | escape }}",
      "categories"    : "{{ post.categories | join: ' ' }}",
      "tags"          : "{{ post.tags | join: ' ' }}",
      "cats_tags_cats": "{{ post.categories | join: ' ' }} {{ post.tags | join: ' ' }} {{ post.categories | join: ' ' }}",
      "url"           : "{{ post.url | relative_url }}",
      "date"          : "{{ post.date | date: date_format }}"
    } {% unless forloop.last %},{% endunless %}
  {% endfor %}
]