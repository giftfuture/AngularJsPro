<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="${basePath}js/jquery.min.js"></script>
<script src="AngularJS/angular.min.js"></script>
<script type="text/javascript">
document.writeln("获取另一个页面存储的localStorage内容："+window.localStorage);
document.writeln("遍历localStorage:"+"<br/>");
var localStorage =  window.localStorage;
for (var i=0, len = localStorage.length; i  < len; i++){  
    var key = localStorage.key(i);    
    var value = localStorage.getItem(key);     
    document.writeln(key + "=" + value); 
}
document.writeln("获取另一个页面存储的sessionStorage内容："+window.sessionStorage);
document.writeln("<br/>遍历sessionStorage:"+"<br/>");
var sessionStorage = window.sessionStorage;
for (var i=0, len = sessionStorage.length; i  < len; i++){  
    var key = sessionStorage.key(i);    
    var value = sessionStorage.getItem(key);     
    document.writeln(key + "=" + value); 
}

</script>
  <style>
    div{margin-top: 15px;border: 2px solid rebeccapurple;width: 400px;}
  </style>
  
</head>
<body>
 
 
 
 

</body>
</html>