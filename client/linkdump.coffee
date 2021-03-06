###
 * Federated Wiki : Linkdump Plugin
 *
 * Licensed under the MIT license.
 * https://github.com/nfultz/wiki-plugin-nfultz/blob/master/LICENSE.txt
###



emit = (div, item) ->
	host = window.name
	page = div.parents '.page'
	page = page[0].id
	text=decodeURIComponent(document.location.search.substring(1));
	if text.length > 0
		item = {
				type:"paragraph",
				id:"19850725" +(Math.random() * 0x7FFFFFFF|0).toString(16),
				text:text
				};
		bundle = {
				 type: 'add',
				 id: item.id, 
				 item: item, 
				 date: (new Date()).getTime()
				 };
		url = ["http:/", host, "page", page, "action"].join("/");
		req = new XMLHttpRequest();
		req.onload = (x) ->
			window.history.pushState("wiki","wiki","/view/" + page);
			wiki.doInternalLink(page);	
		;
		req.open("PUT", url, true);
		req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		req.send("action="+JSON.stringify(bundle));
	
	div.append """

<hr/>Linkdump --- 

  <a href="javascript:(function(){S=document.getSelection().toString();U=(S ? S + ' --- ' : '') + '['+location.href+' '+document.title+']'; B='http://HOST/view/PAGE?';window.open(B+encodeURIComponent(U),'save-link','height=600,width=200,modal=yes,alwaysRaised=yes')})()"> PAGE - HOST</a> bookmarklet

""".replace(/HOST/g, host).replace(/PAGE/g, page)

bind = (div, item) ->

window.plugins.linkdump = {emit, bind} if window?
