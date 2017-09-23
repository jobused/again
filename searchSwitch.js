// ==UserScript==
// @name         New Userscript
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        http://*/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Your code here...
    document.onkeydown=function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==83 && e.altKey){ // 按 Esc
            //要做的事情
            var hostname=location.hostname;
            var search=location.search;
            if(hostname=="www.baidu.com"){
                var wd=search.match(/(\?|\&)wd=(.*?)\&/);
                if(wd==null){
                    wd=search.match(/(\?|\&)wd=(.*?)$/);
                }
                location.replace("https://www.google.com/search?q="+RegExp.$2);
            }else{
                var wd=search.match(/(\?|\&)q=(.*?)\&/);
                if(wd==null){
                    wd=search.match(/(\?|\&)q=(.*?)$/);
                }
                location.replace("https://www.baidu.com/s?wd="+RegExp.$2);
            }
        }
    };
})();
