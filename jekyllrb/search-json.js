---

layout: null

---

[
  {% for post in site.posts %}
    {
      "title"      : "{{ post.title | escape }}",
      "categories" : "{{ post.categories | join: ', ' }}",
      "tags"       : "{{ post.tags | join: ', ' }}",
      "url"        : "{{ site.baseurl }}{{ post.url }}"
    } {% unless forloop.last %},{% endunless %}
  {% endfor %}
]