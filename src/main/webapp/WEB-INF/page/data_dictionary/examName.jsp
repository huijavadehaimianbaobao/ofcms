<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath + "/"%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"	href="static/css/default.css" type="text/css" />
<link rel="stylesheet"	href="static/css/all.css" type="text/css" />
<script type="text/javascript"	src="static/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"	src="static/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript"	src="static/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet"	href="static/jquery-easyui-1.4.1/themes/default/easyui.css"	type="text/css" />
<link rel="stylesheet" href="static/jquery-easyui-1.4.1/themes/icon.css" type="text/css"/>
<title>Insert title here</title>
</head>
<style type="text/css">

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
}
input[type="number"] {
    -moz-appearance: textfield;
}

</style>
<body>
	<table id="listData"></table>
	 
<!--编辑页面 -->
	<div id="w" class="easyui-window" title="信息修改" data-options="iconCls:'icon-save'" style="width:320px;height:200px;padding:10px;" closed="false">
		<form  id="fromEducationDate">
			<input style="margin-top:5px" type="hidden" name="id" id="eId" >
			<div class="editwindow" style="padding-left:20px">考试名称：<input style="margin-top:5px" class="easyui-textbox" name="name" id="ename" readonly> </div>
			<div class="editwindow" style="padding-left:20px">备&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 注：<input style="margin-top:5px" class="easyui-textbox" name="remarks" id="examName_remarks"> </div>
			<div class="editwindow" style="padding-left:20px">考试时间：<input style="margin-top:5px" class="easyui-datebox" name="date" id="exam_date"> </div>
			<div class="editwindow" style="padding-left:40px"><input type="button" value="保存" class="test" onclick="updateOrAddDate('fromEducationDate','update');"style="text-align:center;position: absolute;left:33%;width:100px;margin-top:15px;height:30px"></div>
		</form>
	</div>
	<div id="add_win" class="easyui-window" title="添加考试"  closed="true" style="width:275px;height:200px;padding:10px;">
		<form action="examName/add" id="education_add_form">
			<div class="editwindow" style="padding-left:0px">考试名称：<input type="text" id="examName_name"  name="name" style="margin-top:5px" class="easyui-textbox"> </div>
			<div class="editwindow" style="padding-left:0px">备&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 注：<input style="margin-top:5px" class="easyui-textbox" name="remarks"> </div>
			<div class="editwindow" style="padding-left:0px">考试时间：<input style="margin-top:5px" class="easyui-datebox" name="date" id="exam_date1"> </div>
			<div class="editwindow" style="padding-left:0px"><input type="button" value="保存" class="test" onclick="updateOrAddDate('education_add_form','add');"></div>
		</form>
	</div>
</body>
<script type="text/javascript">
$(function () {
	init();
});

	function init(){
		$('#listData').datagrid({
	        url: 'examName/getAll',//请求方法的地址
	        title: '查询结果',
	        height: window.innerHeight-100,
	        fitColumns: true, //列自适应 
	        nowrap: false,//禁止文字自动换行
	        /* pagination:true,
	        pageNumber:1,
	        pageList:[10,30,50], */
	        singleSelect:true,
	        loadMsg: '正在加载信息...',//当数据没有加载出来时显示的文字
	        queryParams:{},//往后台传递参数，json格式 */
	        columns: [[	        
	            {
	                field: 'name', title: '考试名称', width: 80, align: 'center'
	            },
	            {
	                field: 'remarks', title: '备注', width: 80, align: 'center'
	            },
	            {
	                field: 'date', title: '考试时间', width: 80, align: 'center'
	            },
	            {	
	            	field: 'opt', title:'操作',align: 'center',width: 80,formatter: function (value, row, index) {
	                    var str = "";
	                    str += '<a href="javascript:void(0);" onclick="open_ed('+index+')">编辑</a>';
// 	                    str += '<a href="javascript:void(0);"<input type="button" onclick="/* deletes('+row.id+') */">|删除</a>';
	                    return str;
	                }
	            }
	        ]],
	        toolbar: [{
	    		iconCls: 'icon-add',
	    		text:'添加',
	    		handler: function(){
	    			add_ed()
	    		}
	    	}]
		});
		$("#w").window('close');
	}
	function add_ed(){
		$('#add_win').window('open');
	}
	function init_win(){
		$('#add_win').window({
			title : '添加专业',
			width : 500,
			height : 300,
			top:($(window).height() - 420) * 0.5,
	        left:($(window).width() - 450) * 0.4, 
			modal : true,
			shadow : true,
			closed:true,
			resizable : false
		}); 
	}
// 	编辑
	function open_ed(index){
		var row = $('#listData').datagrid('getData').rows[index];
		$("#eId").val(row.id);
		$("#ename").textbox("setValue",row.name);
		$("#examName_remarks").textbox("setValue",row.remarks);
		$("#exam_date").datebox("setValue",row.date);
		
		$("#w").window('open');
}	
	//更改+保存
	function updateOrAddDate(form,method){
		var data = $("#"+form).serialize();
		
		if(form=='fromEducationDate'){
			if($('#ename').textbox('getValue')==''){
				alert("考试名称不能为空")
			}else if($("#exam_date").datebox("getValue")==''){
				alert("考试时间不能为空")
			}else{
				$.ajax({
					url: "examName/"+method,    //请求的url地址
					async: true, //请求是否异步，默认为异步，这也是ajax重要特性
					data: data,
					type: "post",   //请求方式
					success: function(req){
						$('#w').window('close');
						$('#add_win').window('close');
						$('#listData').datagrid('reload');
						$('#fromEducationDate').form('clear');
						$('#education_add_form').form('clear');
					}
			    	   
				});
			}
		}else{
			if($('#examName_name').textbox('getValue')==''){
				alert("考试名称不能为空")
			}else if($("#exam_date1").datebox("getValue")==''){
				alert("考试时间不能为空")
			}else{
				if(confirm('录入成功后，考试名称不得修改。')==false){
					return false;
				}else{
					$.ajax({
						url: "examName/"+method,    //请求的url地址
						async: true, //请求是否异步，默认为异步，这也是ajax重要特性
						data: data,
						type: "post",   //请求方式
						success: function(req){
							$('#w').window('close');
							$('#add_win').window('close');
							$('#listData').datagrid('reload');
							$('#fromEducationDate').form('clear');
							$('#education_add_form').form('clear');
						}
				    	   
					});
				}
			}
		}
		
		
	}
	
//	删除
	function deletes(id){
		if(confirm('确认删除')==false){
			return false;
		}else{
			$.ajax({
				type:"post",
				url:"examName/del",
				data:{
					"id" : id
				},
				success : function(){
					$('#listData').datagrid('reload');
					
				}
			})
		}
		
	}	
</script>
</html>