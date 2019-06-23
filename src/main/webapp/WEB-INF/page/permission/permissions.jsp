<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
 		+ request.getContextPath();%>
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
<link rel="stylesheet" href="static/css/bootstrap.min.css" type="text/css" />
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
.headercss {
	margin-top: 20px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 20px;
}
</style>
<body>
	<div class="headercss">
		<form id="form_search" action="" method="post">
			<fieldset class="form_fieldset">
				<div>
					<label>权限名称：</label>
					<input  id="permission_name" name="permission"  class="easyui-textbox"/>
					<input type="button" value="查询 " class="easyui-linkbutton" onclick="search();" style="width: 100px; height: 30px; margin-left: 30px;">
				</div>
			</fieldset>
		</form>
	</div>
	<table id="listData" ></table>
	<!--编辑页面 -->
	<div id="w" class="easyui-window" title="信息修改" data-options="iconCls:'icon-save'" style="width:460px;height:320px;padding:10px;" closed="true">
		<form  id="fromPermission">
			<div style="margin-left: 25px;margin-top: 26px;">
				<input style="margin-top:5px" type="hidden" name="id" id="id" >
				<div class="editwindow" style="padding-left:0px;width: 350px;">权限&nbsp;&nbsp;&nbsp;名称：
					<input style="width: 275px;"  id="permission2" name="permission"  class="easyui-textbox"/>
				</div>
				<div class="editwindow" style="padding-left:0px;width: 350px;">资源&nbsp;&nbsp;&nbsp;路径：
					<input style="width: 275px;"  id="resource2" name="resource"  class="easyui-textbox"/>
				</div>
				<div class="editwindow" style="padding-left:0px;width: 350px;">权限标识符：
					<input style="width: 274px;"  id="perCode2" name="perCode"  class="easyui-textbox"/>
				</div>
				<div class="editwindow" style="padding-left:0px;width: 350px;">资源&nbsp;&nbsp;&nbsp;描述：
					<input style="width: 275px;"  id="description2" name="description"  class="easyui-textbox"/>
				</div>
				<div class="editwindow" style="padding-left:0px;width: 350px;">资源&nbsp;&nbsp;&nbsp;状态：
					<select  id="available2" class="easyui-combobox" name="available" style="margin-top:5px;width: 275px">   
					    <option value="1">正常</option>   
					    <option value="2">禁用</option>    
					</select>
				</div>
			</div>
			<div class="editwindow" style="padding-left:40px">
				<input type="button" value="修改" class="test" onclick="updateOrAddDate('fromPermission','update');"style="text-align:center;position: absolute;top:235px;left:38%;width:100px;margin-top:15px;height:30px">
			</div>
		</form>
	</div>
		
	<!-- 添加页面 -->
	<div id="add_win" class="easyui-window" title="添加权限"  closed="true" style="width:460px;height:320px;padding:10px;" >
		<form id="permission_add_form" enctype="multipart/form-data" method="post">
			<div style="margin-left: 25px;margin-top: 26px">
				<div class="editwindow" style="padding-left:0px;width: 350px;">权限&nbsp;&nbsp;&nbsp;名称：
					<input style="width: 275px;"  id="permission" name="permission"  class="easyui-textbox"/>
				</div>
				<div class="editwindow" style="padding-left:0px;width: 350px;">资源&nbsp;&nbsp;&nbsp;路径：
					<input style="width: 275px;"  id="resource" name="resource"  class="easyui-textbox"/>
				</div>
				<div class="editwindow" style="padding-left:0px;width: 350px;">权限标识符：
					<input style="width: 274px;" id="perCode" name="perCode"  class="easyui-textbox"/>
				</div>
				<div class="editwindow" style="padding-left:0px;width: 350px;">资源&nbsp;&nbsp;&nbsp;描述：
					<input style="width: 275px;"  id="description" name="description"  class="easyui-textbox"/>
				</div>
				<div class="editwindow" style="padding-left:0px;width: 350px;">资源&nbsp;&nbsp;&nbsp;状态：
					<select id="available" class="easyui-combobox" name="available" style="margin-top:5px;width: 275px">   
					    <option value="1">正常</option>   
					    <option value="2">禁用</option>    
					</select>
				</div>
			</div>
			
			<div class="editwindow" style="padding-left:40px">
				<input type="button" value="提交" class="test" onclick="updateOrAddDate('permission_add_form','addPermission');"style="text-align:center;position: absolute;top:235px;left:38%;width:100px;margin-top:15px;height:30px">
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
$(function () {
	init();
	
});
	function init(){
		$('#listData').datagrid({
	        url: 'permissions/getAll',//请求方法的地址
	        title: '查询结果',
	        height: window.innerHeight-135,
	        fitColumns: true, //列自适应 
	        nowrap: false,//禁止文字自动换行
	        pagination:true,
	        pageSize : 20,
	        pageNumber:1,
	        pageList:[20,40,60],
	        singleSelect:true,
	        loadMsg: '正在加载信息...',//当数据没有加载出来时显示的文字
	        queryParams:{},//往后台传递参数，json格式 */
	        columns: [[	        
	            {
	                field: 'permission', title: '权限名称', width: 100, align: 'center'
	            },
	            {
	                field: 'resource', title: '资源路径', width: 150, align: 'center'
	            },
	            {
	                field: 'perCode', title: '权限标识符', width: 100, align: 'center'
	            },
	            {
	                field: 'description', title: '资源描述', width: 100, align: 'center'
	            },
	            {
	                field: 'available', title: '资源状态', width: 80, align: 'center',formatter: function(value, row, index){
	                	if(value == 1){
	                		return "正常";
	                	}else if(value == 2){
	                		return "禁用";
	                	}else {
	                		return "无状态";
	                	}
	                }
	            },
	            {	
	            	field: 'opt', title:'操作',align: 'center',width: 100,formatter: function (value, row, index) {
	                    var str = "";
	                    str += '<a href="javascript:void(0);"  onclick="open_ed('+row.id+')">修改资源 |</a>';
	                    str += '<a href="javascript:void(0);"  onclick="deletes('+row.id+')">删除资源 |</a>';
	                    /* str += '<a href="javascript:void(0);"  onclick="permission('+row.id+')">权限管理|</a>';	 */           
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
			title : '添加权限',
			width : 300,
			height : 200,
			top:($(window).height() - 420) * 0.5,
	        left:($(window).width() - 450) * 0.4, 
			modal : true,
			shadow : true,
			closed:true,
			resizable : false
		}); 
	}
// 	编辑
	function open_ed(id){
		$.ajax({
			type:"post",
			data:{"id":id},
			url:"permissions/getById",
			success:function(data){
				$("#id").val(data.id);
				$("#permission2").textbox("setValue",data.permission);
				$("#resource2").textbox("setValue",data.resource);
				$("#perCode2").textbox("setValue",data.resource);
				$("#description2").textbox("setValue",data.description);
				$("#available2").combobox("setValue",data.available);
			}
			 
		}) ;
		$("#w").window('open');
	}	
	
	// 查询
	function search(){
		var fields =$('#form_search').serializeArray();   
		
	    var params = $("#listData").datagrid('options').queryParams;  
	    $.each( fields, function(i, field){  
	    /* 	alert(field.value); */
	        params[field.name] = field.value;   
	    });  
	    
	    $('#listData').datagrid('reload')
	    $('#form_search').form('clear');
	} 
	
	//更改+保存
	function updateOrAddDate(form,method){
		var data = $("#"+form).serialize();
		console.log(data) 
		if(form =='fromPermission'){
			if($("#permission2").textbox("getValue")==''){
				alert("权限名称不能为空")
			}else if($("#resource2").textbox("getValue")==''){
				alert("资源路径不能为空")
			} else if($("#perCode2").textbox("getValue")==''){
				alert("权限标识符不能为空")
			}else if($("#description2").combobox("getValue")==''){
				alert("资源描述不能为空")
			}else if($("#available2").combobox("getValue")==''){
				alert("状态不能为空")
			}else {
				$.ajax({
					url: "permissions/"+method,    //请求的url地址
					async: true, //请求是否异步，默认为异步，这也是ajax重要特性
					data: data,
					type: "post",   //请求方式
					success: function(req){
						$('#w').window('close');
						$('#add_win').window('close');
						$('#listData').datagrid('reload');
						$('#fromPermission').form('clear');
						$('#permission_add_form').form('clear');
					}
			    	   
				});
			}
		}else{
			if($('#permission').textbox('getValue')==''){
				alert("权限名称不能为空")
			}else if($('#resource').textbox('getValue')==''){
				alert("资源路径不能为空")
			}else if($("#perCode").textbox("getValue")==''){
				alert("权限标识符不能为空")
			}else if($("#description").textbox("getValue")==''){
				alert("资源描述不能为空")
			}else if($("#available").combobox("getValue")==''){
				alert("状态不能为空")
			}else {
					$.ajax({
						url: "permissions/"+method,    //请求的url地址
						async: true, //请求是否异步，默认为异步，这也是ajax重要特性
						data: data,
						type: "post",   //请求方式
						success: function(req){
							$('#w').window('close');
							$('#add_win').window('close');
							$('#listData').datagrid('reload');
							$('#fromPermission').form('clear');
							$('#permission_add_form').form('clear');
						}
				    	   
					});				
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
				url:"permissions/del",
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