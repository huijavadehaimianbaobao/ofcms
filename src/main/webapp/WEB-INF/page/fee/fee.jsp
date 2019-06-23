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
<link rel="stylesheet" href="static/css/default.css" type="text/css" />
<link rel="stylesheet" href="static/css/all.css" type="text/css" />
<script type="text/javascript"
	src="static/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="static/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="static/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet"
	href="static/jquery-easyui-1.4.1/themes/default/easyui.css"
	type="text/css" />
<link rel="stylesheet" href="static/jquery-easyui-1.4.1/themes/icon.css"
	type="text/css" />
<style type="text/css">
.suitionstate {
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;
	padding-right: 10px;
}

.outbox {
	margin-bottom: 10px;
}

.headercss {
	margin-top: 10px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
}
 
</style>

</head>
<body>

	<div class="headercss">
		<form id="search_form" action="fee/select" method="post"
			style="margin: 0px; padding: 0px">
			<fieldset class="form_fieldset">
				<div class="form_filed" style="margin-left: 55px;">
					<label class="ui_font">姓名：</label> <input type="text"
						class="easyui-textbox" name="stuName"> <label class="ui_font">&nbsp;&nbsp;身份证：</label>
					<input type="text" class="easyui-textbox" name="idCard"> <input
						type="button" value="查询 " class="easyui-linkbutton"
						onclick="search();"style="width: 70px; height: 30px; margin-left: 30px">          
				</div>



			</fieldset>
		</form>


		<!-- 缴费 -->
		
		<div id="jiao_div" class="easyui-window" closed="true" align="center" ">
			<form method="post" id="save" style="width:400px;height:400px;padding:10px;">
				<input class="easyui-textbox" style="width: 220px; height:30px; margin-top: 20px;outline:none;"
					id="stuId" name="student.id"> <br>
					<div>&nbsp;姓 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input class="easyui-textbox" style="width: 200px;height:30px; margin-top: 10px;"
					id="stuName" name="student.name" readonly="true"></div>
					 <br>
				    &nbsp;&nbsp;缴费类型：<select id="payment_methods" class="easyui-combobox" name="type"
					style="width:200px;height:30px;"  editable="false">
					<option id="kong"></option>
					<option value="学费">学费</option>
					<option value="杂费">杂费</option>
					<option value="住宿费">住宿费</option>
	
	            </select>
	             <div id="sd1" style="display: none;"><br>开始住宿时间：<input id="sd" type="text" class="easyui-datebox" name="initialResideDate"
				     style="width:180px;height:30px;"></div>
				 <br> <br>&nbsp;&nbsp;缴费时间：<input id="dd" type="text" class="easyui-datebox"
					required="required" style="width: 200px;height:30px;" name="paymentTime">
				 <br><br>&nbsp;缴费金额：<input class="easyui-textbox" style="width: 200px;height:30px;"
					id="amount_save" name="amount"><br><br> &nbsp;&nbsp;缴费方式：<select id="payment_for"
					class="easyui-combobox" name="payment.id" style="width: 200px;height:30px;" editable="false">
	

				</select> <br><br>&nbsp;备 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<input id="bei" name="remarks" class="easyui-textbox" style="width: 200px;height:30px;margin-top: 10px;outline:none;"><br> <br> 
				<br><br>
				<input type="button" class="easyui-linkbutton" value="保存" onclick="save()" style="width:80px;height:40px" >
				
			</form>
		</div>
	</div>


<!-- 缴费记录 -->
	<div id="xinxi_div" class="easyui-window" closed="true">
		<form id="jiaofei_from">
			<table id="tableid1" class="easyui-datagrid" style="width: 100%; height: 263px">
				<thead>
					<tr>
						<!-- 学生信息-->
						<th data-options="field:'student',width:155,align:'center',formatter:function(val){return val.name;}">姓名</th>
						<th data-options="field:'type',width:155,align:'center'">缴费类型</th>
						<th data-options="field:'payment',width:155,align:'center',formatter:function(val){return val.name;}">缴费方式</th>
						<th data-options="field:'paymentTime',width:155,align:'center'">缴费时间</th>
						<th data-options="field:'amount',width:156,align:'center'">缴费金额(元)</th>
						<th data-options="field:'remarks',width:156,align:'center'">备注</th>
					</tr>
				</thead>
			</table>
		</form>
	</div>
	<div class="jeiguo">
		<table id="dg">
		</table>

	</div>  
<!-- 学生信息 -->
<div id="xq_div" class="easyui-window" closed="true" align="center">
<form method="post" id="xinxi">
<input style="width: 200px; margin-top: 10px;outline:none;border :0 " id="studentId" name="id" readonly="readonly">
<br>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 名：&nbsp;<input style="width: 120px; margin-top: 10px;border :0 "id="studentName" name="name"  readonly="readonly"  >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 别：&nbsp;<input style="width: 108px; margin-top: 10px;border :0 "id="studentSex" readonly="readonly" name="student.sex"  ><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 龄：&nbsp;<input style="width: 119px; margin-top: 10px;border :0 "id="studentAge"   readonly="readonly"  >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 身份证号：&nbsp; <input style="width: 130px; margin-top: 10px;border :0 "id="studentIdCard"   readonly="readonly"  > <br>
生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 日：&nbsp;<input style="width: 120px; margin-top: 10px;border :0 "id="birthday" readonly="readonly" > 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 话：&nbsp;<input style="width: 108px; margin-top: 10px;border :0 "id="studentTel"  readonly="readonly"  ><br>
地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 址：&nbsp;<input style="width: 120px; margin-top: 10px;border :0 "id="studentAddress"  readonly="readonly"  >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学&nbsp;费&nbsp;(元)：&nbsp;<input style="width: 102px; margin-top: 10px;border :0 "id="studentTuition" readonly="readonly"  >  <br>
杂 费&nbsp;(元)：&nbsp;<input style="width: 118px; margin-top: 10px;border :0 "id="studentIncidentals" readonly="readonly"  >  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;住宿费(元)：<input style="width: 101px; margin-top: 10px;border :0 "id="studentQuarterage" readonly="readonly"  >
<br>开始住宿时间：&nbsp;<input style="width: 121px; margin-top: 10px;border :0 "id="initialResideDate"  readonly="readonly"  > 
 <br>入学时间：&nbsp;<input style="width: 121px; margin-top: 10px;border :0 "id="studentJoinTime"  readonly="readonly"  > 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学习时长：&nbsp;<input style="width: 105px; margin-top: 10px;border :0 "id="studyTime"  readonly="readonly"  > <br>
专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 业：&nbsp;<input style="width: 120px; margin-top: 10px;border :0 "id="major"   readonly="readonly"  >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 级：&nbsp;<input style="width: 109px; margin-top: 10px;border :0 "id="classroom" readonly="readonly" >   
</form>
</div>
</body>
<script type="text/javascript">
	$(function() {
		init();
	});

	function init() {
		$('#dg').datagrid(
						{
							url : 'student/getAll',//请求方法的地址
							title : '查询结果',
							height : window.innerHeight - 130,
							fitColumns : true, //列自适应 
							nowrap : false,//禁止文字自动换行
							/* idField: 'id',//主键列的列明 */
							loadMsg : '正在加载信息...',//当数据没有加载出来时显示的文字
							pagination : true,//是否有分页/
							singleSelect : true,//是否单行选择
							pagePosition : 'bottom',//分页符在底部,可选参数为top，bottom，both
							pageSize : 10,//页大小，一页多少条数据
							pageNumber : 1,//默认当前的页码
							pageList : [ 10, 15, 30 ],//一页可显示数据的条目 
							queryParams : {},//往后台传递参数，json格式 */
							columns : [ [

									{
										field : 'id',
										title : 'id',
										width : 10,
										align : 'center',
										hidden : true,
									
									},
									{
										field : 'name',
										title : '姓名',
										width : 10,
										align : 'center',
									 
									},

									{
										field : 'tuition',
										title : '学费(元)',
										width : 10,
										align : 'center',
									 
									},
									{
										field : 'tuitionContinue',
										title : '学费状态',
										width : 10,
										align : 'center',

									},
									{
										field : 'incidentals',
										title : '杂费(元)',
										width : 10,
										align : 'center',
								 
									},
									{
										field : 'incidentalsContinue',
										title : '杂费状态',
										width : 10,
										align : 'center',
									},
									{
										field : 'quarterage',
										title : '住宿费(元)',
										width : 10,
										align : 'center',
										 
									},
									{
										field : 'initialResideDate',
										title : '开始住宿时间',
										width : 10,
										align : 'center',
									},
									{
										field : 'quarterageContinue',
										title : '住宿费到期时间',
										width : 10,
										align : 'center',
									},
									{
										field : 'opt',
										title : '操作',
										width : 20,
										align : 'center',
										formatter : function(value, row, index) {

											var str = "";

											str += '<a href="javascript:void(0);" onclick="xiangqing('
													+ index + ')">详情</a>|';
											str += '<a href="javascript:void(0);" onclick="jiaofei('
													+ index + ')">缴费</a>|';
											str += '<a href="javascript:void(0);" onclick="xinxi('
													+ index + ')">缴费记录</a>';
											return str;
										}
									} ] ]
						});
	}
	
	//选择 住宿费 则显示 开始住宿时间
   $("#payment_methods").combobox({
	   onChange:function(newValue,oldValue){
		   if(newValue=="住宿费"){
			   $('#sd1').css({'display':'block'});
		   }else{
			   $('#sd1').css({'display':'none'});
		   }
	   }
   })
   

	//模糊查询
	function search() {
		var fields = $('#search_form').serializeArray();
		var params = $("#dg").datagrid('options').queryParams;
		$.each(fields, function(i, field) {
			params[field.name] = field.value;
		});
		$('#dg').datagrid('reload')
	}

	/* 缴费记录*/
	function xinxi(index) {
		var row = $('#dg').datagrid('getData').rows[index];
		var stuId = row.id;
		$('#xinxi_div').window({
			title : '缴费记录',
			width : 950,
			height : 300,
			modal : true
		});

		$("#tableid1").datagrid({
			url : 'fee/select?id=' + stuId

		});
		
		$("#xinxi_div").window("open");

	}

	/*学生详情  */
	function xiangqing(index) {
		var row = $('#dg').datagrid('getData').rows[index];
	    $('#studentName').val(row.name);
	    $('#studentAge').val(row.age);
	    $('#studentSex').val(row.sexText);
	    $('#studentIdCard').val(row.idCard);
	    $('#studentTel').val(row.tel);
	    $('#studentAddress').val(row.address);
	    $('#studentJoinTime').val(row.joinTime);
	    $('#studentTuition').val(row.tuition);
	    $('#initialResideDate').val(row.initialResideDate);
	    $('#studentIncidentals').val(row.incidentals);
	    $('#studentQuarterage').val(row.quarterage);
	    $('#studyTime').val(row.studyTime+"个月");
	    $('#major').val(row.major.name); 
	    $('#birthday').val(row.birthday);
	    $('#classroom').val(row.classroom.name);
		$('#xq_div').window({
			title : '学生信息',
			width : 600,
			height :300,
			modal : true
		});
	 
		$("#xq_div").window("open");
		

	}

	/*打开缴费  */
	function jiaofei(index) {
		var row = $('#dg').datagrid('getData').rows[index];
		$('#stuName').textbox('setValue',row.name);
		$('#stuId').textbox('setValue', row.id).next().hide()
		$('#jiao_div').window({
			title : '深度缴费',
			width : 500,
			height : 500,
			modal : true
		});
		$('#payment_for').combobox({
			url : 'payment/getAll',
			valueField : 'id',
			selectOnNavigation : false,
			textField : 'name',	
			editable:false,			
			onLoadSuccess : function(){
			    $('#payment_for').combobox('setValue','1');
			}
        });
		
		
		$('#jiao_div').window('open');

	}
	/* 缴费保存 */
	function save() {
	var bb = $('#amount_save').textbox('getText');
		
 		var aa = $('#payment_methods').combobox('getText');
 	 
		if(aa == null||$.trim(aa)==""){
			alert("请选择缴费类型");
			
		}else{
			if( bb == null || $.trim(bb)==""){
				alert("请输入缴费金额");
			}else{
				var data = $("#save").serialize();

				console.log(data);
				$.ajax({
					url : 'fee/save',//请求的url地址
					async : true, //请求是否异步，默认为异步，这也是ajax重要特性
					data : data,
					type : "post", //请求方式
					success : function() {
						$('#jiao_div').window('close');
						$('#dg').datagrid('reload');
						$('#payment_methods').textbox('setValue','');
						$('#amount_save').textbox('setValue','');
						$('#bei').textbox('setValue','');
					}

				});
				
			}
			
			
		}
	}
	//设置当前日期
 	$(function(){
		   var curr_time = new Date();
		   var strDate = curr_time.getFullYear()+"-";
		   strDate += curr_time.getMonth()+1+"-";
		   strDate += curr_time.getDate()+"-";
		   strDate += curr_time.getHours()+":";
		   strDate += curr_time.getMinutes()+":";
		   strDate += curr_time.getSeconds();
		   $("#dd").datebox("setValue", strDate); 
		  }); 
 	
</script>
</html>
