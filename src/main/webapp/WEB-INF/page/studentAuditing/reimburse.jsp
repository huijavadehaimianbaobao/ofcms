<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath + "/"%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="static/css/all.css" type="text/css" />
<link rel="stylesheet" href="static/css/default.css" type="text/css" />
<script type="text/javascript"
	src="static/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="static/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="static/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet"
	href="static/jquery-easyui-1.4.1/themes/default/easyui.css"
	type="text/css" />
<link rel="stylesheet" href="static/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet" href="static/jquery-easyui-1.4.1/themes/icon.css"
	type="text/css" />
<script type="text/javascript">
	$(function(){
		init();
	})
	
	
	function init(){
	$('#listData').datagrid({
        url: 'unaudited/list?id=2',//请求方法的地址
        title: '查询结果',
        height: 500, 
        fitColumns: true, //列自适应 
        pagination: true,//是否有分页
        singleSelect: true,//是否单行选择
        pageSize:5,//页大小，一页多少条数据
        pageNumber: 1,//默认当前的页码
        pageList: [5, 10, 20],//一页可显示数据的条
        nowrap: false,//禁止文字自动换行
        loadMsg: '正在加载信息...',//当数据没有加载出来时显示的文字
        queryParams:{},//往后台传递参数，json格式 */
        columns: [[
      				{field:'student.id',title:'studentId',hidden:true,formatter:function(value, row, index){ return row.student.id}},    
	   				{field:'studentName',title:'学生姓名',width:80,align:'center',formatter:function(value, row, index){ return row.student.name}},    
	   				{field:'className',title:'班级',width:80,align:'center',formatter:function(value, row, index){ return row.student.classroom.name}},   
	   				{field:'tel',title:'联系方式',width:80,align:'center',formatter:function(value, row, index){ return row.student.tel}},    
	   				{field:'joinTime',title:'来校时间',width:80,align:'center',formatter:function(value, row, index){  return row.student.joinTime}},    
	   				{field:'tuition',title:'应缴学费(￥)',width:80,align:'center',formatter:function(value, row, index){ return row.student.tuition}},  
	   				{field:'amount',title:'实缴学费(￥)',width:80,align:'center',formatter:function(value, row, index){ if(row.amount==null)return 0 ; else return row.amount}},  
	   				{field:'billAmount',title:'应报金额(￥)',width:80,align:'center'},  
	   				{field:'amountReported',title:'实报金额(￥)',width:80,align:'center'},  
				{field:'auditState',title:'状态',width:80,align:'center',formatter : function(value, row, index) {
					if (value == 2) {
						return "待报销";
					}
				}},  
				{field:'remarks',title:'备注',width:80,align:'center'},  
				{field:'opt',title:'操作',width:80,align:'center',formatter:opt},
           ]]
       });
    }

	function opt(value,row,index){
		var str='<a href="javascript:void(0);" onclick="reimburse('+row.student.id+');">报销</a>';
		return str;
	}

	
	
	
	/**
	 * data数据  data.name中的name是model类中的名称
	 */
	function reimburse(studentId){
		$('#reimburseWin').window({
			title:'学生报销',
		});
		$('#reimburseWin').window('open');
		
		$.ajax({
			type:"post",
			url:"unaudited/getById",
			data:{studentId:studentId},
			success:function(data){
				$("#studentId").val(data.student.id);
				$("#studentName").val(data.student.name);
				$("#actualObject").val(data.actualObject);
				$("#classroom").val(data.student.classroom.name);
				$("#proxyTeacher").val(data.proxyTeacher.name);
				$("#studentTel").val(data.student.tel);
				$("#actualObjectTel").val(data.actualObjectTel);
				$("#yingFee").val(data.student.tuition);
				if(data.amount==null){$("#shiFee").val(0);}
				else{$("#shiFee").val(data.amount);}
				$("#yingAmount").val(data.billAmount);
				$("#shiAmount").val(data.amountReported);
				$('#tr2').nextAll().remove();
				$("#ticketVoucher").attr("src",data.ticketVoucher);
				for(var x=0;x<data.studentAuditings.length;x++){
					var str;
					var status =data.studentAuditings[x].auditStatus
					if(status==0){
						str="未审核"
					}else if(status==1){
						str="审核未通过"
					}else if(status==2){
						str="待报销"
					}else if(status==3){
						str="已报销"
					}else if(status==4){
						str="作废"
					}
					$('#tr2').after('<tr><td>'+data.studentAuditings[x].auditor+'</td>'+
							'<td>'+data.studentAuditings[x].auditTime+'</td>'+
							'<td>'+str+'</td>'+
							'<td>'+data.studentAuditings[x].remarks+'</td></tr>')
				};
			}

		})

	}

	
	function pass(val){
		if($('#date').textbox('getValue')==''){alert("审核时间不能为空"); return;}
		var fields = $('#reimburseForm').serialize()+"&auditStatus="+val;//获取checkForm中的数据并序列化(转换成字符串)
		console.log(fields);
		$.ajax({
			type:"post",//请求方法
			url:"studentAuditing/save",//请求的url地址
			data:fields,
			success:function(data){
				if(data=="用户请先登录"){
					alert(data);
				}else{
					$('#listData').datagrid('reload');				//保存后刷新table表格获取或删除数据
					$('#reimburseWin').window('close');				//关闭弹框
					$('#reimburseForm').form('clear');				//清楚form中的数据
				}
			}
		})
	}
	
	
	function search(){
		var date = $('#searchForm').serialize();	

		$('#listData').datagrid({"url":"unaudited/list?id=2&"+date});
	}
	
	function clean(){
		$('#searchForm').form('clear');
		$('#listData').datagrid({'url':'unaudited/list?id=2'});
		}
	
</script>
<title>Insert title here</title>
</head>
<body>
	
	<div>
		<form id="searchForm" action="" style="margin-top: 10px;margin-left:20px;">
		<div style="margin-bottom:20px;margin-left:20px">
			<label>学生姓名：</label><input type="text" name="studentName" style="margin-right:15px" class="easyui-textbox" >
			<label>班级：</label><input  name="className"  style="margin-right:15px" class="easyui-textbox">
			<label>来校时间：</label>
			<input  style="width: 126px; height: 22px" class="easyui-datebox" name="startTime">
			<label id="times_err">--</label>
			<input style="width: 126px; height: 22px" class="easyui-datebox" name="endTime">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input  value="查询"  type="button"   class="easyui-linkbutton"  style="width:70px;height:25px"   onclick="search()" >
		<a href="javascript:void(0)"  style="margin-left:10px"   onclick="clean()"   class="easyui-linkbutton"  data-options="iconCls:'icon-reload'"  >条件清空</a>
		</div>
	</form>
	</div>
	
	
	
	<div style="margin-top: 20px">
		<table id="listData"></table>
	</div>
	
	
	<div id="reimburseWin" class="easyui-window"  closed="true" style="height:500px;width:600px">
	  <form id="reimburseForm" action="">
		<input  type="hidden"  name="studentId"  id="studentId"  >
		<div>
			<label>&nbsp;&nbsp;&nbsp;学生姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="studentName" 	 style="border:none;" readonly="readonly"> 
			<label>&nbsp;&nbsp;&nbsp;联系电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="studentTel"  style="border:none;" readonly="readonly"> 
		</div>
		<div>
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班&nbsp;&nbsp;级：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="classroom"  style="border:none;" readonly="readonly"> 
			<label>&nbsp;&nbsp;&nbsp;招生老师：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="proxyTeacher"  style="border:none;" readonly="readonly"> 
		</div>
		<div>
			<label>报销人姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="actualObject"  style="border:none;" readonly="readonly"> 
			<label>报销人电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="actualObjectTel"  style="border:none;" readonly="readonly"> 
		</div>
		<div>
			<label>&nbsp;&nbsp;&nbsp;应缴学费：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="yingFee"  style="border:none;" readonly="readonly"> 
			<label>&nbsp;&nbsp;&nbsp;实缴学费：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="shiFee"  style="border:none;" readonly="readonly"> 
		</div>
		<div>
			<label>&nbsp;&nbsp;&nbsp;应报金额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="yingAmount"  style="border:none;" readonly="readonly"> 
			<label>&nbsp;&nbsp;&nbsp;实报金额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="shiAmount"  style="border:none;" readonly="readonly"> 
		</div>
		<div>
			<label>&nbsp;&nbsp;&nbsp;报销时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="date" name="auditTime" class="easyui-datetimebox">
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备&nbsp;&nbsp;注：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="textarea" id="remarks" name="remarks" class="easyui-textbox"> 
		</div>
		
		<div style="margin-top:20px;width:539px">
			<label>&nbsp;&nbsp;&nbsp;报销凭证：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<img  id="ticketVoucher" src="" style="height: 191px;width:386px;"> 
		</div>
		
		<div style="text-align:center;margin-top:40px">
			<input type="button" value="确认报销" onclick="pass(3)"  style="width:60px;height:30px"  class="easyui-linkbutton">
			<input type="button" value="作废" onclick="pass(4)"   style="width:60px;height:30px" class="easyui-linkbutton">
		</div>
		
		<br><br>
		<div style="text-align: center;margin-bottom: 10px;margin-left: 65px">
		 	<table border="1" style="width: 90%">
		 		<tr id="tr2"><td>审核人</td><td>审核时间</td><td>审核状态</td><td>备注</td></tr>
		 	</table>
		</div>
	</form>
</div>
</body>
</html>