###
 * Federated Wiki : Linkdump Plugin
 *
 * Licensed under the MIT license.
 * https://github.com/nfultz/wiki-plugin-nfultz/blob/master/LICENSE.txt
###


emit = ($item, item) ->
	$item.append """

<hr>Linkdump internals</hr>

<div id=marklet>
  <a href="javascript:(function(){S=document.getSelection().toString();U=(S ? S + ' --- ' : '') + '['+location.href+' '+document.title+']'; B='http://%s/view/linkdump?';window.open(B+encodeURIComponent(U),'save-link','height=600,width=200,modal=yes,alwaysRaised=yes')})()"> LinkDump - %s</a> bookmarklet
</div> 

<script>  var x = document.getElementById("marklet"); x.innerHTML = x.innerHTML.replace(/%s/g, location.host); </script>

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
    var url = ["http:/", document.location.host, "page", "linkdump", "action"].join("/");
    var req = new XMLHttpRequest();
    req.onload = function(x) {document.location.search=""};
    req.open("PUT", url, true);
    req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    req.send("action="+JSON.stringify(bundle));
    alert("Saved!");
  }
 </script> Scriptfu

"""

bind = (div, item) ->

window.plugins.linkdump = {emit, bind} if window?
