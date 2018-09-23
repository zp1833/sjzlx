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
<script type="text/javascript" src="${ctx}/js/jquery/jquery-1.2.1.js"></script>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/dwr/interface/YmInfoManager.js"></script>
<script type="text/javascript">
	
	function selectField() {
		var params = window.showModalDialog("${ctx}/pages/admin/ym/fieldDefine.jsp",$("#definedField").val(),"dialogWidth=600px;dialogHeight=600px");
		$("#definedField").val(params);
	}

	function defineSearch(value) {
		var params = window.showModalDialog("${ctx}/pages/admin/ym/defineSearch.jsp",value,"dialogWidth=400px;dialogHeight=170px");
		$("#definedSearch").val(params);
	}

	function removeYmInfo(id) {
		if (confirm('您确定删除当前记录吗？'))
			YmInfoManager.removeYmInfo(id, function() {
				ECSideUtil.reload("ec");
			});
	}
	
	function showDetail(id) {	
		$("#stuDetails").attr("src","lookYmInfo.do?model.id="+id);
	}
	
	$(function() {
		var documentHeight = $(document).height();
		$("#stuDetails").height(documentHeight-535);
	});
	
</script>
</head>
<body>
<div class="x-panel">
  <div class="x-panel-header">移民信息管理</div>
    <div class="x-toolbar">
      <s:form action="listYmInfo" theme="simple">
	      <table width="100%">
	      	<tr>
	          	<td> 
					客户姓名：<input name="model.stuName" value="${model.stuName }" style="width: 85px">
					咨询日期：<input type="text" name="beginAdvDate" size="12" id="beginAdvDate" 
							class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
								value='<s:date name="beginAdvDate" format="yyyy-MM-dd"/>'/> 至 
						  <input type="text" name="endAdvDate" size="12" id="endAdvDate" 
							class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
								value='<s:date name="endAdvDate" format="yyyy-MM-dd"/>'/>
					当前进度：<select name="model.currentPlan" id="model.currentPlan" style="width:100px;margin: 0">
								<option value="">--请选择--</option>
								<option ${model.currentPlan=="咨询中"?"selected":"" } value="咨询中">咨询中</option>
								<option ${model.currentPlan=="学校申请准备"?"selected":"" } value="学校申请准备">学校申请准备</option>
								<option ${model.currentPlan=="学校申请中"?"selected":"" } value="学校申请中">学校申请中</option>
								<option ${model.currentPlan=="签证申请准备"?"selected":"" } value="签证申请准备">签证申请准备</option>
								<option ${model.currentPlan=="签证申请中"?"selected":"" } value="签证申请中">签证申请中</option>
								<option ${model.currentPlan=="后期服务"?"selected":"" } value="后期服务">后期服务</option>
								<option ${model.currentPlan=="退费"?"selected":"" } value="退费">退费</option>
							</select>
					移民类型：<select name="model.ymType" id="model.ymType" style="width:88px;margin: 0px">
								<option value="">--请选择--</option>
								<option ${model.ymType=="技术移民"?"selected":"" } value="技术移民">技术移民</option>
								<option ${model.ymType=="雇主担保"?"selected":"" } value="雇主担保">雇主担保</option>
								<option ${model.ymType=="投资移民"?"selected":"" } value="投资移民">投资移民</option>
								<option ${model.ymType=="家属团聚"?"selected":"" } value="家属团聚">家属团聚</option>
								<option ${model.ymType=="购房移民"?"selected":"" } value="购房移民">购房移民</option>
								<option ${model.ymType=="其他"?"selected":"" } value="其他">其他</option>
							</select>
					下次回访时间：<input type="text" name="beginVisitDate" size="12" id="beginVisitDate" 
								class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
									value='<s:date name="beginVisitDate" format="yyyy-MM-dd"/>'/> 至
							   <input type="text" name="endVisitDate" size="12" id="endVisitDate" 
								class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
									value='<s:date name="endVisitDate" format="yyyy-MM-dd"/>'/>
		        	<s:submit value="查询" cssClass="button"></s:submit>
				</td>
	       	</tr>
	        <tr>
	          <td> 
	            	联系方式：<input name="model.contact" value="${model.contact}" style="width: 85px">
	            	签约日期：<input type="text" name="beginSignDate" size="12" id="beginSignDate" 
							class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
								value='<s:date name="beginSignDate" format="yyyy-MM-dd"/>'/> 至
						   <input type="text" name="endSignDate" size="12" id="endSignDate" 
							class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
								value='<s:date name="endSignDate" format="yyyy-MM-dd"/>'/>
					客户分类：<select name="model.stuType" style="width:100px;margin: 0">
								<option value="">--请选择--</option>
								<option ${model.stuType=="签约率90%以上"?"selected":"" } value="签约率90%以上">签约率90%以上</option>
								<option ${model.stuType=="签约率80%"?"selected":"" } value="签约率80%">签约率80%</option>
								<option ${model.stuType=="签约率50%"?"selected":"" } value="签约率50%">签约率50%</option>
								<option ${model.stuType=="签约率20%"?"selected":"" } value="签约率20%">签约率20%</option>
							</select>
					咨询国家：<select name="model.advCountry" id="model.advCountry" style="width:88px;margin: 0" onchange="inputCountry(this)">
								<option value="">--请选择--</option>
								<option ${model.advCountry=='美国'?"selected":"" } value="美国">美国</option>
								<option ${model.advCountry=='加拿大'?"selected":"" } value="加拿大">加拿大</option>
								<option ${model.advCountry=='希腊'?"selected":"" } value="希腊">希腊</option>
								<option ${model.advCountry=='西班牙'?"selected":"" } value="西班牙">西班牙</option>
								<option ${model.advCountry=='葡萄牙'?"selected":"" } value="葡萄牙">葡萄牙</option>
								<option ${model.advCountry=='塞浦路斯'?"selected":"" } value="塞浦路斯">塞浦路斯</option>
								<option ${model.advCountry=='匈牙利'?"selected":"" } value="匈牙利">匈牙利</option>
								<option ${model.advCountry=='意大利'?"selected":"" } value="意大利">意大利</option>
								<option ${model.advCountry=='澳大利亚'?"selected":"" } value="澳大利亚">澳大利亚</option>
								<option ${model.advCountry=='新西兰'?"selected":"" } value="新西兰">新西兰</option>
								<option ${model.advCountry=='英国'?"selected":"" } value="英国">英国</option>
								<option ${model.advCountry=='香港'?"selected":"" } value="香港">香港</option>
								<option ${model.advCountry=='新加坡'?"selected":"" } value="新加坡">新加坡</option>
							</select>
					<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN">
					　　顾问姓名：<select name="model.advisor" style="margin: 0;width:83px;">
									<option value="">--请选择--</option>
									<c:forEach items="${advEmps}" var="emp">
										<option ${model.advisor==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
									</c:forEach>
								</select>
					</stc:role>
					<input type="button" value="选择字段" class="button" onclick="selectField();">
					<input type="hidden" value="${definedField }" id="definedField" name="definedField">
					<input type="button" value="自定义查询" class="button" onclick="defineSearch($('#definedSearch').val())">
					<input type="hidden" value="${definedSearch }" id="definedSearch" name="definedSearch">
	          </td>
	       </tr>
	     </table>
      </s:form>
	</div>   

	<div class="x-panel-body">
		<div style="margin-left:-3px;" align="center">
			<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit" 
				filterRowsCallback="limit"
				action="listYmInfo.do"
				useAjax="true" doPreload="false"
				xlsFileName="移民信息列表.xls" 
				maxRowsExported="1000" 
				pageSizeList="20,100" 
				editable="false" 
				sortable="true"	
				rowsDisplayed="20"	
				generateScript="true"	
				resizeColWidth="true"	
				classic="false"	
				width="100%" 	
				height="400px"	
				minHeight="400">
				<ec:row onclick="showDetail(${item.id})">
					<ec:column width="40" property="_0" title="序号" value="${GLOBALROWCOUNT}" style="text-align:center" sortable="false"/>
					<c:if test="${definedField != null && definedField != ''}">
						<c:if test="${fn:contains(definedField, 'stuName_s')}">
							<ec:column width="60" property="stuName" title="客户姓名" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'advDate_s')}">
							<ec:column width="70" property="advDate" title="咨询日期" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'advCountry_s')}">
							<ec:column width="60" property="advCountry" title="咨询国家" style="text-align:center" value="${fn:replace(item.advCountry, '#', '')}" />
						</c:if>
						<c:if test="${fn:contains(definedField, 'ymType_s')}">
							<ec:column width="60" property="ymType" title="移民类型" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'advisor_s')}">
							<ec:column width="60" property="advisor" title="顾问姓名" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'nextVisitTime_s')}">
							<ec:column width="90" property="nextVisitTime" title="下次回访时间" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'stuType_s')}">
							<ec:column width="70" property="stuType" title="客户分类" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'signStatus_s')}">
							<ec:column width="60" property="signStatus" title="签约情况" style="text-align:center" value="${item.signStatus=='0'?'否':'是' }"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'source_s')}">
							<ec:column width="60" property="source" title="信息来源" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'sourceFrom_s')}">
							<ec:column width="70" property="sourceFrom" title="来源明细" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'advType_s')}">
							<ec:column width="60" property="advType" title="咨询形式" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'recEmp_s')}">
							<ec:column width="60" property="recEmp" title="接待员工" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'currentPlan_s')}">
							<ec:column width="80" property="currentPlan" title="当前进度" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'statusDefineTime_s')}">
							<ec:column width="90" property="statusDefineTime" title="状态定义日期" style="text-align:center" cell="date" format="yyyy-MM-dd" />
						</c:if>
						<c:if test="${fn:contains(definedField, 'speciality_s')}">
							<ec:column width="80" property="speciality" title="所学专业" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'finishSchool_s')}">
							<ec:column width="80" property="finishSchool" title="毕业院校" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'education_s')}">
							<ec:column width="60" property="education" title="最高学历" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'jobExp_s')}">
							<ec:column width="60" property="jobExp" title="工作经验" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'busiExp_s')}">
							<ec:column width="60" property="busiExp" title="经商经验" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'buyHouse_s')}">
							<ec:column width="60" property="buyHouse" title="海外购房" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'abroadInvest_s')}">
							<ec:column width="60" property="abroadInvest" title="海外投资" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'inspect_s')}">
							<ec:column width="60" property="inspect" title="短期考察" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'finances_s')}">
							<ec:column width="60" property="finances" title="资金状况" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'contact_s')}">
							<stc:role ifAnyGranted="ROLE_AUDIT,ROLE_SEARCH">
								<ec:column width="60" property="contact" title="联系方式">######</ec:column>
							</stc:role>
							<stc:role ifNotGranted="ROLE_AUDIT,ROLE_SEARCH">
								<ec:column width="80" property="contact" title="联系方式" style="text-align:center"/>
							</stc:role>
						</c:if>
						<c:if test="${fn:contains(definedField, 'enDegree_s')}">
							<ec:column width="60" property="enDegree" title="外语程度" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'age_s')}">
							<ec:column width="40" property="age" title="年龄" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'isMerried_s')}">
							<ec:column width="40" property="isMerried" title="婚否" style="text-align:center" value="${item.isMerried=='0'?'否':'是' }"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'sex_s')}">
							<ec:column width="40" property="sex" title="性别" style="text-align:center" value="${item.sex=='0'?'女':'男' }"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'isHasRefuser_s')}">
							<ec:column width="80" property="isHasRefuser" title="有无拒签史" style="text-align:center" value="${item.isHasRefuser=='0'?'无':'有' }"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'introToIELTS_s')}">
							<ec:column width="80" property="introToIELTS" title="介绍给语言" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'recentTraceTime_s')}">
							<ec:column width="90" property="recentTraceTime" title="最新跟踪时间" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'signTime_s')}">
							<ec:column width="120" property="signTime" title="签约日期" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'signName_s')}">
							<ec:column width="60" property="signName" title="签 约 人" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'serviceCharge_s')}">
							<ec:column width="60" property="serviceCharge" title="服 务 费" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'downPayment_s')}">
							<ec:column width="60" property="downPayment" title="首 期 款" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'endPayment_s')}">
							<ec:column width="60" property="endPayment" title="后 期 款" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'ymTypeName_s')}">
							<ec:column width="110" property="ymTypeName" title="移民项目类别名称" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'sendTime_s')}">
							<ec:column width="120" property="sendTime" title="递交时间" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'docId_s')}">
							<ec:column width="60" property="docId" title="档案号码" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'meetTime_s')}">
							<ec:column width="80" property="meetTime" title="面试时间" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'leaveTime_s')}">
							<ec:column width="90" property="leaveTime" title="预计离境时间" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'pickUpPlan_s')}">
							<ec:column width="80" property="pickUpPlan" title="接机安排" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'livePlan_s')}">
							<ec:column width="100" property="livePlan" title="住宿协助安排" style="text-align:center"/>
						</c:if>
						<c:if test="${fn:contains(definedField, 'otherRequest_s')}">
							<ec:column width="80" property="otherRequest" title="其他需求" style="text-align:center"/>
						</c:if>
					</c:if>
					<c:if test="${definedField == null || definedField == ''}">
						<ec:column width="60" property="stuName" title="客户姓名" style="text-align:center"/>
						<ec:column width="70" property="advDate" title="咨询日期" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						<ec:column width="60" property="advCountry" title="咨询国家" style="text-align:center" value="${fn:replace(item.advCountry, '#', '')}" />
						<ec:column width="60" property="ymType" title="移民类型" style="text-align:center"/>
						<ec:column width="60" property="advisor" title="顾问姓名" style="text-align:center"/>
						<ec:column width="90" property="nextVisitTime" title="下次回访时间" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						<ec:column width="70" property="stuType" title="客户分类" style="text-align:center"/>
						<ec:column width="60" property="signStatus" title="签约情况" style="text-align:center" value="${item.signStatus=='0'?'否':'是' }"/>
					</c:if>
					<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_REC,ROLE_DOC">	
						<ec:column width="60" property="_1" title="操作" style="text-align:center" viewsAllowed="html">
						   <a href="editYmInfo.do?model.id=${item.id}&showType=${showType }">
						      <img src="${ctx}/images/icons/modify.gif" style="border:0px" title="编辑"/>
						   </a>
						   <a href="#" onclick="removeYmInfo(${item.id})">
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