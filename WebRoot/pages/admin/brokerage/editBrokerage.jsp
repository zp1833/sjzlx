<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/fckeditor/fckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css"> 
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<script type="text/javascript">

	$(function() {
		//preFckEditor();
		if("${model.source}"=='0')
			document.getElementById("model.otherSource").style.display = "";
			
		$("#modelPartner").combobox();
		$("#modelPartner").combobox("setValue", "${model.partner}");
		
		$(".rate").width("80px").combobox({
			data:[{"text":"N/A"}],  
			valueField: 'text',    
        	textField: 'text'
		});
		
		$(".na").click(function() {
			if($(this).attr("checked"))
				$(this).siblings(".naDate").css("display","none");
			else
				$(this).siblings(".naDate").css("display","");
		});
		
		$(".naDate").each(function() {
			if($(this).val() == '2000-01-01') {
				$(this).siblings(".na").click();
				$(this).css("display","none");
				$(this).val("");
			}
		});
			
		$(".moneyUnit").change(function() {
			if($(this).val() == 'N/A')
				$(this).siblings("input").val("N/A");
			else
				$(this).siblings("input").val("");
		});
		
		$("form").submit(function() {
			$(".na").each(function() {
				if($(this).attr("checked"))
					$(this).siblings("input").val("2000-01-01");
			});
		});
	});

	function preFckEditor(){
		var fckEditor = new FCKeditor( 'model.descn' );
	    fckEditor.BasePath = "${ctx}/js/fckeditor/";
	    fckEditor.ToolbarSet = 'zp';
	    fckEditor.Height = 75;
	    fckEditor.ReplaceTextarea();
	}
	
	function inputSource(obj) {
		if(obj.selectedIndex==obj.options.length-1)
			document.getElementById("model.otherSource").style.display = "";
		else
			document.getElementById("model.otherSource").style.display = "none";
	}
	
	//是否选择专业课学习
	function isCheckEnterClass(obj){
	
		if(obj.checked){
			document.getElementById("model.speProportion").value="无";
			document.getElementById("model.speTuition").value="无";
		}else{
			document.getElementById("model.speProportion").value="";
			document.getElementById("model.speTuition").value="";
		}
	}
	//是否选择语言课学习
	function isCheckLanguageClass(obj){
	
		if(obj.checked){ 
			document.getElementById("model.langTuition").value="无";
			document.getElementById("model.langProportion").value="无";
		}else{
			document.getElementById("model.langTuition").value="";
			document.getElementById("model.langProportion").value="";
		}
	}
	
	function changePartner(obj){
	
		var index = obj.selectedIndex;
		
		var otherPar = document.getElementById("model.otherPartner");
		
		if(obj.options[index].value == "0"){
				otherPar.type = "text";
		}else{
				otherPar.type = "hidden";
		}
	}
	function changeDocSel(obj){ 
		var index = obj.selectedIndex;
		
		var otherDoc = document.getElementById("model.otherDocEmp");
		
		if(obj.options[index].value == "0"){
				otherDoc.type = "text";
		}else{
				otherDoc.type = "hidden";
		}
	}
	
	function changeAdvSel(obj){
		var index = obj.selectedIndex;
		
		var otherAdv = document.getElementById("model.otherAdvisor");
		
		if(obj.options[index].value == "0"){
				otherAdv.type = "text";
		}else{
				otherAdv.type = "hidden";
		}
	}
	//conmunicate
	
	function getMoreInfo(name){
		$.ajax({
			type: 'POST',
			url: 'getMoreInfoFromSuccessfulCase.do',
			data: {'matchName':name},
			success: function(data){
				if(data.msg == "success"){
					//合作方 申请类型 所去国家 入读时间 入读学校 中英 入读专业 中英 顾问 文案
					
					//partner
					$("#modelPartner").combobox("setValue", data.stuInfos.partner);
					
					//
					var dom = document.getElementById("model.advisor");
					var oldVar = dom.value;
					dom.value = data.stuInfos.advisor;
					var newVar = dom.value;
					
					if(newVar == oldVar){
						dom.value="0";
						document.getElementById("model.otherAdvisor").value=data.stuInfos.advisor;
						document.getElementById("model.otherAdvisor").type = "text";
					}
					//
					var dom = document.getElementById("model.docEmp");
					var oldVar = dom.value;
					dom.value = data.stuInfos.copyWriter;
					var newVar = dom.value;
					
					if(newVar == oldVar){
						dom.value="0";
						document.getElementById("model.otherDocEmp").value=data.stuInfos.copyWriter;
						document.getElementById("model.otherDocEmp").type = "text";
					}
					
					var dom = document.getElementById("applyType");
					dom.value = data.stuInfos.applyType;
					
					var dom = document.getElementById("model.schoolEnName");
					dom.value = data.stuInfos.readSchoolEN;
					
					var dom = document.getElementById("model.school");
					dom.value = data.stuInfos.readSchoolZH;
					
					var dom = document.getElementById("model.specialityEnName");
					dom.value = data.stuInfos.majorEN;
					
					var dom = document.getElementById("model.speciality");
					dom.value = data.stuInfos.majorZH;
					
					var dom = document.getElementById("model.country");
					dom.value = data.stuInfos.toCountry;
					
					var dom = document.getElementById("model.joinDate");
					var time = data.stuInfos.readTime;
					if(time!=null && time != "" ){
						dom.value = time.substring(0,time.indexOf("T"));
					}else{
						document.getElementById("model.joinDate").value = "";
					}
				}else{
					alert("成功案例中无此人信息！");
				}
			},
			dataType:'json'
		});
	}
	
	function checkForm() {
		var copyWriter = document.getElementById("model.docEmp").value;
		if(copyWriter == null || copyWriter.length <= 0) {
			alert("请选择文案");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="x-panel">
	  <div class="x-panel-header">学员佣金管理</div>
		<table width="100%" border="0" cellpadding="5" cellspacing="1">
			<tr>
				<td><%@ include file="/common/messages.jsp"%></td>
			</tr>
		</table>
		<div class="x-panel-body">
			<table align="center">
				<tr>
					<td align="center">
						<s:form action="saveBrokerage" validate="true" theme="simple" onsubmit="return checkForm();">
							<s:hidden name="model.id"/>
							<s:hidden name="model.createTime"></s:hidden>
							<fieldset style="margin:10px;">
								<legend>学生基本信息</legend>
								<table style="width:800px">
									<tr>
										<td align="right">姓名：</td>
										<td align="left" width="180">
											<input name="model.stuName" id="model.stuName" value="${model.stuName }" size="12"><a  href="javascript:getMoreInfo(document.getElementById('model.stuName').value);" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询
										</td>
										<td align="right" width="150">出生日期：</td>
										<td align="left">
											<input type="text" name="model.birthday" size="12" id="model.birthday" 
												class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
													value='<s:date name="model.birthday" format="yyyy-MM-dd"/>'/>
										</td>
										<td align="right">性　　别：</td>
										<td align="left">
											<select name="model.sex" style="width: 100px;margin: 0">
												<option ${model.sex=="男"?"selected":"" } value="男">男</option>
												<option ${model.sex=="女"?"selected":"" } value="女">女</option>
											</select>
										</td>
									</tr>
									<tr>
										<td align="right">学　生ID：</td>
										<td align="left">
											<input type="text" name="model.stuId" id="model.stuId" value="${model.stuId }" size="12">
										</td>
										<td align="right">所去国家：</td>
										<td align="left">
											<select name="model.country" id="model.country" style="width: 100px;margin: 0" class="easyui-combobox">
											<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN">
												<option ${model.country=="美国"?"selected":"" } value="美国">美国</option>
												<option ${model.country=="加拿大"?"selected":"" } value="加拿大">加拿大</option>
												<option ${model.country=="澳大利亚"?"selected":"" } value="澳大利亚">澳大利亚</option>
												<option ${model.country=="新西兰"?"selected":"" } value="新西兰">新西兰</option>
												<option ${model.country=="香港"?"selected":"" } value="香港">香港</option>
												<option ${model.country=="英国"?"selected":"" } value="英国">英国</option>
												<option ${model.country=="日本"?"selected":"" } value="日本">日本</option>
												<option ${model.country=="韩国"?"selected":"" } value="韩国">韩国</option>
												<option ${model.country=="法国"?"selected":"" } value="法国">法国</option>
												<option ${model.country=="新加坡"?"selected":"" } value="新加坡">新加坡</option>
												<option ${model.country=="爱尔兰"?"selected":"" } value="爱尔兰">爱尔兰</option>
												<option ${model.country=="马来西亚"?"selected":"" } value="马来西亚">马来西亚</option>
												<option ${model.country=="俄罗斯"?"selected":"" } value="俄罗斯">俄罗斯</option>
												<option ${model.country=="荷兰"?"selected":"" } value="荷兰">荷兰</option>
												<option ${model.country=="西班牙"?"selected":"" } value="西班牙">西班牙</option>
												<option ${model.country=="德国"?"selected":"" } value="德国">德国</option>
												<option ${model.country=="挪威"?"selected":"" } value="挪威">挪威</option>
												<option ${model.country=="瑞典"?"selected":"" } value="瑞典">瑞典</option>
												<option ${model.country=="丹麦"?"selected":"" } value="丹麦">丹麦</option>
												<option ${model.country=="芬兰"?"selected":"" } value="芬兰">芬兰</option>
												<option ${model.country=="瑞士"?"selected":"" } value="瑞士">瑞士</option>
												<option ${model.country=="匈牙利"?"selected":"" } value="匈牙利">匈牙利</option>
											</stc:role>
											<stc:role ifNotGranted="ROLE_ADMIN,ROLE_ORADMIN">
												<c:if test="${fn:contains(userInSession.employees.countries, '美国')}">
													<option ${model.country=="美国"?"selected":"" } value="美国">美国</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '加拿大')}">
													<option ${model.country=="加拿大"?"selected":"" } value="加拿大">加拿大</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '澳大利亚')}">
													<option ${model.country=="澳大利亚"?"selected":"" } value="澳大利亚">澳大利亚</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '新西兰')}">
													<option ${model.country=="新西兰"?"selected":"" } value="新西兰">新西兰</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '新西兰')}">
													<option ${model.country=="香港"?"selected":"" } value="香港">香港</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '新西兰')}">
													<option ${model.country=="英国"?"selected":"" } value="英国">英国</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '日本')}">
													<option ${model.country=="日本"?"selected":"" } value="日本">日本</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '韩国')}">
													<option ${model.country=="韩国"?"selected":"" } value="韩国">韩国</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '法国')}">
													<option ${model.country=="法国"?"selected":"" } value="法国">法国</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '新加坡')}">
													<option ${model.country=="新加坡"?"selected":"" } value="新加坡">新加坡</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '爱尔兰')}">
													<option ${model.country=="爱尔兰"?"selected":"" } value="爱尔兰">爱尔兰</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '马来西亚')}">
													<option ${model.country=="马来西亚"?"selected":"" } value="马来西亚">马来西亚</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '俄罗斯')}">
													<option ${model.country=="俄罗斯"?"selected":"" } value="俄罗斯">俄罗斯</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '荷兰')}">
													<option ${model.country=="荷兰"?"selected":"" } value="荷兰">荷兰</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '西班牙')}">
													<option ${model.country=="西班牙"?"selected":"" } value="西班牙">西班牙</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '德国')}">
													<option ${model.country=="德国"?"selected":"" } value="德国">德国</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '挪威')}">
													<option ${model.country=="挪威"?"selected":"" } value="挪威">挪威</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '瑞典')}">
													<option ${model.country=="瑞典"?"selected":"" } value="瑞典">瑞典</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '丹麦')}">
													<option ${model.country=="丹麦"?"selected":"" } value="丹麦">丹麦</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '芬兰')}">
													<option ${model.country=="芬兰"?"selected":"" } value="芬兰">芬兰</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '瑞士')}">
													<option ${model.country=="瑞士"?"selected":"" } value="瑞士">瑞士</option>
												</c:if>
												<c:if test="${fn:contains(userInSession.employees.countries, '匈牙利')}">
													<option ${model.country=="匈牙利"?"selected":"" } value="匈牙利">匈牙利</option>
												</c:if>
											</stc:role>
											</select>
										</td>
										<td align="right">申请类型：</td>
										<td align="left">
											<select name="model.applyType" id="applyType" style="width: 100px;margin: 0" class="easyui-combobox">
												<option value="">-请选择-</option>
												<option ${model.applyType=="高中"?"selected":"" } value="高中">高中</option>
												<option ${model.applyType=="高中预科"?"selected":"" } value="高中预科">高中预科</option>
												<option ${model.applyType=="学院双录"?"selected":"" } value="学院双录">学院双录</option>
												<option ${model.applyType=="学院直录"?"selected":"" } value="学院直录">学院直录</option>
												<option ${model.applyType=="本科双录"?"selected":"" } value="本科双录">本科双录</option>
												<option ${model.applyType=="本科直录"?"selected":"" } value="本科直录">本科直录</option>
												<option ${model.applyType=="研究生文凭"?"selected":"" } value="研究生文凭">研究生文凭</option>
												<option ${model.applyType=="硕士预科"?"selected":"" } value="硕士预科">硕士预科</option>
												<option ${model.applyType=="硕士直录"?"selected":"" } value="硕士直录">硕士直录</option>
												<option ${model.applyType=="硕士双录"?"selected":"" } value="硕士双录">硕士双录</option>
												<option ${model.applyType=="小学"?"selected":"" } value="小学">小学</option>
												<option ${model.applyType=="初中"?"selected":"" } value="初中">初中</option>
												<option ${model.applyType=="转学分"?"selected":"" } value="转学分">转学分</option>
												<option ${model.applyType=="博士"?"selected":"" } value="博士">博士</option>
												<option ${model.applyType=="无"?"selected":"" } value="无">无</option>
											</select>
										</td>
									</tr>
									<tr>
										<td align="right">语言入读时间：</td>
										<td align="left">
											<input type="text" name="model.joinDate" size="12" id="model.joinDate" 
												class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
													value='<s:date name="model.joinDate" format="yyyy-MM-dd"/>'/>
										</td>
										<td align="right">入读学校(中文)：</td>
										<td align="left">
											<input type="text" name="model.school" id="model.school" value="${model.school}" size="12">
										</td>
										<td align="right">入读学校(英文)：</td>
										<td align="left">
											<input type="text" name="model.schoolEnName" id="model.schoolEnName" value="${model.schoolEnName}" size="12">
										</td>
									</tr>
									<tr>
										<td align="right">正课入读时间：</td>
										<td align="left">
											<input type="text" name="model.zhengJoinDate" size="12" id="model.zhengJoinDate" 
												class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
													value='<s:date name="model.zhengJoinDate" format="yyyy-MM-dd"/>'/>
										</td>
										<td align="right">入读专业(中文)：</td>
										<td align="left">
											<input type="text" name="model.speciality" id="model.speciality" value="${model.speciality}" size="12">
										</td>
										<td align="right">入读专业(英文)：</td>
										<td align="left">
											<input type="text" name="model.specialityEnName" id="model.specialityEnName" value="${model.specialityEnName}" size="12">
										</td>
									</tr>
								</table>
							</fieldset>
							<fieldset style="margin:10px;">
								<legend>学生佣金情况</legend>
								<table>
									<tr>
										<td align="right" width="100">语言学费金额：</td>
										<td align="left">
											<select name="langTuition_m" class="moneyUnit">
												<option value="RMB" ${fn:contains(model.langTuition,'RMB')?"selected":"" }>RMB</option>
												<option value="USD" ${fn:contains(model.langTuition,'USD')?"selected":"" }>USD</option>
												<option value="CAD" ${fn:contains(model.langTuition,'CAD')?"selected":"" }>CAD</option>
												<option value="GBP" ${fn:contains(model.langTuition,'GBP')?"selected":"" }>GBP</option>
												<option value="HKD" ${fn:contains(model.langTuition,'HKD')?"selected":"" }>HKD</option>
												<option value="NZD" ${fn:contains(model.langTuition,'NZD')?"selected":"" }>NZD</option>
												<option value="AUD" ${fn:contains(model.langTuition,'AUD')?"selected":"" }>AUD</option>
												<option value="JPY" ${fn:contains(model.langTuition,'JPY')?"selected":"" }>JPY</option>
												<option value="FRA" ${fn:contains(model.langTuition,'FRA')?"selected":"" }>FRA</option>
												<option value="CHF" ${fn:contains(model.langTuition,'CHF')?"selected":"" }>CHF</option>
												<option value="MYR" ${fn:contains(model.langTuition,'MYR')?"selected":"" }>MYR</option>
												<option value="SGD" ${fn:contains(model.langTuition,'SGD')?"selected":"" }>SGD</option>
												<option value="N/A" ${fn:contains(model.langTuition,'N/A')?"selected":"" }>N/A</option>
											</select>
											<input type="text" name="model.langTuition" id="model.langTuition" value="${fn:substring(model.langTuition,3,20) }" size="6">
										</td>
										<td align="right" width="100">专业课学费金额：</td>
										<td align="left">
											<select name="speTuition_m" style="margin: 0" class="moneyUnit">
												<option value="RMB" ${fn:contains(model.speTuition,'RMB')?"selected":"" }>RMB</option>
												<option value="USD" ${fn:contains(model.speTuition,'USD')?"selected":"" }>USD</option>
												<option value="CAD" ${fn:contains(model.speTuition,'CAD')?"selected":"" }>CAD</option>
												<option value="GBP" ${fn:contains(model.speTuition,'GBP')?"selected":"" }>GBP</option>
												<option value="HKD" ${fn:contains(model.speTuition,'HKD')?"selected":"" }>HKD</option>
												<option value="NZD" ${fn:contains(model.speTuition,'NZD')?"selected":"" }>NZD</option>
												<option value="AUD" ${fn:contains(model.speTuition,'AUD')?"selected":"" }>AUD</option>
												<option value="JPY" ${fn:contains(model.speTuition,'JPY')?"selected":"" }>JPY</option>
												<option value="FRA" ${fn:contains(model.speTuition,'FRA')?"selected":"" }>FRA</option>
												<option value="CHF" ${fn:contains(model.speTuition,'CHF')?"selected":"" }>CHF</option>
												<option value="MYR" ${fn:contains(model.speTuition,'MYR')?"selected":"" }>MYR</option>
												<option value="SGD" ${fn:contains(model.speTuition,'SGD')?"selected":"" }>SGD</option>
												<option value="N/A" ${fn:contains(model.speTuition,'N/A')?"selected":"" }>N/A</option>
											</select>
											<input type="text" name="model.speTuition" id="model.speTuition" value="${fn:substring(model.speTuition,3,20) }" size="5">
										</td>
										<td align="right">合&nbsp;作&nbsp;方：</td>
										<td align="left">
											<select name="model.partner" id="modelPartner" style="width: 85px;margin: 0">
												<option value="">-请选择-</option>
												<option value="澳新国际" ${model.partner=='澳新国际'?'selected':'' }>澳新国际</option>
												<option value="加诚博教" ${model.partner=='加诚博教'?'selected':'' }>加诚博教</option>
												<option value="枫叶海外" ${model.partner=='枫叶海外'?'selected':'' }>枫叶海外</option>
												<option value="温哥华公立教育联盟" ${model.partner=='温哥华公立教育联盟'?'selected':'' }>温哥华公立教育联盟</option>
												<option value="广州亚太" ${model.partner=='广州亚太'?'selected':'' }>广州亚太</option>
												<option value="AA" ${model.partner=='AA'?'selected':'' }>AA</option>
												<option value="华通" ${model.partner=='华通'?'selected':'' }>华通</option>
												<option value="琥珀" ${model.partner=='琥珀'?'selected':'' }>琥珀</option>
												<option value="INDEX" ${model.partner=='INDEX'?'selected':'' }>INDEX</option>
												<option value="KPL" ${model.partner=='KPL'?'selected':'' }>KPL</option>
												<option value="INTO" ${model.partner=='INTO'?'selected':'' }>INTO</option>
												<option value="GEC" ${model.partner=='GEC'?'selected':'' }>GEC</option>
												<option value="EF" ${model.partner=='EF'?'selected':'' }>EF</option>
												<option value="UF" ${model.partner=='UF'?'selected':'' }>UF</option>
												<option value="SG" ${model.partner=='SG'?'selected':'' }>SG</option>
												<option value="IBG" ${model.partner=='IBG'?'selected':'' }>IBG</option>
												<option value="CIIE" ${model.partner=='CIIE'?'selected':'' }>CIIE</option>
												<option value="GSS" ${model.partner=='GSS'?'selected':'' }>GSS</option>
												<option value="UCSE" ${model.partner=='UCSE'?'selected':'' }>UCSE</option>
												<option value="GDX" ${model.partner=='GDX'?'selected':'' }>GDX</option>
												<option value="RIA" ${model.partner=='RIA'?'selected':'' }>RIA</option>
												<option value="IVY" ${model.partner=='IVY'?'selected':'' }>IVY</option>
												<option value="凯尔教育" ${model.partner=='凯尔教育'?'selected':'' }>凯尔教育</option>
												<option value="PIESG" ${model.partner=='PIESG'?'selected':'' }>PIESG</option>
												<option value="直代" ${model.partner=='直代'?'selected':'' }>直代</option>
											</select>
										</td>
										<td align="right">合作方返佣周期：</td>
										<td align="left" colspan="3">
											<select name="model.partnerPeriod" style="width: 85px;margin: 0">
												<option value="">-请选择-</option>
												<option value="1个月" ${model.partnerPeriod=='1个月'?'selected':'' }>1个月</option>
												<option value="2个月" ${model.partnerPeriod=='2个月'?'selected':'' }>2个月</option>
												<option value="3个月" ${model.partnerPeriod=='3个月'?'selected':'' }>3个月</option>
												<option value="4个月" ${model.partnerPeriod=='4个月'?'selected':'' }>4个月</option>
												<option value="5个月" ${model.partnerPeriod=='5个月'?'selected':'' }>5个月</option>
												<option value="6个月" ${model.partnerPeriod=='6个月'?'selected':'' }>6个月</option>
												<option value="7个月" ${model.partnerPeriod=='7个月'?'selected':'' }>7个月</option>
												<option value="8个月" ${model.partnerPeriod=='8个月'?'selected':'' }>8个月</option>
												<option value="9个月" ${model.partnerPeriod=='9个月'?'selected':'' }>9个月</option>
												<option value="10个月" ${model.partnerPeriod=='10个月'?'selected':'' }>10个月</option>
												<option value="11个月" ${model.partnerPeriod=='11个月'?'selected':'' }>11个月</option>
												<option value="12个月" ${model.partnerPeriod=='12个月'?'selected':'' }>12个月</option>
											</select>
										</td>
									</tr>
									<tr>
										<td align="right" width="80">佣金制度/比例：</td>
										<td align="left" colspan="7">
											<textarea rows="2" style="width: 99%" name="model.langProportion" id="model.langProportion">${model.langProportion}</textarea>
										</td>
									</tr>
									<tr>
										<td align="right" width="140">第一笔佣金到账金额：</td>
										<td align="left">
											<select name="brokerageArriveNum_m" class="moneyUnit">
												<option value="RMB" ${fn:contains(model.brokerageArriveNum,'RMB')?"selected":"" }>RMB</option>
												<option value="USD" ${fn:contains(model.brokerageArriveNum,'USD')?"selected":"" }>USD</option>
												<option value="CAD" ${fn:contains(model.brokerageArriveNum,'CAD')?"selected":"" }>CAD</option>
												<option value="GBP" ${fn:contains(model.brokerageArriveNum,'GBP')?"selected":"" }>GBP</option>
												<option value="HKD" ${fn:contains(model.brokerageArriveNum,'HKD')?"selected":"" }>HKD</option>
												<option value="NZD" ${fn:contains(model.brokerageArriveNum,'NZD')?"selected":"" }>NZD</option>
												<option value="AUD" ${fn:contains(model.brokerageArriveNum,'AUD')?"selected":"" }>AUD</option>
												<option value="JPY" ${fn:contains(model.brokerageArriveNum,'JPY')?"selected":"" }>JPY</option>
												<option value="FRA" ${fn:contains(model.brokerageArriveNum,'FRA')?"selected":"" }>FRA</option>
												<option value="CHF" ${fn:contains(model.brokerageArriveNum,'CHF')?"selected":"" }>CHF</option>
												<option value="MYR" ${fn:contains(model.brokerageArriveNum,'MYR')?"selected":"" }>MYR</option>
												<option value="SGD" ${fn:contains(model.brokerageArriveNum,'SGD')?"selected":"" }>SGD</option>
												<option value="N/A" ${fn:contains(model.brokerageArriveNum,'N/A')?"selected":"" }>N/A</option>
											</select>
											<input type="text" name="model.brokerageArriveNum" id="model.brokerageArriveNum" value="${fn:substring(model.brokerageArriveNum,3,20) }" size="6">
										</td>
										<td align="right" width="140">
											第一笔佣金到账时间：
										</td>
										<td align="left">
											<input type="text" name="model.brokerageArriveDate" size="12" id="model.brokerageArriveDate"
												class="Wdate naDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
													value='<s:date name="model.brokerageArriveDate" format="yyyy-MM-dd"/>'/>
											<input type="checkbox" class="na">N/A
										</td>
										<td align="right" width="130">第一笔佣金当前汇率：</td>
										<td align="left">
											<input type="text" name="model.brokerageRate" id="model.brokerageRate" value="${model.brokerageRate}" size="10" class="rate">
										</td>
										<td align="right" width="140">第一笔佣金折合人民币：</td>
										<td align="left">
											<input type="text" name="model.brokerageToRmb" id="model.brokerageToRmb" value="${model.brokerageToRmb }" size="10" class="rate">
										</td>
									</tr>
									<tr>
										<td align="right">全额佣金到账：</td>
										<td align="left" colspan="7">
											<select name="model.isAllBrokerageArrived" style="width: 48px;">
												<option ${model.isAllBrokerageArrived=="是"?"selected":"" } value="是">是</option>
												<option ${model.isAllBrokerageArrived=="否"?"selected":"" } value="否">否</option>
											</select>
										</td>
									</tr>
									<tr>
										<td align="right" width="140">第二笔佣金到账金额：</td>
										<td align="left">
											<select name="brokerageArriveNum2_m" class="moneyUnit">
												<option value="RMB" ${fn:contains(model.brokerageArriveNum2,'RMB')?"selected":"" }>RMB</option>
												<option value="USD" ${fn:contains(model.brokerageArriveNum2,'USD')?"selected":"" }>USD</option>
												<option value="CAD" ${fn:contains(model.brokerageArriveNum2,'CAD')?"selected":"" }>CAD</option>
												<option value="GBP" ${fn:contains(model.brokerageArriveNum2,'GBP')?"selected":"" }>GBP</option>
												<option value="HKD" ${fn:contains(model.brokerageArriveNum2,'HKD')?"selected":"" }>HKD</option>
												<option value="NZD" ${fn:contains(model.brokerageArriveNum2,'NZD')?"selected":"" }>NZD</option>
												<option value="AUD" ${fn:contains(model.brokerageArriveNum2,'AUD')?"selected":"" }>AUD</option>
												<option value="JPY" ${fn:contains(model.brokerageArriveNum2,'JPY')?"selected":"" }>JPY</option>
												<option value="FRA" ${fn:contains(model.brokerageArriveNum2,'FRA')?"selected":"" }>FRA</option>
												<option value="CHF" ${fn:contains(model.brokerageArriveNum2,'CHF')?"selected":"" }>CHF</option>
												<option value="MYR" ${fn:contains(model.brokerageArriveNum2,'MYR')?"selected":"" }>MYR</option>
												<option value="SGD" ${fn:contains(model.brokerageArriveNum2,'SGD')?"selected":"" }>SGD</option>
												<option value="N/A" ${fn:contains(model.brokerageArriveNum2,'N/A')?"selected":"" }>N/A</option>
											</select>
											<input type="text" name="model.brokerageArriveNum2" id="model.brokerageArriveNum2" value="${fn:substring(model.brokerageArriveNum2,3,20) }" size="6">
										</td>
										<td align="right" width="140">第二笔佣金到账时间：</td>
										<td align="left">
											<input type="text" name="model.brokerageArriveDate2" size="12" id="model.brokerageArriveDate2"
												class="Wdate naDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
													value='<s:date name="model.brokerageArriveDate2" format="yyyy-MM-dd"/>'/>
											<input type="checkbox" class="na">N/A
										</td>
										<td align="right" width="130">第二笔佣金当前汇率：</td>
										<td align="left">
											<input type="text" name="model.brokerageRate2" id="model.brokerageRate2" value="${model.brokerageRate2}" size="10" class="rate">
										</td>
										<td align="right" width="140">第二笔佣金折合人民币：</td>
										<td align="left">
											<input type="text" name="model.brokerageToRmb2" id="model.brokerageToRmb2" value="${model.brokerageToRmb2 }" size="10" class="rate">
										</td>
									</tr>
									<tr>
										<td align="right">剩余佣金金额：</td>
										<td align="left">
											<select name="lastBrokerageNum_m" class="moneyUnit">
												<option value="RMB" ${fn:contains(model.lastBrokerageNum,'RMB')?"selected":"" }>RMB</option>
												<option value="USD" ${fn:contains(model.lastBrokerageNum,'USD')?"selected":"" }>USD</option>
												<option value="CAD" ${fn:contains(model.lastBrokerageNum,'CAD')?"selected":"" }>CAD</option>
												<option value="GBP" ${fn:contains(model.lastBrokerageNum,'GBP')?"selected":"" }>GBP</option>
												<option value="HKD" ${fn:contains(model.lastBrokerageNum,'HKD')?"selected":"" }>HKD</option>
												<option value="NZD" ${fn:contains(model.lastBrokerageNum,'NZD')?"selected":"" }>NZD</option>
												<option value="AUD" ${fn:contains(model.lastBrokerageNum,'AUD')?"selected":"" }>AUD</option>
												<option value="JPY" ${fn:contains(model.lastBrokerageNum,'JPY')?"selected":"" }>JPY</option>
												<option value="FRA" ${fn:contains(model.lastBrokerageNum,'FRA')?"selected":"" }>FRA</option>
												<option value="CHF" ${fn:contains(model.lastBrokerageNum,'CHF')?"selected":"" }>CHF</option>
												<option value="MYR" ${fn:contains(model.lastBrokerageNum,'MYR')?"selected":"" }>MYR</option>
												<option value="SGD" ${fn:contains(model.lastBrokerageNum,'SGD')?"selected":"" }>SGD</option>
												<option value="N/A" ${fn:contains(model.lastBrokerageNum,'N/A')?"selected":"" }>N/A</option>
											</select>
											<input type="text" name="model.lastBrokerageNum" id="model.lastBrokerageNum" value="${fn:substring(model.lastBrokerageNum,3,20) }" size="6">
										</td>
										<td align="right">剩余佣金预计返还时间：</td>
										<td align="left" colspan="5">
											<input type="text" name="model.lastBrokerageArriveDate" size="12" id="model.lastBrokerageArriveDate" 
												class="Wdate naDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
													value='<s:date name="model.lastBrokerageArriveDate" format="yyyy-MM-dd"/>'/>
											<input type="checkbox" class="na">N/A
										</td>
									</tr>
									<tr>
										<td align="right" width="120">备　　注：</td>
										<td align="left" colspan="7">
											<textarea rows="2" style="width:99%;" name="model.descn">${model.descn }</textarea>
										</td>
									</tr>
								</table>
							</fieldset>
							<fieldset style="margin:10px;">
								<legend>其他</legend>
								<table style="width:800px">
									<tr>
										<td align="right" width="70">学生来源：</td>
										<td align="left" width="210">
											<select name="model.source" id="model.source" style="width: 100px;margin: 0" onchange="inputSource(this)">
												<option value="">-请选择-</option>
												<option ${model.source=="石家庄分公司"?"selected":"" } value="石家庄分公司">石家庄分公司</option>
												<option ${model.source=="0"?"selected":"" } value="0">手填</option>
											</select>
											<input size="10" name="model.otherSource" id="model.otherSource" value="${model.otherSource }" style="display: none">
										</td>
										<td align="right" width="80">顾问：</td>
										<td align="left">
											<select onchange="changeAdvSel(this)" name="model.advisor" id="model.advisor" style="width:88px;margin: 0">
												<option value="">--请选择--</option>
												<c:forEach items="${advEmps}" var="emp">
													<option ${model.advisor==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
												</c:forEach>
												<option ${model.advisor=='0'?"selected":"" } value="0">手动填写</option>
											</select>
											<br><input style="width: 100px" type="${model.advisor=='0'?'text':'hidden' }" id="model.otherAdvisor" name="model.otherAdvisor" value="${model.otherAdvisor}">
										</td>
										<td align="right">文案：</td>
										<td align="left">
											<select onchange="changeDocSel(this)" name="model.docEmp" id="model.docEmp" style="width:88px;margin: 0">
												<option value="">--请选择--</option>
												<c:forEach items="${docEmps}" var="emp">
													<option ${model.docEmp==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
												</c:forEach>
												<option ${model.docEmp=='0'?"selected":"" } value="0">手动填写</option>
											</select>
											<br><input style="width: 100px" type="${model.docEmp=='0'?'text':'hidden' }" id="model.otherDocEmp" name="model.otherDocEmp" value="${model.otherDocEmp }">
										</td>
										<td align="right">规划：</td>
										<td align="left">
											<input type="text" name="model.planEmp" id="model.planEmp" value="${model.planEmp}" size="12">
										</td>
									</tr>
								</table>
							</fieldset>
							<table width="100%" style="margin-bottom:10px;">
								<tr>
									<td colspan="2" align="center" class="font_white">
									<input type="hidden" name="isAll" value="${isAll }" />
									<s:submit value="保存" cssClass="button"></s:submit>&nbsp;&nbsp;
									<input type="button" value="返回" class="button" onclick="history.back()"/>
									</td>
								</tr>
							</table>
						</s:form>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>