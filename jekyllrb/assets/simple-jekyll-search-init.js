SimpleJekyllSearch({
	//fuzzy : true,
	limit: 100,
	searchInput: document.getElementById('search-input'),
	resultsContainer: document.getElementById('results-container'),
	searchResultTemplate: '<li><span class="post-meta">{date}</span><h2><a class="post-link" href="{url}">{title}</a></h2><p>{description}</p></li>',
	//json: '/search-json.min.js'
	json: '/search-json.js'
})