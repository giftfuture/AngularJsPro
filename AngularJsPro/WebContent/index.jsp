<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="${basePath}js/jquery.min.js"></script>
<script src="AngularJS/angular.min.js"></script>
<script type="text/javascript">
var app = angular.module('myApp', []);
    app.controller('oneController', ['$scope', '$rootScope', function ($scope, $rootScope) {
	 // 局部的变量，只有在oneController中才会显示
	 $scope.one_language = 'Python';
	 // 全局的变量，都可以调用
	 $rootScope.language = 'Go';
	}]);
    app.controller('twoController', ['$scope', function ($scope) {
	 // 局部的变量，只有在twoController中才会显示
	 $scope.two_language = 'Java';
	}]);
    
    app.factory('locals', ['$window', function ($window) {
        return {        //存储单个属性
            set: function (key, value) {
                $window.sessionStorage[key] = value;
            },        //读取单个属性
            get: function (key, defaultValue) {
                return $window.sessionStorage[key] || defaultValue;
            },        //存储对象，以JSON格式存储
            setObject: function (key, value) {
                $window.sessionStorage[key] = JSON.stringify(value);//将对象以字符串保存
            },        //读取对象
            getObject: function (key) {
                return JSON.parse($window.sessionStorage[key] || '{}');//获取字符串并解析成对象
            }

        }
    }]);
    
    
    //=========本地存储数据服务============
    app.factory('locals', ['$window', function ($window) {
        return {        //存储单个属性
            set: function (key, value) {
                $window.localStorage[key] = value;
            },        //读取单个属性
            get: function (key, defaultValue) {
                return $window.localStorage[key] || defaultValue;
            },        //存储对象，以JSON格式存储
            setObject: function (key, value) {
                $window.localStorage[key] = JSON.stringify(value);//将对象以字符串保存
            },        //读取对象
            getObject: function (key) {
                return JSON.parse($window.localStorage[key] || '{}');//获取字符串并解析成对象
            }

        }
    }]);
    
    
</script>
  <style>
    div{margin-top: 15px;border: 2px solid rebeccapurple;width: 400px;}
  </style>
</head>
<body>
<!-- <span ng-app="myApp">
  <div>
    <h3>我是全局变量language: {{ language}}</h3>
  </div>
  <div ng-controller="oneController">
    <h3>我是one_language局部变量: {{ one_language}}</h3>
  </div>
  <div ng-controller="twoController">
    <h1>twoController</h1>
    <h3>我是two_language局部变量: {{ two_language }}</h3>
    <h3>我是one_language局部变量: {{ one_language}}</h3>
    <h3>我是全局变量language: {{ language }}</h3>
  </div>
</span> -->
 <span ng-app="myApp">
<div ng-controller="oneController">
	<p>局部变量one_language:{{one_language}}</p>
	<p>局部变量two_language:{{two_language}}</p>
	<p>全局变量language:{{language}}</p>
</div>
<div ng-controller="twoController">
	<p>局部变量one_language:{{one_language}}</p>
	<p>局部变量two_language:{{two_language}}</p>
	<p>全局变量language:{{language}}</p>
</div>
</span> 
<script type="text/javascript">
	 document.writeln();
if(window.localStorage){ 
    document.writeln("浏览支持localStorage<br/>");
}else{ 
    document.writeln("浏览暂不支持localStorage");
} //或者 if(typeof window.localStorage == 'undefined'){  alert("浏览暂不支持localStorage") }
if(window.sessionStorage){ 
    document.writeln("浏览支持sessionStorage");
}else{ 
    document.writeln("浏览暂不支持sessionStorage");
}   
</script>
<pre>
localStorage和sessionStorage一样都是用来存储客户端临时信息的对象。

他们均只能存储字符串类型的对象（虽然规范中可以存储其他原生类型的对象，但是目前为止没有浏览器对其进行实现）。

localStorage生命周期是永久，这意味着除非用户显示在浏览器提供的UI上清除localStorage信息，否则这些信息将永远存在。

sessionStorage生命周期为当前窗口或标签页，一旦窗口或标签页被永久关闭了，那么所有通过sessionStorage存储的数据也就被清空了。

不同浏览器无法共享localStorage或sessionStorage中的信息。相同浏览器的不同页面间可以共享相同的 localStorage（页面属于相同域名和端口），但是不同页面或标签页间无法共享sessionStorage的信息。
<br/>这里需要注意的是，页面及标 签页仅指顶级窗口，如果一个标签页包含多个iframe标签且他们属于同源页面，那么他们之间是可以共享sessionStorage的。
localStorage和sessionStorage操作
localStorage和sessionStorage都具有相同的操作方法，例如setItem、getItem和removeItem等
setItem存储value

用途：将value存储到key字段
用法：.setItem( key, value)
代码示例：

    sessionStorage.setItem("key", "value");     localStorage.setItem("site", "js8.in");
getItem获取value

用途：获取指定key本地存储的值
用法：.getItem(key)
代码示例：

    var value = sessionStorage.getItem("key");  var site = localStorage.getItem("site");
removeItem删除key

用途：删除指定key本地存储的值
用法：.removeItem(key)
代码示例：

    sessionStorage.removeItem("key");   localStorage.removeItem("site");
clear清除所有的key/value

用途：清除所有的key/value
用法：.clear()
代码示例：

    sessionStorage.clear();     localStorage.clear();
    其他操作方法：点操作和[].
    var storage = window.localStorage; storage.key1 = "hello"; storage["key2"] = "world"; console.log(storage.key1); console.log(storage["key2"]);
    localStorage和sessionStorage的key和length属性实现遍历

sessionStorage和localStorage提供的key()和length可以方便的实现存储的数据遍历.
storage还提供了storage事件，当键值改变或者clear的时候，就可以触发storage事件.
</pre>
下面是代码部分：<br/>
<script type="text/javascript">
	var sessionStorage = window.sessionStorage;
	var localStorage = window.localStorage;
	sessionStorage.setItem("key", "cjlr");  
	document.writeln("sessionStorage存入item key:"+"cjlr<br/>");
	localStorage.setItem("site", "baidu");
	document.writeln("localStorage存入item "+"site:baidu<br/>");
	 var value = sessionStorage.getItem("key"); 
	 var site = localStorage.getItem("site");
	 document.writeln("sessionStorage getItem:key="+value+"<br/>");
	 document.writeln("localStorage getItem:site="+site+"<br/>");
	 document.writeln("sessionStorage移除元素key=cjlr "+sessionStorage.removeItem("key")+"<br/>");
	 document.writeln("localStorage移除元素site=baidu "+localStorage.removeItem("site")+"<br/>");
	 sessionStorage.setItem("kkk", "aaaa");  
	 sessionStorage.setItem("aaa", "kkkk"); 
     document.writeln("sessionStorage再次存入item kkk:"+"aaaa"+"<br/>");
     document.writeln("sessionStorage再次存入item aaaa:"+"kkk"+"<br/>");
     localStorage.setItem("ttt", "baidubaidu");
     localStorage.setItem("baidubaidu", "ttt");
     document.writeln("localStorage再次存入item ttt:"+"baidubaidu"+"<br/>");
     document.writeln("localStorage再次存入item baidubaidu:"+"ttt"+"<br/>");
     document.writeln("遍历localStorage:"+"<br/>");
	for (var i=0, len = localStorage.length; i  < len; i++){  
		var key = localStorage.key(i);    
		var value = localStorage.getItem(key);     
		document.writeln(key + "=" + value); 
	}
   document.writeln("<br/>遍历sessionStorage:"+"<br/>");
    for (var i=0, len = sessionStorage.length; i  < len; i++){  
        var key = sessionStorage.key(i);    
        var value = sessionStorage.getItem(key);     
        document.writeln(key + "=" + value); 
    }
     sessionStorage.clear(); 
     document.writeln("<br/>清空sessionStorage后sessionStorage.length="+sessionStorage.length+"<br/>"); 
     localStorage.clear();
     document.writeln("<br/>清空localStorage后localStorage.length="+localStorage.length+"<br/>"); 
     sessionStorage.setItem("aaa", "bbbb");  
     sessionStorage.setItem("bbbb", "aaa"); 
     document.writeln("sessionStorage最后再次存入item aaa:"+"bbbb"+"<br/>");
     document.writeln("sessionStorage最后再次存入item bbbb:"+"aaa"+"<br/>");
     localStorage.setItem("ccc", "googlegoogle");
     localStorage.setItem("googlegoogle", "ccc");
     document.writeln("localStorage最后再次存入item ccc:"+"googlegoogle"+"<br/>");
     document.writeln("localStorage最后再次存入item googlegoogle:"+"ccc"+"<br/>");
     if(window.addEventListener){ 
    	   window.addEventListener("storage",handle_storage,false); 
   	 }else if(window.attachEvent){ 
  		   window.attachEvent("onstorage",handle_storage); 
	 } 
     function handle_storage(e){   if(!e){e=window.event;}  }
</script>

</body>
</html>