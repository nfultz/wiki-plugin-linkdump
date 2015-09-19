###
 * Federated Wiki : Linkdump Plugin
 *
 * Licensed under the MIT license.
 * https://github.com/nfultz/wiki-plugin-nfultz/blob/master/LICENSE.txt
###

host = window.name


emit = (div, item) ->
	page = div.parents '.page'
	div.append """

<hr>Linkdump internals</hr>

<div id=marklet>
  <a href="javascript:(function(){S=document.getSelection().toString();U=(S ? S + ' --- ' : '') + '['+location.href+' '+document.title+']'; B='http://HOST/view/PAGE?';window.open(B+encodeURIComponent(U),'save-link','height=600,width=200,modal=yes,alwaysRaised=yes')})()"> PAGE - HOST</a> bookmarklet
</div> 

<script>
  var text=decodeURIComponent(document.location.search.substring(1));
  if(text.length > 0) {
    var item = {
                 type:"paragraph",
                 id:"19850725" +(Math.random() * 0x7FFFFFFF|0).toString(16),
                 text:text
               };
    var bundle = {
                   type: 'add',
                   id: item.id, 
                   item: item, 
                   date: (new Date()).getTime()
                 };
    var url = ["http:/", "HOST", "page", "PAGE", "action"].join("/");
    var req = new XMLHttpRequest();
    req.onload = function(x) {
        window.history.pushState("wiki","wiki","/view/PAGE");
        wiki.doInternalLink("PAGE");  
    };
    req.open("PUT", url, true);
    req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    req.send("action="+JSON.stringify(bundle));
  }
 </script> Scriptfu

""".replace(/HOST/g, host).replace(/PAGE/g, page[0].id)

bind = (div, item) ->

window.plugins.linkdump = {emit, bind} if window?
