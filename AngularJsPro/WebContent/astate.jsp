<%@ page language="java" import="java.lang.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%    
String path = request.getContextPath();    
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
pageContext.setAttribute("basePath",basePath);    
%>
<!DOCTYPE html >
<html>
<head>
<base href=" <%=basePath%>">
 <meta http-equiv="pragma" content="no-cache">  
 <meta http-equiv="cache-control" content="no-cache">  
 <meta http-equiv="expires" content="0">      
 <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
 <meta http-equiv="description" content="This is my page"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> </title>
<script src="${basePath}js/jquery.min.js"></script>
<script src="AngularJS/angular.min.js"></script>
<script src="AngularJS/angular-route.min.js"></script>
<script src="AngularJS/angular-ui-router.min.js"></script>
<script type="text/javascript">
/* $stateProvider.state('index', {  
    url: '/index.html?id&name',         //参数必须先在这边声明  
    templateUrl: '../index.html',
    params: {'id': null,'name':null}//参数在这边声明 
})   */
var app = angular.module('myApp', ['ui.router'])
.config(["$stateProvider","$urlRouterProvider",routeConfig])
.controller("testCtrl", angular.noop);
function routeConfig($stateProvider,$urlRouterProvider){
      $urlRouterProvider.otherwise("/myApp/index");
      $stateProvider
      .state("myApp",{
            url:"/myApp",
            views:{
                "":{
                    templateUrl:"'index.html'"
                },
                "nav":{
                    templateUrl:"'home.html'"
                }
            }
        })
        .state("app.index",{
            url:"/index",
            templateUrl:"'index.html'"
        })
        .state("app.home",{
            url:"/home",
            templateUrl:"'home.html'"
        })
        .state("test",{
            url:"/test",
            views:{
            "":{
                templateUrl:"'index.html'"
            },
             "home":{
                    templateUrl:"'home.html'"
                }   
        }
        })
        .state("test.index",{
            url:"/index?:id",
            templateUrl:"'inex.html'",
            controller:["$stateParams",function($stateParams){
                console.log($stateParams.id);// 1  这里实现传参
            }],
            params:{
                id:null
            }
        })
        .state("test.home",{
            url:"/home",
            templateUrl:"'home.html'"
        })
  }
app.controller('testCtrl', function($scope, $state) {
    $state.go('index',{test:1111});
});
/* app.controller('oneController', ['$scope',function ($scope, $rootScope) {
	$scope.items = [  
       {state: "index", statePage: "index.html"},  
       {state: "home", statePage: "home.html"}  
     ];
   }]); */
/* app.state('message-list',{
	templateUr:"",
	controller:""
}); */
/* $stateProvider  
.state('page1', {  
  url: '/page1',  
  templateUrl: 'index.html',  
  controller: 'page1Ctrl'  
 })  
 .state('page2', {  
  url: '/page2/:type',  
  templateUrl: 'view/index.html',  
  controller: 'page2Ctrl'  
 });  
$state.go("page1");
$state.go("page2",{type:1});
$state.go('second', {  
    area: 'admin',  
    controller: 'mallmanage',  
    action:'detail'  
});  */
</script>
 
</head>
<body>
<!-- <span ng-app="myApp">
<a ui-sref="index({id:1,name:2})" >按钮</a>  
<li repeat="item in items">  
<a ui-sref="{{item.statePage}}">{{item.state}}</a>  
</li>  
 <a ui-sref="message-list">消息中心</a>
 </span> -->
 <div ng-app="myApp" ng-controller="testCtrl">
 <a ui-sref="app.index">首页</a>
  <!-- 这里是正常的跳转 -->
  <a ui-sref="app.index({id:1})">你的主页</a>
  <!-- 这里是带参数对象的跳转，名称是id，值是yourId -->
      <ol>
      <li><a ui-sref="app.index">app</a></li>
      <li><a ui-sref="test.home({id:1})">test</a></li>
      </ol>
      <div ui-view></div>
      <script type="text/ng-template" id="'index.html'">
          <div ui-view="index@"></div>
          <div ui-view></div>
      </script>
      <script type="text/ng-template" id="'home.html'">
          <ol>
          <li><a ui-sref="app.index">app.index</a></li>
          <li><a ui-sref="app.home">app.home</a></li
          </ol>
      </script>
      <script type="text/ng-template" id="'allClassrooms.html'">
          <ol>
          <li><a ui-sref="test.index({id:1})">test.index</a></li>
          <li><a ui-sref="test.home">test.home</a></li
          </ol>
      </script>
      <script type="text/ng-template" id="'index.html'">
      this is index for app.
      </script>
      <script type="text/ng-template" id="'home.html'">
      this is home for app.
      </script>
      <script type="text/ng-template" id="'allClassrooms.html'">
      this is allClassrooms for test.
      </script>
  </div>
</body>
</html>
