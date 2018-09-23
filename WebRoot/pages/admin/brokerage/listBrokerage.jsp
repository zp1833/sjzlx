<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<%@include file="/common/meta.jsp" %>
<title></title>
<%@include file="/common/ec.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<%@include file="/common/dwr.jsp" %>
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css"> 
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/dwr/interface/BrokerageManager.js"></script>
<script type="text/javascript">
	
	function selectField(value) {
		var params = window.showModalDialog("${ctx}/pages/admin/brokerage/fieldDefine.jsp",$("#definedField").val(),"dialogWidth=730px;dialogHeight=500px");
		$("#definedField").val(params);
	}

	function removeBrokerage(id) {
		if (confirm('您确定删除当前记录吗？'))
			BrokerageManager.removeBrokerage(id, function() {
				ECSideUtil.reload("ec");
			});
	}
	
	function showDetail(id) {
		$("#stuDetails").attr("src","lookBrokerage.do?model.id="+id);
	}
	
	$(function() {
		var documentHeight = $(document).height();
		$("#stuDetails").height(documentHeight-$(".x-panel").height()-5);
		$("#applyType").combobox("setValue",'${model.applyType}');
		$("#partner").combobox("setValue",'${model.partner}');
		$("#modelAdvisor").combobox("setValue",'${model.advisor}');
		$("#modelDocEmp").combobox("setValue",'${model.docEmp}');
		
		<c:if test="${isAll == 1}">
		$("#modelCountry").combobox({
			data:[{"text":"美国"},{"text":"加拿大"},{"text":"澳大利亚"},{"text":"新西兰"},{"text":"香港"},{"text":"英国"},{"text":"日本"},{"text":"韩国"},{"text":"法国"},{"text":"新加坡"},{"text":"爱尔兰"},{"text":"马来西亚"}
					,{"text":"俄罗斯"},{"text":"荷兰"},{"text":"西班牙"},{"text":"德国"},{"text":"挪威"},{"text":"瑞典"},{"text":"丹麦"},{"text":"芬兰"},{"text":"瑞士"},{"text":"匈牙利"}],
			valueField: 'text',    
        	textField: 'text'
		});
		</c:if> 
	});
	
</script>
<style type="text/css">
	td {
		font-family:Times New Roman
	}
</style>
</head>
<body >
<div class="x-panel">
  <div class="x-panel-header">学生佣金管理</div>
    <div class="x-toolbar">
      <s:form action="listBrokerage" theme="simple">
	      <table width="100%">
	      	<tr>
	          <td> 
	            	姓　　名：<input name="model.stuName" value="${model.stuName }" style="width: 85px">
					入读学校(中文)：<input name="model.school" value="${model.school }" size="12">
					入读学校(英文)：<input name="model.schoolEnName" value="${model.schoolEnName }" size="12">
					顾问：<select name="model.advisor" id="modelAdvisor" style="width:88px;margin: 0" class="easyui-combobox">
							<option value="">--请选择--</option>
							<c:forEach items="${advEmps}" var="emp">
								<option ${model.advisor==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
							</c:forEach>
						</select>
	            	入读时间：<input type="text" name="model.beginDate" size="12" id="model.beginDate" 
							class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
								value='<s:date name="model.beginDate" format="yyyy-MM-dd"/>'/> 至 
						<input type="text" name="model.endDate" size="12" id="model.endDate" 
							class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
								value='<s:date name="model.endDate" format="yyyy-MM-dd"/>'/>  
			        <!-- 
			        <input type="button" value="选择字段" class="button" onclick="selectField();">
			         -->
			        <c:if test="${isAll == 1}">
				         所去国家：<input id="modelCountry" name="model.country" style="width: 100px;margin: 0" value="${model.country }"/>
			        </c:if> 
			        <c:if test="${isAll != 1}">
				        <input id="modelCountry" name="model.country" type="hidden" value="${model.country }"/>
			        </c:if>
		      	 	<input type="hidden" value="${definedField }" id="definedField" name="definedField">
		       		&nbsp;&nbsp;<s:submit value="查询" cssClass="button"></s:submit>
		        	<input type="hidden" name="isAll" value="${isAll }" />
	         </td>
	         <td align="right" width="40" rowspan="2">
	         	<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN,ROLE_DOC,ROLE_END">
	         		<a href="${ctx}/admin/brokerage/newBrokerage.do"><img src="${ctx}/images/exticons/add.gif"/>添加</a>
	         	</stc:role>
	         <td>
	       	</tr>
	        <tr>
	          <td> 
	            	申请类型：<select name="model.applyType" id="applyType" style="width: 85px;margin: 0" class="easyui-combobox">
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
					入读专业(中文)：<input name="model.speciality" value="${model.speciality }" size="12">
					入读专业(英文)：<input name="model.specialityEnName" value="${model.specialityEnName }" size="12">
					文案：<select name="model.docEmp" id="modelDocEmp" style="width:88px;margin: 0" class="easyui-combobox">
							<option value="">--请选择--</option>
							<c:forEach items="${docEmps}" var="emp">
								<option ${model.docEmp==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
							</c:forEach>
						</select>
					合作方：　<select name="model.partner" id="partner" style="width: 100px;margin: 0" class="easyui-combobox">
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
					全额佣金到账：<select name="model.isAllBrokerageArrived" style="width: 60px;margin: 0">
								<option value="">请选择</option>
								<option ${model.isAllBrokerageArrived=="是"?"selected":"" } value="是">是</option>
								<option ${model.isAllBrokerageArrived=="否"?"selected":"" } value="否">否</option>
							</select>
	         </td>
	       </tr>
	     </table>
      </s:form>
	</div>   
	<stc:role ifAnyGranted="ROLE_ADMIN">
		<c:set var="xlsFileName" value="学员佣金信息列表.xls"></c:set>
	</stc:role>
	<c:if test="${userInSession.employees.isDeptAdmin == '1'}">
		<c:set var="xlsFileName" value="学员佣金信息列表.xls"></c:set>
	</c:if>
	<div class="x-panel-body">
		<div style="margin-left:-3px;" align="center">
			<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit" 
				filterRowsCallback="limit"
				action="listBrokerage.do"
				useAjax="true" doPreload="false"
				xlsFileName="${xlsFileName }" 
				maxRowsExported="1000" 
				pageSizeList="15,30,50,100,200,500,1000" 
				editable="false" 
				sortable="false"	
				rowsDisplayed="20"	
				generateScript="true"	
				resizeColWidth="true"	
				classic="false"	
				width="100%" 	
				height="300px"	
				minHeight="300"
				>
				<ec:row onclick="showDetail(${item.id})" >
					<ec:column width="40" property="_0" title="序号" value="${GLOBALROWCOUNT}" style="text-align:center" sortable="false"/>
					<ec:column width="60" property="stuName" title="姓名" style="text-align:center;"/>
					<ec:column width="80" property="birthday" title="出生日期" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					<ec:column width="40" property="sex" title="性别" style="text-align:center"/>
					<ec:column width="70" property="stuId" title="学生ID" style="text-align:center"/>
					<ec:column width="70" property="country" title="所去国家" style="text-align:center"/>
					<ec:column width="70" property="applyType" title="申请类型" style="text-align:center"/>
					<ec:column width="80" property="joinDate" title="语言入读时间" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
					<ec:column width="80" property="zhengJoinDate" title="正课入读时间" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
					<ec:column width="100" property="school" title="入读学校(中文)" style="text-align:center"/>
					<ec:column width="100" property="schoolEnName" title="入读学校(英文)" style="text-align:center"/>
					<ec:column width="100" property="speciality" title="入读专业(中文)" style="text-align:center"/>
					<ec:column width="100" property="specialityEnName" title="入读专业(英文)" style="text-align:center"/>
					<ec:column width="85" property="langTuition" title="语言学费金额" style="text-align:center" value="${fn:contains(item.langTuition,'N/A')?'N/A':item.langTuition }"/>
					<ec:column width="100" property="speTuition" title="专业课学费金额" style="text-align:center" value="${fn:contains(item.speTuition,'N/A')?'N/A':item.speTuition }"/>
					<ec:column width="60" property="partner" title="合作方" style="text-align:center" />
					<ec:column width="100"  property="partnerPeriod" title="合作方返佣周期" style="text-align:center"/>
					<ec:column width="85" property="langProportion" title="佣金制度/比例" style="text-align:center" />
					<ec:column width="130" property="brokerageArriveNum" title="第一笔佣金到账金额" style="text-align:center" value="${fn:contains(item.brokerageArriveNum,'N/A')?'N/A':item.brokerageArriveNum }"/>
					<ec:column width="130" property="brokerageArriveDate" title="第一笔佣金到账时间" style="text-align:center" value="${fn:contains(item.brokerageArriveDate,'2000-01-01')?'N/A':fn:split(item.brokerageArriveDate,' ')[0] }"/>
					<ec:column width="130" property="brokerageRate" title="第一笔佣金当前汇率" style="text-align:center"/>
					<ec:column width="130" property="brokerageToRmb" title="第一笔佣金折合人民币" style="text-align:center"/>
					<ec:column width="85" property="isAllBrokerageArrived" title="全额佣金到账" style="text-align:center"/>
					<ec:column width="130" property="brokerageArriveNum2" title="第二笔佣金到账金额" style="text-align:center" value="${fn:contains(item.brokerageArriveNum2,'N/A')?'N/A':item.brokerageArriveNum2 }"/>
					<ec:column width="130" property="brokerageArriveDate2" title="第二笔佣金到账时间" style="text-align:center" value="${fn:contains(item.brokerageArriveDate2,'2000-01-01')?'N/A':fn:split(item.brokerageArriveDate2,' ')[0] }"/>
					<ec:column width="130" property="brokerageRate2" title="第二笔佣金当前汇率" style="text-align:center"/>
					<ec:column width="130" property="brokerageToRmb2" title="第二笔佣金折合人民币" style="text-align:center"/>
					<ec:column width="85" property="lastBrokerageNum" title="剩余佣金金额" style="text-align:center" value="${fn:contains(item.lastBrokerageNum,'N/A')?'N/A':item.lastBrokerageNum }"/>
					<ec:column width="130" property="lastBrokerageArriveDate" title="剩余佣金预计返还时间" style="text-align:center" value="${fn:contains(item.lastBrokerageArriveDate,'2000-01-01')?'N/A':fn:split(item.lastBrokerageArriveDate,' ')[0] }"/>
					<ec:column width="80" property="source" title="学生来源" style="text-align:center">
						<c:if test="${item.source == '0'}">${item.otherSource}</c:if>
						<c:if test="${item.source != '0'}">${item.source}</c:if>
					</ec:column>
					<ec:column width="60" property="advisor" title="顾问" style="text-align:center">
						<c:if test="${item.advisor == '0'}">${item.otherAdvisor}</c:if>
						<c:if test="${item.advisor != '0'}">${item.otherAdvisor}</c:if>
					</ec:column>
					<ec:column width="60" property="docEmp" title="文案" style="text-align:center">
						<c:if test="${item.docEmp == '0'}">${item.otherDocEmp}</c:if>
						<c:if test="${item.docEmp != '0'}">${item.otherDocEmp}</c:if>
					</ec:column>
					<ec:column width="60" property="planEmp" title="规划" style="text-align:center"/>
					<ec:column width="200" property="descn" title="备注" ellipsis="true"/>
					<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN,ROLE_DOC,ROLE_END">
						<ec:column width="60" property="_1" title="操作" style="text-align:center" viewsAllowed="html">
						   <a href="editBrokerage.do?model.id=${item.id}">
						      <img src="${ctx}/images/icons/modify.gif" style="border:0px" title="编辑"/>
						   </a>
						   <a href="#" onclick="removeBrokerage(${item.id})">
						      <img src="${ctx}/images/icons/delete.gif" style="border:0px" title="删除"/>
						   </a>
						</ec:column>
					</stc:role>
				</ec:row>
			</ec:table>
		</div>
	</div>
  </div>
  <iframe width="100%" name="stuDetails" id="stuDetails" frameborder="0" scrolling="auto">
  </iframe>
</body>
</html>