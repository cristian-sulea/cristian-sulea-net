---
date: 2024-03-23

title: "Jekyll Instant Search"
tags:  "website, jekyll, search"

sources:
  - "<https://github.com/christian-fei/Simple-Jekyll-Search>"
  - "<https://kevquirk.com/how-to-add-search-jekyll>"
  - "<https://blog.webjeda.com/instant-jekyll-search/>"
---


To add search functionality to a static website (such as one created with Jekyll),
a simple and fast solution is to create a local index and then search our keywords in it using a JavaScript.
The simplest instant search available for Jekyll so far is Simple Jekyll Search developed by Christian Fei.

How it works:
1. all kinds of metadata from site pages is pulled;
2. and compiled into the `search.json` file  at build time;
3. and then a little bit of JavaScript parses that file for the searched keywords;
4. which is then instantly displayed on-screen.

## Create the data file

Create the `search.json` file in the **root of the Jekyll website**.

```liquid
{%- raw -%}
---
layout: none
---
[
  {% for post in site.posts %}
    {
      "title"    : "{{ post.title | escape }}",
      "desc"     : "{{ post.content | strip_html | strip_newlines | escape | truncate: 300 }}",
      "url"      : "{{ site.baseurl }}{{ post.url }}",
      "date"     : "{{ post.date }}"
    } {% unless forloop.last %},{% endunless %}
  {% endfor %}
]
{% endraw %}
```

If you try it on a local machine, you can check `search.json` in the `_site` folder to see if all the values are generated or not.

The output would look something like this:

```json
[
  {
    "title"   : "Website Validation, Speed and Performance Optimization",
    "desc"    : "A list of links with speed tests, tools and techniques to optimize page speed and the overall website performance.Managing page speed (the speed at which the website loads and reacts to user input) can drastically improve user experience (UX) and search engine optimization (SEO).Speed      Google...",
    "url"     : "/blog/website-validation-speed-performance-optimization/",
    "date"    : "Jan 7, 2019"
  },{
    "title"   : "Spring - Quick start tutorial",
    "desc"    : "The Spring Framework is an open source application framework and inversion of control container for the Java platform.The framework’s core features can be used by any Java application, but there are extensions for building web applications on top of the Java EE platform.Although the framework doe...",
    "url"     : "/blog/spring-quick-start-tutorial/",
    "date"    : "May 27, 2013"
  }
]
```


## Add the JavaScript & HTML Form

The instructions on Chris's repository recommend pulling the JS from NPM's CDN via a `<script>` element
in the `<head>` of the site's default layout. But:
1. we don't want to load a JavaScript on every single page if it's only needed on one (search) page;
2. we also dont want to add any third party requests on page load.

So instead download the search script
([GitHub direct link](https://raw.githubusercontent.com/christian-fei/Simple-Jekyll-Search/master/dest/simple-jekyll-search.js))
and save it as `search-script.js` (or any other name you prefer).

Then, inside the `_includes` folder, create another file named `search-form.html` (or any other name you prefer) with
the following content:

```html
<!-- Html Elements for Search -->
<div id="search-container">
<input type="text" id="search-input" placeholder="Search...">
<ul id="results-container"></ul>
</div>

<!-- Script pointing to search-script.js -->
<script src="/path/to/search-script.js" type="text/javascript"></script>

<!-- Configuration -->
<script>
  SimpleJekyllSearch({
    searchInput: document.getElementById('search-input'),
    resultsContainer: document.getElementById('results-container'),
    json: '/search.json'
  })
</script>
```

What this code does is call the `search-script.js` file,
add the actual search field, and finally configure the results that are displayed.

Since this is in the `_includes` folder and contains everything needed to perform a search,
it can be added anywhere on the page knowing that the JS will only be loaded where it is needed.

To embed the search field into any page, simply add the following code wherever you want it to appear:

```liquid
{%- raw -%}
{% include search-form.html %}
{% endraw %}
```


## Customization

The default Jekyll search result will be in this format:

```html
<li><a href="{url}">{title}</a></li>
```

But it can be changed in the configuration script:

```html
searchResultTemplate: '<div><a href="{url}"><h1>{title}</h1></a><span>{date}</span></div>'
```

The {url}, {title}, {date} are the respective data found in the JSON file.

A custom message can also be displayed when no result is found by adding this line to the configuration script:

```js
noResultsText ('No result found!')
```

There are many other configurations that can be tweaked, for example:

```html
<!-- Configuration -->
<script>
  SimpleJekyllSearch({
    searchInput: document.getElementById('search-input'),
    resultsContainer: document.getElementById('results-container'),
    json: '/search.json',
    searchResultTemplate: '<li><a href="{url}" title="{desc}">{title}</a></li>',
    noResultsText: 'No results found',
    limit: 10,
    fuzzy: false
  })
</script>
```

Visit the [GitHub / Simple-Jekyll-Search](https://github.com/christian-fei/Simple-Jekyll-Search) repository
to learn more.
