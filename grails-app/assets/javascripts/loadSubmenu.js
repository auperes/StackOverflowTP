function $(id) { return document.getElementById(id); }

document.addEventListener('contextmenu', event => event.preventDefault());

var tabLinks = new Array();
var contentDivs = new Array();

function getFirstChildWithTagName(element, tagName)
{
	for (var i = 0; i < element.childNodes.length; i++)
		if (element.childNodes[i].nodeName == tagName)
			return element.childNodes[i];
};
	 
function getHash(url)
{
	var hashPos = url.lastIndexOf('#');
	return url.substring(hashPos + 1);
};

function showTab()
{
	var selectedId = getHash(this.getAttribute('data-tab'));

	for (var id in contentDivs)
	{
		if (id == selectedId)
		{
			tabLinks[id].className = 'navbar-item navbar-item-selected';
			contentDivs[id].className = 'page';
		}

		else
		{
			tabLinks[id].className = 'navbar-item';
			contentDivs[id].className = 'page hidden';
		}
	}

	return false;
};

var tabListItems = $('navbar').childNodes;
for (var i = 0; i < tabListItems.length; i++)
{
	if (tabListItems[i].nodeName == 'LI')
	{
		var tabLink = getFirstChildWithTagName(tabListItems[i], 'A');
		var id = getHash(tabLink.getAttribute('data-tab'));
		tabLinks[id] = tabLink;
		contentDivs[id] = $(id);
	}
}

var i = 0;
for (var id in tabLinks)
{
	tabLinks[id].onclick = showTab;
	if (i == 0) tabLinks[id].className = 'navbar-item navbar-item-selected';
	i++;
}

var i = 0;
for (var id in contentDivs)
{
	if (i != 0) contentDivs[id].className = 'page hidden';
	i++;
}

