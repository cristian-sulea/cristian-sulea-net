var searchLauncher = document.getElementById("searchLauncher");
var searchInput = document.getElementById("search-input");
var searchOutputContainer = document.getElementById("results-container");

SimpleJekyllSearch({
	fuzzy : true,
	searchInput: searchInput,
	resultsContainer: searchOutputContainer,
	json: "/search.json.js"
})

var searchContainer = document.getElementById('searchContainer');
var searchContainerCloseButton = document.getElementById('searchContainerCloseButton');

searchLauncher.onclick = function() {
	
	searchInput.value = '';
	searchOutputContainer.innerHTML = '';
	
	searchContainer.style.display = "block";
    
    searchInput.focus();
}

searchContainerCloseButton.onclick = function() {
	searchContainer.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == searchContainer) {
    	searchContainer.style.display = "none";
    }
}
