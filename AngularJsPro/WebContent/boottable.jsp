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
 <link rel="stylesheet" href="${basePath}bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${basePath}bootstrap/table/bootstrap-table.css">
<link rel="stylesheet" href="${basePath}js/laydate/need/laydate.css">
<link rel="stylesheet" href="${basePath}js/laydate/skins/default/laydate.css">
<script src="${basePath}js/jquery.min.js"></script>
<script src="${basePath}bootstrap/bootstrap.min.js"></script>
<script src="${basePath}bootstrap/table/bootstrap-table.min.js"></script>
<script src="${basePath}bootstrap/table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${basePath}bootstrap/table/export/bootstrap-table-export.js"></script>
<script src="js/laydate/laydate.js"></script>
<%-- <script src="${basePath}bootstrap/table/export/tableExport.js"></script> --%>
<script type="text/javascript">
$(function () {
    initTable();
    initDate();
});

function doQuery(params){
    $('#table').bootstrapTable('refresh');    //刷新表格
}

function initTable(){
	layer = $("#layer");
	$('#dtable').bootstrapTable('destroy'); 
    var url = "customers/dataList.json";//&random=+Math.random();
    $("#dtable").bootstrapTable({
        method:'POST',
        dataType:'json',
        contentType: 'application/x-www-form-urlencoded',
        cache: false,
      //  data:[{"total":11,"rows":[{"birthday":"1999\u5E745\u670811\u65E5","address":"\u4E0A\u6D77\u6D66\u4E1C\u65B0\u533A\u9646\u5BB6\u5634","city":"120000","nickName":"\u9F99\u9F99","mobile":"15574896321","updateTime":"2017-06-06 19:01:43","telephone":"15574896321","customerName":"\u9F99\u9F99","valid":1,"createTime":"2017-06-06 19:01:43","scope":"120000","district":"15574896321","customerId":"0205b1ec4327407793a56e22e8c87aeb","id":"0205b1ec4327407793a56e22e8c87aeb","email":"zpclord@sina.com","introduction":"","status":1},{"birthday":"1980\u5E741\u670809\u65E5","address":"\u5317\u4EAC\u987A\u4E49","city":"\u5317\u4EAC","nickName":"\u4E66\u7EAA","mobile":"010-11223344","updateTime":"2016-07-12 13:41:27","telephone":"15566667777","customerName":"\u5927\u536B","valid":1,"createTime":"2016-07-12 13:41:23","scope":"450000","district":"\u987A\u4E49","customerId":"84D3ED7C4FE911E689E8A3D2369547A7","id":"2CED3B1A057447B18302B104D4033C48\r\n","email":"zpclord@cmbc.com.cn","introduction":"\u524D\u603B\u7ED3\u5DE5\u4F5C ","status":1},{"birthday":"1985\u5E741\u670824\u65E5","address":"\u5929\u56FD","city":"Shanghai,China","nickName":"\u65E0\u6781","mobile":"+8615900827825","updateTime":"2016-07-25 13:41:07","telephone":"+8615900827825","customerName":"\u65E0\u6781","valid":1,"createTime":"2016-07-25 11:40:16","scope":"110000","district":"","customerId":"62EC05C90C884FF18E5016323DD783FB","id":"62EC05C90C884FF18E5016323DD783FB","email":"dd@vip.acom","introduction":"","status":1},{"birthday":"1988\u5E746\u670830\u65E5","address":"\u4E2D\u56FD\u5927\u9646\u4E0A\u6D77\u5E02\u95F5\u884C\u533A\u5317\u534E\u8DEF168\u5F04","city":"Shanghai,China","nickName":"\u6768\u6D66\u6797","mobile":"13341169872","updateTime":"2016-07-14 16:24:55","telephone":"+8615900827811","customerName":"John","valid":1,"createTime":"2016-07-14 16:24:55","scope":"120000","district":"\u95F5\u884C\u533A","customerId":"AC0F8E114FE911E689E8A3D2369547A7","id":"6A36C12213CE45AB8654F5B3D6F2C558","email":"yyy@sina.vip.com","introduction":"\u5B66\u4E60\u8BA4\u8BC6\u53E4\u4EE3\u8FD1\u4E1C\u7684\u4E16\u754C\u89C2\uFF0C\u80FD\u4F7F\u6211\u4EEC\u907F\u514D\u72AF\u9519\uFF0C\u5E76\u4F7F\u6211\u4EEC\u5BF9\u7ECF\u6587\u7684\u7406\u89E3\uFF0C\u4E0E\u5F53\u65F6\u7684\u4EE5\u8272\u5217\u4EBA\u66F4\u63A5\u8FD1\u3002","status":2},{"birthday":"1980\u5E741\u670809\u65E5","address":"\u4E2D\u56FD\u9999\u6E2F","city":"140000","nickName":"\u674E","mobile":"15578964123","updateTime":"2017-06-06 19:31:30","telephone":"15578964123","customerName":"\u674E","valid":1,"createTime":"2017-06-06 19:31:30","scope":"140000","district":"15578964123","customerId":"7dc72611152a4421a276b34e4c0d96bf","id":"7dc72611152a4421a276b34e4c0d96bf","email":"zpclord@sina.com","introduction":"","status":1},{"birthday":"1989\u5E741\u670815\u65E5","address":"\u6CB3\u5357\u6F2F\u6CB3","city":"\u4E0A\u6D77","nickName":"\u539F\u5730\u533A","mobile":"+8615900827825","updateTime":"2016-07-12 18:59:41","telephone":"+8615900827825","customerName":"\u7EA6\u62FF\u5355","valid":1,"createTime":"2016-07-12 18:59:41","scope":"140000","district":"\u786E\u6709\u5176\u4E8B","customerId":"B91DB89F4FE911E689E8A3D2369547A7","id":"B91DB89F4FE911E689E8A3D2369547A7","email":"zpclord@sina.com","introduction":"\u5728\u6B64\u4E4B\u524D","status":1},{"birthday":"1980\u5E741\u670809\u65E5","address":"\u5317\u4EAC\u987A\u4E49","city":"\u5317\u4EAC","nickName":"\u4E66\u7EAA","mobile":"10","updateTime":"2017-06-02 11:09:50","telephone":"15566667777","customerName":"\u5927\u536B","valid":1,"createTime":"2017-06-02 11:09:50","scope":"440000","district":"\u987A\u4E49","customerId":"a44265dba4894279bebd51a0d5992f1b","id":"bbbed24d04044db488633a74a17ff5d8","email":"zpclord@cmbc.com.cn","introduction":"\u524D\u603B\u7ED3\u5DE5\u4F5C ","status":1},{"birthday":"1992\u5E747\u670802\u65E5","address":"\u56DB\u5DDD\u6210\u90FD","city":"Shanghai,China","nickName":"\u975E\u673A\u52A8\u8F66","mobile":"+8615900827825","updateTime":"2016-07-12 18:22:07","telephone":"+8615900827825","customerName":"\u7EB8\u76D2","valid":1,"createTime":"2016-07-12 18:22:07","scope":"150000","district":"\u5385\u9B42\u7275\u68A6\u8426","customerId":"B395868E4FE911E689E8A3D2369547A7","id":"BBD581F3A5EA4ED6905282C3134CAA7F\r\n","email":"peter@usts.edu","introduction":"\u593A\u65E0\u5947\u4E0D\u6709","status":2},{"birthday":"1980\u5E741\u670809\u65E5","address":"\u4E2D\u56FD\u53F0\u5317","city":"140000","nickName":"\u674E","mobile":"15578964123","updateTime":"2017-06-06 19:30:53","telephone":"15578964123","customerName":"\u674E","valid":1,"createTime":"2017-06-06 19:30:53","scope":"140000","district":"15578964123","customerId":"c4089d8ebd9d40d9adb95cad36d9e352","id":"c4089d8ebd9d40d9adb95cad36d9e352","email":"zpclord@sina.com","introduction":"","status":1},{"birthday":"1999\u5E747\u670829\u65E5","address":"\u5E7F\u5DDE\u5929\u6CB3\u673A\u573A","city":"\u7801\u5934","nickName":"\u5EB7\u957F","mobile":"13543969872","updateTime":"2016-07-14 16:35:22","telephone":"021-11113455","customerName":"\u5EB7\u957F","valid":1,"createTime":"2016-07-14 16:35:22","scope":"220000","district":"\u6E7E\u4ED4","customerId":"CF84A6D74FE911E689E8A3D2369547A7","id":"DCB2E1E8047A443FAB4F777EF7F631EA","email":"holy@heaven.lord","introduction":"\u7F8E\u7D22\u4E0D\u8FBE\u7C73\u4E9A","status":0}]}],
        striped: true,                              //是否显示行间隔色
        sidePagination: 'server',           //分页方式：client客户端分页，server服务端分页（*）
        url:url,
        //height: $(window).height() - 110,
        width:$(window).width(),
        showColumns:true,
        pagination:true,
        queryParams : queryParams,//queryParams,
        minimumCountColumns:2,
        pageNumber:1,                       //初始化加载第一页，默认第一页
        search: true, //是否启用查询
        showColumns: true, //显示下拉框勾选要显示的列 
        showRefresh: true, //显示刷新按钮 
        pageSize: 20,                       //每页的记录行数（*）
        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
        uniqueId: 'id',                     //每一行的唯一标识，一般为主键列
        showExport: true,                    
        exportDataType: 'all',
        responseHandler: responseHandler,
        columns: [
        {
            field: ' ',
                    title: 'Sort No.',
                    formatter: function (value, row, index) {
                    return index+1;
             }
        },
        {
            field : 'id',
            title : '主键',
            align : 'center',
            valign : 'middle',
            sortable : true
        }, {
            field : 'customerId',
            title : '客户编号',
            align : 'center',
            valign : 'middle',
            sortable : true
        }, {
            field : 'customerName',
            title : '客户姓名',
            align : 'center',
            valign : 'middle'
        }, {
            field : 'mobile',
            title : '客户电话',
            align : 'center',
            valign : 'middle',
            sortable : true
        }, {
            field : 'email',
            title : '邮箱',
            align : 'center',
            valign : 'middle'
        }, {
            field : 'createTime',
            title : '创建时间',
            align : 'center',
            valign : 'left',
            formatter : function (value, row, index){
            	return value;
              //  return new Date(value);.format('yyyy-MM-dd hh:mm:ss');
            }
        }, {
            field : 'address',
            title : '客户地址',
            align : 'center',
            valign : 'middle'
        }],
        onLoadSuccess: function(){ //加载成功时执行 
            console.log("加载成功"); 
        }, 
        onLoadError: function(){ //加载失败时执行 
        	console.log("加载数据失败", {time : 1500, icon : 2}); 
        } 
    });
}

function initDate(){
    var start = {
            elem: '#birthday',
            format: 'YYYY-MM-DD hh:mm:ss',
            min: laydate.now(-7),       
            max: laydate.now(),
            istime: true,
            istoday: false,
            choose: function (datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };
        var end = {
            elem: '#createTime',
            format: 'YYYY-MM-DD hh:mm:ss',
            min: laydate.now(-7),       
            max: laydate.now(),
            istime: true, //是否开启时间选择
            isclear: true, //是否显示清空
            istoday: true, //是否显示今天
            issure: true, //是否显示确认
            choose: function (datas) {
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        laydate(start);
        laydate(end);
}

function queryParams(params) {
    var param = {
        city : $("#city").val(),
        customerName : $("#customerName").val(),
        birthday : $("#birthday").val(),
        createTime : $("#createTime").val(),
        limit : this.limit, // 页面大小
        offset : this.offset, // 页码
        pageNumber : this.pageNumber,
        pageSize : this.pageSize,
        random : Math.random()
    }
    return param;
} 

// 用于server 分页，表格数据量太大的话 不想一次查询所有数据，可以使用server分页查询，数据量小的话可以直接把sidePagination: "server"  改为 sidePagination: "client" ，同时去掉responseHandler: responseHandler就可以了，
function responseHandler(res) { 
    if (res) {
        return {
            "rows" : res.rows,
            "total" : res.total
        };
    } else {
        return {
            "rows" : [],
            "total" : 0
        };
    }
}
</script>
</head>
<body>
<div id="layer"></div>
    <div class="row base-margin" id="query">
        <ol class="breadcrumb">
            <li><strong><span style="color: #27a0d7">用户列表</span></strong></li>
        </ol>
        <form class="form-inline" role="form" style="float: left; width: 100%" method="post" id="queryForm">
            <div class="form-group">
                <label for="city">城市:</label> 
                <select class="form-control" id="city" name="city">   
                    <option value="">默认选择</option>
                    <c:forEach var="data" items="${orgList}">
                        <option value="${data.city }">${data.city }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="customerName">名称:</label> 
                <input type="text" class="form-control" name="customerName" id="customerName"  placeholder="请输入名称">
            </div>
            <div class="form-group">
                <label >日期:</label>
                <input placeholder="生日" class="form-control layer-date" id="birthday" name="birthday">
                <input placeholder="创建日期" class="form-control layer-date" id="createTime" name="createTime">
            </div>
            <div class="form-group">
                <button type="button" id="queryBtn" onclick="doQuery();" class="btn btn-primary">查询</button>
            </div>
            <div class="form-group btn-right">
                <button type="button" class="btn btn-primary" id="addBtn" onclick="addUser();">新增用户</button>
            </div>
        </form>
    </div>
    <div class="container" style="width: 100%">
        <table id="dtable" data-toggle="table"
			data-toolbar=" "
			data-height="460"
			data-side-pagination="server"
			data-pagination="true"
			data-url="customers/dataList.json">
        </table>
      <!--   <div id="toolbar">
			<button id="button" class="btn btn-default">getData</button>
		</div> -->
    </div>
</body>
</html>
