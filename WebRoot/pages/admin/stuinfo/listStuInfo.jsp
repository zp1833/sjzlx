<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息列表</title>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/ec.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<%@include file="/common/dwr.jsp" %>
<script type="text/javascript" src="${ctx}/dwr/interface/StuInfoAction.js"></script>
<script type="text/javascript">

	function onRemove() {
	    var sels = document.getElementsByName('selectedItems');
	    var checked = false;
	    for(i = 0; i < sels.length; i++) {
	        if(sels[i].id == 'selectedItems' && sels[i].checked) {
	           checked = true;
	           break;
	        }
	    } 
	    if(!checked) {
	        alert('请至少选择一条记录。');
	        return;
	    }
	    
	    if(confirm("您确定删除所选记录吗？")) {
	       var articles = new Array();
	       var j=0;
		    for (var i = 0; i < sels.length; i ++) {
		    	if (sels[i].checked) {
		    		articles[j]=sels[i].value;
		    		j++;
		    	}
		    }

		  StuInfoAction.removeStuInfos(articles,function(result){
				  if(result == "1"){
				   	ECSideUtil.reload('ec');
				  } else {
				  	alert("删除中出现错误，请重新登陆！");
				  }
			});
	    } else {
	       return false;
	    }
	}
	
	function selectField(value) {
		var params = window.showModalDialog("${ctx}/pages/admin/stuinfo/fieldDefine.jsp",value,"dialogWidth=800px;dialogHeight=520px");
		$("definedField").value = params;
	}

	function defineSearch(value) {
		var params = window.showModalDialog("${ctx}/pages/admin/stuinfo/defineSearch.jsp",value,"dialogWidth=400px;dialogHeight=170px");
		$("definedSearch").value = params;
	}
	
	function onModify(id,currentPageNo) {
		$("model.id").value = id;
		$("currentPageNo").value = currentPageNo;
		$("modifyFlag").value = "modify";
		$("listStuInfo").action = "${ctx}/admin/stuinfo/editStuInfo.do";
		$("listStuInfo").submit();
	}
	
	var flag = true;
	
	function initWatting(){
		<c:if test="${currentPageNo != 0}">
		var xec = ECSideUtil.getGridObj("ec");
		if(xec.waitingBar != null && flag == true){
			ECSideUtil.gotoPage(${currentPageNo},'ec');
			flag = false;
		}
		if(flag){
		 	setTimeout("initWatting()",200);	
		}
		if(!flag){
			var sels = document.getElementsByName('selectedItems');
			for(var i=0;i<sels.length;i++){
				if(sels[i].value == "${model.id}"){
					var row1 = sels[i].parentNode.parentNode;
					ECSideUtil.selectRow(row1,'ec');
				}
			}
		}
		</c:if>
		
	}
	
</script>
</head>
<body onload="initWatting();">

<div class="x-panel">
    	<div class="x-panel-header">
    		
    		<c:if test="${showType == null || showType == ''}">
    			学生信息总表
    		</c:if>
    		<c:if test="${showType == '0'}">
    			学生信息列表
    		</c:if>
    		<c:if test="${showType == '1'}">
    			签约客户列表
    		</c:if>
    		<c:if test="${showType == '2'}">
    			沉默客户列表
    		</c:if>
    		<c:if test="${showType == '3'}">
    			长期客户列表
    		</c:if>
    		<c:if test="${showType == '4'}">
    			退费客户列表
    		</c:if>
    		<c:if test="${showType == 'success'}">
    			成功客户列表
    		</c:if>
    		
    	</div>
    	<div class="x-toolbar">
	    	<table width="99%">	      
		      <tr>	   
		      	 <td>
		      	 	<s:form action="listStuInfo" id="listStuInfo" method="post" theme="simple">
		      	 		<s:hidden name="model.id" id="model.id"/>
		      	 		<s:hidden name="currentPageNo" id="currentPageNo"/>
		      	 		<s:hidden name="modifyFlag" id="modifyFlag"/>
		      	 		<s:hidden name="showType" id="showType"/>
						<table border="0">
							<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_SEARCH,ROLE_ORADMIN">	      
						      <tr>	   
						      	 <td>学生姓名：</td>
						      	 <td><input type="text" name="name" value="${name }" size="8"></td>
						      	 <td>咨询日期：</td>
						      	 <td><input type="text" name="beginAdvDate" size="12" id="beginAdvDate" 
									class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										value='<s:date name="beginAdvDate" format="yyyy-MM-dd"/>'/> 至
								   <input type="text" name="endAdvDate" size="12" id="endAdvDate" 
									class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										value='<s:date name="endAdvDate" format="yyyy-MM-dd"/>'/>
						      	 </td>
						      	 <td>当前进度：</td>
								 <td>
									<select name="currPlan" style="width:90px">
										<option value="">--请选择--</option>
										<option ${currPlan=="咨询中"?"selected":"" } value="咨询中">咨询中</option>
										<option ${currPlan=="学校申请准备"?"selected":"" } value="学校申请准备">学校申请准备</option>
										<option ${currPlan=="学校申请中"?"selected":"" } value="学校申请中">学校申请中</option>
										<option ${currPlan=="签证申请准备"?"selected":"" } value="签证申请准备">签证申请准备</option>
										<option ${currPlan=="签证申请中"?"selected":"" } value="签证申请中">签证申请中</option>
										<option ${currPlan=="出国"?"selected":"" } value="出国">出国</option>
										<option ${currPlan=="回国"?"selected":"" } value="回国">回国</option>
										<option ${currPlan=="退费"?"selected":"" } value="退费">退费</option>
									</select>
								 </td>
						      	 <td>下次回访时间：</td>
						      	 <td>
						      	 	<input type="text" name="beginVisitDate" size="12" id="beginVisitDate" 
										class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											value='<s:date name="beginVisitDate" format="yyyy-MM-dd"/>'/> 至
									   <input type="text" name="endVisitDate" size="12" id="endVisitDate" 
										class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											value='<s:date name="endVisitDate" format="yyyy-MM-dd"/>'/>
									<input type="submit" value="查询" class="button" style="width:50px"/>
						      	 </td>
						      </tr>
						      <tr>	   
						      	 <td>咨询国家：</td>
						      	 <td><input type="text" name="country" value="${country }" size="8"></td>
						      	 <td>签约日期：</td>
						      	 <td>
						      	 	<input type="text" name="beginSignDate" size="12" id="beginSignDate" 
										class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											value='<s:date name="beginSignDate" format="yyyy-MM-dd"/>'/> 至
									   <input type="text" name="endSignDate" size="12" id="endSignDate" 
										class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											value='<s:date name="endSignDate" format="yyyy-MM-dd"/>'/>
						      	 </td>
						      	 <td>学生分类：</td>
								 <td>
									<select name="type" style="width:90px">
										<option value="">--请选择--</option>
										<option ${model.stuType=="签约率90%以上"?"selected":"" } value="签约率90%以上">签约率90%以上</option>
										<option ${model.stuType=="签约率80%"?"selected":"" } value="签约率80%">签约率80%</option>
										<option ${model.stuType=="签约率50%"?"selected":"" } value="签约率50%">签约率50%</option>
										<option ${model.stuType=="签约率20%"?"selected":"" } value="签约率20%">签约率20%</option>
									</select>
							  	 </td>
							  	 <td>顾问姓名：</td>
						      	 <td align="left">
						      	 	<span style="float:left">
							      	 	<select name="advName">
											<option value="">--请选择--</option>
											<c:forEach items="${advEmps}" var="emp">
												<option ${advName==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
											</c:forEach>
										</select>
									</span>
									<span style="float:right;padding-top: 3px">
										<input type="button" value="选择字段" class="button" onclick="selectField($('definedField').value);">
							      	 	<input type="hidden" value="${definedField }" id="definedField" name="definedField">
							      	 	<input type="button" value="自定义查询" class="button" onclick="defineSearch($('definedSearch').value)">
							      	 	<input type="hidden" value="${definedSearch }" id="definedSearch" name="definedSearch">
						      	 	</span>
						      	 </td>
						      </tr>
						    </stc:role>
						    
						    <stc:role ifNotGranted="ROLE_ADMIN,ROLE_SEARCH,ROLE_ORADMIN">	      
						      <tr>	   
						      	 <td>学生姓名：</td>
						      	 <td><input type="text" name="name" value="${name }" size="8"></td>
						      	 <td>咨询日期：</td>
						      	 <td><input type="text" name="beginAdvDate" size="12" id="beginAdvDate" 
									class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										value='<s:date name="beginAdvDate" format="yyyy-MM-dd"/>'/> 至
								   <input type="text" name="endAdvDate" size="12" id="endAdvDate" 
									class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										value='<s:date name="endAdvDate" format="yyyy-MM-dd"/>'/>
						      	 </td>
						      	 <stc:role ifNotGranted="ROLE_DOC">
							      	 <td>当前进度：</td>
									 <td>
										<select name="currPlan" style="width:90px">
											<option value="">--请选择--</option>
											<option ${currPlan=="咨询中"?"selected":"" } value="咨询中">咨询中</option>
											<option ${currPlan=="学校申请准备"?"selected":"" } value="学校申请准备">学校申请准备</option>
											<option ${currPlan=="学校申请中"?"selected":"" } value="学校申请中">学校申请中</option>
											<option ${currPlan=="签证申请准备"?"selected":"" } value="签证申请准备">签证申请准备</option>
											<option ${currPlan=="签证申请中"?"selected":"" } value="签证申请中">签证申请中</option>
											<option ${currPlan=="出国"?"selected":"" } value="出国">出国</option>
											<option ${currPlan=="回国"?"selected":"" } value="回国">回国</option>
											<option ${currPlan=="退费"?"selected":"" } value="退费">退费</option>
										</select>
									 </td>
							      	 <td>下次回访时间：</td>
							      	 <td colspan="2">
							      	 	<input type="text" name="beginVisitDate" size="12" id="beginVisitDate" 
											class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
												value='<s:date name="beginVisitDate" format="yyyy-MM-dd"/>'/> 至
										   <input type="text" name="endVisitDate" size="12" id="endVisitDate" 
											class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
												value='<s:date name="endVisitDate" format="yyyy-MM-dd"/>'/>
							      	 </td>
						      	 </stc:role>
						      	 <stc:role ifAllGranted="ROLE_ADV,ROLE_DOC">
						      	 	<td>下次回访时间：</td>
							      	 <td colspan="2">
							      	 	<input type="text" name="beginVisitDate" size="12" id="beginVisitDate" 
											class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
												value='<s:date name="beginVisitDate" format="yyyy-MM-dd"/>'/> 至
										   <input type="text" name="endVisitDate" size="12" id="endVisitDate" 
											class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
												value='<s:date name="endVisitDate" format="yyyy-MM-dd"/>'/>
							      	 </td>
						      	 </stc:role>
						      </tr>
						      <tr>	   
						      	 <td>咨询国家：</td>
						      	 <td><input type="text" name="country" value="${country }" size="8"></td>
						      	 <td>签约日期：</td>
						      	 <td>
						      	 	<input type="text" name="beginSignDate" size="12" id="beginSignDate" 
										class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											value='<s:date name="beginSignDate" format="yyyy-MM-dd"/>'/> 至
									   <input type="text" name="endSignDate" size="12" id="endSignDate" 
										class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											value='<s:date name="endSignDate" format="yyyy-MM-dd"/>'/>
						      	 </td>
						      	 <stc:role ifNotGranted="ROLE_DOC">
							      	 <td>学生分类：</td>
									 <td>
										<select name="type" style="width:90px">
											<option value="">--请选择--</option>
											<option ${model.stuType=="签约率90%以上"?"selected":"" } value="签约率90%以上">签约率90%以上</option>
											<option ${model.stuType=="签约率80%"?"selected":"" } value="签约率80%">签约率80%</option>
											<option ${model.stuType=="签约率50%"?"selected":"" } value="签约率50%">签约率50%</option>
											<option ${model.stuType=="签约率20%"?"selected":"" } value="签约率20%">签约率20%</option>
										</select>
								  	 </td>
							  	 </stc:role>
							  	 <stc:role ifAnyGranted="ROLE_REC,ROLE_ORADMIN">
							  	 <td>顾问姓名：</td>
						      	 <td align="left">
						      	 	<span style="float: left">
							      	 	<select name="advName">
											<option value="">--请选择--</option>
											<c:forEach items="${advEmps}" var="emp">
												<option ${advName==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
											</c:forEach>
										</select>
									</span>
						      	 </td>
						      	 </stc:role>
					      	 	 <td align="right">
						      	 <stc:role ifNotGranted="ROLE_AUDIT">	
						      	 	<input type="button" value="自定义查询" class="button" onclick="defineSearch($('definedSearch').value)">
						      	 	<input type="hidden" value="${definedSearch }" id="definedSearch" name="definedSearch">
						      	 </stc:role>
					      	 	</td>
					      	 	<stc:role ifAnyGranted="ROLE_ADV">
						      	 	<c:if test="${userInSession.employees.isDeptAdmin == '1'}">
						      	 		<td>顾问姓名：</td>
					      	 		</c:if>
					      	 	</stc:role>
					      	 	<td>
					      	 	<stc:role ifAnyGranted="ROLE_ADV">
					      	 		<c:if test="${userInSession.employees.isDeptAdmin == '1'}">
						      	 		<select name="advName">
											<option value="">--请选择--</option>
											<c:forEach items="${deptAdvEmps}" var="emp">
												<option ${advName==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
											</c:forEach>
										</select>
									</c:if>
								</stc:role>
				      	 			<input type="submit" value="查询" class="button" style="width:50px"/>
					      	 	</td>
						      </tr>
						    </stc:role>
					    </table>
					</s:form>
		      	 </td>      
		         <td align="right">
			         <table>
				         <tr>
					         <td>
					         	<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_REC">
					         		<a href="${ctx}/admin/stuinfo/newStuInfo.do">
					         		<img src="${ctx}/images/exticons/add.gif"/>添加</a>
					         	</stc:role>
					         </td>
				         	 <td>
				         	 	<stc:role ifAnyGranted="ROLE_ADMIN">
				         	 		<a href="#" onclick="onRemove()">
				         	 		<img src="${ctx}/images/icons/delete.gif"/> 删除</a>
				         	 	</stc:role>		
				         	 </td>
				         </tr>
			         </table>
		         </td>
		      </tr>
	       </table>
    	</div>
    	<div class="x-panel-body">
    	    <div style="margin-left:-3px;" align="center">
    	    <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN">
		    	<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit"
		    	filterRowsCallback="limit"
				action="listStuInfo.do"
				useAjax="true" doPreload="false"
				pageSizeList="10,30,45,60,100,500,1000,2000,3000" 
				editable="false" 
				sortable="true"	
				rowsDisplayed="10"	
				generateScript="true"	
				resizeColWidth="true"	
				classic="true"
				width="100%" 	
				height="240"	
				minHeight="240"  
				xlsFileName="学生信息列表.xls" 
				>
				<c:if test="${definedField != null && definedField != ''}">
					<ec:row>
					    <ec:column width="40" property="_s" title="选择" style="text-align:center" sortable="false">
					    	<input id="selectedItems" type="checkbox" name="selectedItems" value='${item.id}'/>
					    </ec:column>
					<c:if test="${fn:contains(definedField, 'stuName_s')}">
						<ec:column width="80" property="stuName" title="学生姓名">
							<a href="lookStuInfo.do?id=${item.id}" target="stuDetails" title="查看详细信息"><font color="blue">${item.stuName}</font></a>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'advDate_s')}">
						<ec:column width="120" property="advDate" title="咨询日期" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'advCountry_s')}">
						<ec:column width="80" property="advCountry" title="咨询国家">
							${fn:replace(item.advCountry, "#", "")}
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'source_s')}">
						<ec:column width="60" property="source" title="信息来源"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'sourceFrom_s')}">
						<ec:column width="60" property="sourceFrom" title="来源明细" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'advType_s')}">
						<ec:column width="60" property="advType" title="咨询形式" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'recEmp_s')}">
						<ec:column width="60" property="recEmp" title="接待员工"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'advisor_s')}">
						<ec:column width="60" property="advisor" title="负责顾问"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'currentPlan_s')}">
						<ec:column width="60" property="currentPlan" title="当前进度"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'stuType_s')}">
						<ec:column width="80" property="stuType" title="学生类型"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'nextVisitTime_s')}">
						<ec:column width="110" property="nextVisitTime" title="下次回访时间" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'statusDefineTime_s')}">
						<ec:column width="90" property="statusDefineTime" title="状态定义日期" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'contact_s')}">
						<ec:column width="60" property="contact" title="联系方式"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'sex_s')}">
						<ec:column width="40" property="sex" title="性别" style="text-align:center">
							<c:if test="${item.sex==1}">
								男
							</c:if>
							<c:if test="${item.sex!=1}">
								女
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'birthday_s')}">
						<ec:column width="120" property="birthday" title="出生日期" cell="date" format="yyyy-MM-dd"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'isMerried_s')}">
						<ec:column width="40" property="isMerried" title="婚否">
							<c:if test="${item.isMerried==1}">
								是
							</c:if>
							<c:if test="${item.isMerried!=1}">
								否
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'education_s')}">
						<ec:column width="60" property="education" title="文化程度" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'speciality_s')}">
						<ec:column width="60" property="speciality" title="所学专业"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'finishSchool_s')}">
						<ec:column width="120" property="finishSchool" title="毕业院校"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'finishTime_s')}">
						<ec:column width="90" property="finishTime" title="毕业时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'currentSchool_s')}">
						<ec:column width="120" property="currentSchool" title="在读院校"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'currentGrade_s')}">
						<ec:column width="80" property="currentGrade" title="在读年级" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'collegeScore_s')}">
						<ec:column width="60" property="collegeScore" title="高考分" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'isHasRefuser_s')}">
						<ec:column width="60" property="isHasRefuser" title="有无拒签史" style="text-align:center">
							<c:if test="${item.isHasRefuser==1}">
								有
							</c:if>
							<c:if test="${item.isHasRefuser!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'hopeDegree_s')}">
						<ec:column width="60" property="hopeDegree" title="目标学历"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'enDegree_s')}">
						<ec:column width="60" property="enDegree" title="外语程度"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'finances_s')}">
						<ec:column width="60" property="finances" title="资金情况"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'infoDesc_s')}">
						<ec:column width="100" property="infoDesc" title="信息备注" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'traceDesc_s')}">
						<ec:column width="200" property="traceDesc" title="客户跟踪记录" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'recentTraceTime')}">
						<ec:column width="90" property="recentTraceTime" title="最新跟踪时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'introToIELTS_s')}">
						<ec:column width="100" property="introToIELTS" title="介绍给机构"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'signStatus_s')}">
						<ec:column width="80" property="signStatus" title="签约情况" style="text-align:center">
							<c:if test="${item.signStatus==1}">
								是
							</c:if>
							<c:if test="${item.signStatus!=1}">
								否
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'signTime_s')}">
						<ec:column width="90" property="signTime" title="签约时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'signName_s')}">
						<ec:column width="60" property="signName" title="签约人"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'serviceCharge_s')}">
						<ec:column width="60" property="serviceCharge" title="服务费"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'downPayment_s')}">
						<ec:column width="60" property="downPayment" title="首期款"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'endPayment_s')}">
						<ec:column width="60" property="endPayment" title="后期款"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'signDesc_s')}">
						<ec:column width="200" property="signDesc" title="签约备注" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'serviceChargeDetails_s')}">
						<ec:column width="200" property="serviceChargeDetails" title="相关服务费用明细" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'schoolApplyDoc_s')}">
						<ec:column width="120" property="schoolApplyDoc" title="学校申请方案"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'studyingCertificate_cn_s')}">
						<ec:column width="120" property="studyingCertificate_cn" title="在读证明（中）" style="text-align:center">
							<c:if test="${item.studyingCertificate_cn==1}">
								有
							</c:if>
							<c:if test="${item.studyingCertificate_cn!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'studyingCertificate_en_s')}">
						<ec:column width="120" property="studyingCertificate_en" title="在读证明（英）" style="text-align:center">
							<c:if test="${item.studyingCertificate_en==1}">
								有
							</c:if>
							<c:if test="${item.studyingCertificate_en!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'reportCard_cn_s')}">
						<ec:column width="100" property="reportCard_cn" title="成绩单（中）" style="text-align:center">
							<c:if test="${item.reportCard_cn==1}">
								有
							</c:if>
							<c:if test="${item.reportCard_cn!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'reportCard_en_s')}">
						<ec:column width="100" property="reportCard_en" title="成绩单（英）" style="text-align:center">
							<c:if test="${item.reportCard_en==1}">
								有
							</c:if>
							<c:if test="${item.reportCard_en!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'diploma_cn_s')}">
						<ec:column width="100" property="diploma_cn" title="毕业证（中）" style="text-align:center">
							<c:if test="${item.diploma_cn==1}">
								有
							</c:if>
							<c:if test="${item.diploma_cn!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'diploma_en_s')}">
						<ec:column width="100" property="diploma_en" title="毕业证（英）" style="text-align:center">
							<c:if test="${item.diploma_en==1}">
								有
							</c:if>
							<c:if test="${item.diploma_en!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'letterPaper_s')}">
						<ec:column width="30" property="letterPaper" title="信纸" style="text-align:center">
							<c:if test="${item.letterPaper==1}">
								有
							</c:if>
							<c:if test="${item.letterPaper!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'envelope_s')}">
						<ec:column width="30" property="envelope" title="信封" style="text-align:center">
							<c:if test="${item.envelope==1}">
								有
							</c:if>
							<c:if test="${item.envelope!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'schoolApplyPhoto_s')}">
						<ec:column width="120" property="schoolApplyPhoto" title="学校申请照片" style="text-align:center">
							<c:if test="${item.schoolApplyPhoto==1}">
								有
							</c:if>
							<c:if test="${item.schoolApplyPhoto!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'selfDesc_s')}">
						<ec:column width="60" property="selfDesc" title="个人陈述" style="text-align:center">
							<c:if test="${item.selfDesc==1}">
								有
							</c:if>
							<c:if test="${item.selfDesc!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'recommendation_s')}">
						<ec:column width="60" property="recommendation" title="推荐信" style="text-align:center">
							<c:if test="${item.recommendation==1}">
								有
							</c:if>
							<c:if test="${item.recommendation!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'foreignAchievement_s')}">
						<ec:column width="60" property="foreignAchievement" title="外语成绩" style="text-align:center">
							<c:if test="${item.foreignAchievement==1}">
								有
							</c:if>
							<c:if test="${item.foreignAchievement!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'degreeCard_cn_s')}">
						<ec:column width="120" property="degreeCard_cn" title="学位证书（中）" style="text-align:center">
							<c:if test="${item.degreeCard_cn==1}">
								有
							</c:if>
							<c:if test="${item.degreeCard_cn!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'degreeCard_en_s')}">
						<ec:column width="120" property="degreeCard_en" title="学位证书（英）" style="text-align:center">
							<c:if test="${item.degreeCard_en==1}">
								有
							</c:if>
							<c:if test="${item.degreeCard_en!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'encourageCard_s')}">
						<ec:column width="60" property="encourageCard" title="获奖证书" style="text-align:center">
							<c:if test="${item.encourageCard==1}">
								有
							</c:if>
							<c:if test="${item.encourageCard!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'fundProve_s')}">
						<ec:column width="60" property="fundProve" title="存款证明" style="text-align:center">
							<c:if test="${item.fundProve==1}">
								有
							</c:if>
							<c:if test="${item.fundProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'otherApplySchoolDetails_s')}">
						<ec:column width="200" property="otherApplySchoolDetails" title="其他申请学校材料" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'schoolName_s')}">
						<ec:column width="100" property="schoolName" title="学校名称"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'applySpeciality_s')}">
						<ec:column width="80" property="applySpeciality" title="申请专业"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'docSendTime_s')}">
						<ec:column width="90" property="docSendTime" title="材料寄出时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'noticeReceTime_s')}">
						<ec:column width="90" property="noticeReceTime" title="通知书收到时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'inSchoolTime_s')}">
						<ec:column width="90" property="inSchoolTime" title="入学时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'bursaryStatus_s')}">
						<ec:column width="120" property="bursaryStatus" title="奖学金情况"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'schoolApplyDesc_s')}">
						<ec:column width="100" property="schoolApplyDesc" title="学校申请备注"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'visaApplyDoc_s')}">
						<ec:column width="100" property="visaApplyDoc" title="签证申请文案"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'passport_s')}">
						<ec:column width="30" property="passport" title="护照" style="text-align:center">
							<c:if test="${item.passport==1}">
								有
							</c:if>
							<c:if test="${item.passport!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'visaApplyTable_s')}">
						<ec:column width="100" property="visaApplyTable" title="签约申请表" style="text-align:center">
							<c:if test="${item.visaApplyTable==1}">
								有
							</c:if>
							<c:if test="${item.visaApplyTable!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'schoolNoticeBook_s')}">
						<ec:column width="60" property="schoolNoticeBook" title="入学通知书" style="text-align:center">
							<c:if test="${item.schoolNoticeBook==1}">
								有
							</c:if>
							<c:if test="${item.schoolNoticeBook!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'studyPlan_s')}">
						<ec:column width="60" property="studyPlan" title="学习计划" style="text-align:center">
							<c:if test="${item.studyPlan==1}">
								有
							</c:if>
							<c:if test="${item.studyPlan!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'incomeProve_s')}">
						<ec:column width="100" property="incomeProve" title="工作收入证明" style="text-align:center">
							<c:if test="${item.incomeProve==1}">
								有
							</c:if>
							<c:if test="${item.incomeProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'houseHoldBook_s')}">
						<ec:column width="60" property="houseHoldBook" title="户口本" style="text-align:center">
							<c:if test="${item.houseHoldBook==1}">
								有
							</c:if>
							<c:if test="${item.houseHoldBook!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'houseBook_s')}">
						<ec:column width="40" property="houseBook" title="房本" style="text-align:center">
							<c:if test="${item.houseBook==1}">
								有
							</c:if>
							<c:if test="${item.houseBook!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'carBook_s')}">
						<ec:column width="40" property="carBook" title="车本" style="text-align:center">
							<c:if test="${item.carBook==1}">
								有
							</c:if>
							<c:if test="${item.carBook!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'relativeProve_s')}">
						<ec:column width="120" property="relativeProve" title="亲属关系证明" style="text-align:center">
							<c:if test="${item.relativeProve==1}">
								有
							</c:if>
							<c:if test="${item.relativeProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'uncrimeProve_s')}">
						<ec:column width="100" property="uncrimeProve" title="无犯罪证明" style="text-align:center">
							<c:if test="${item.uncrimeProve==1}">
								有
							</c:if>
							<c:if test="${item.uncrimeProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'parentsEduBack_s')}">
						<ec:column width="120" property="parentsEduBack" title="父母教育背景" style="text-align:center">
							<c:if test="${item.parentsEduBack==1}">
								有
							</c:if>
							<c:if test="${item.parentsEduBack!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'applierBack_s')}">
						<ec:column width="120" property="applierBack" title="申请人工作背景" style="text-align:center">
							<c:if test="${item.applierBack==1}">
								有
							</c:if>
							<c:if test="${item.applierBack!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'bankbook_s')}">
						<ec:column width="60" property="bankbook" title="存折存单" style="text-align:center">
							<c:if test="${item.bankbook==1}">
								有
							</c:if>
							<c:if test="${item.bankbook!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'birthProve_s')}">
						<ec:column width="60" property="birthProve" title="出生公证" style="text-align:center">
							<c:if test="${item.birthProve==1}">
								有
							</c:if>
							<c:if test="${item.birthProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'visaApplyPhoto_s')}">
						<ec:column width="120" property="visaApplyPhoto" title="签证申请照片" style="text-align:center">
							<c:if test="${item.visaApplyPhoto==1}">
								有
							</c:if>
							<c:if test="${item.visaApplyPhoto!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'busLicense_s')}">
						<ec:column width="60" property="busLicense" title="营业执照" style="text-align:center">
							<c:if test="${item.busLicense==1}">
								有
							</c:if>
							<c:if test="${item.busLicense!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'taxList_s')}">
						<ec:column width="30" property="taxList" title="税单" style="text-align:center">
							<c:if test="${item.taxList==1}">
								有
							</c:if>
							<c:if test="${item.taxList!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'idCard_s')}">
						<ec:column width="100" property="idCard" title="本人身份证" style="text-align:center">
							<c:if test="${item.idCard==1}">
								有
							</c:if>
							<c:if test="${item.idCard!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'relationIdCard_s')}">
						<ec:column width="100" property="relationIdCard" title="家属身份证" style="text-align:center">
							<c:if test="${item.relationIdCard==1}">
								有
							</c:if>
							<c:if test="${item.relationIdCard!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'loanProve_s')}">
						<ec:column width="60" property="loanProve" title="贷款证明" style="text-align:center">
							<c:if test="${item.loanProve==1}">
								有
							</c:if>
							<c:if test="${item.loanProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'loanAgreement_s')}">
						<ec:column width="60" property="loanAgreement" title="贷款合同" style="text-align:center">
							<c:if test="${item.loanAgreement==1}">
								有
							</c:if>
							<c:if test="${item.loanAgreement!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'physicalExam_s')}">
						<ec:column width="30" property="physicalExam" title="体检" style="text-align:center">
							<c:if test="${item.physicalExam==1}">
								是
							</c:if>
							<c:if test="${item.physicalExam!=1}">
								否
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'loanMoneyHardCopy_s')}">
						<ec:column width="140" property="loanMoneyHardCopy" title="所贷金额存单复印件" style="text-align:center">
							<c:if test="${item.loanMoneyHardCopy==1}">
								有
							</c:if>
							<c:if test="${item.loanMoneyHardCopy!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'loanMoneyProve_s')}">
						<ec:column width="140" property="loanMoneyProve" title="所贷金额存折存单证明" style="text-align:center">
							<c:if test="${item.loanMoneyProve==1}">
								有
							</c:if>
							<c:if test="${item.loanMoneyProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'otherApplyProveDoc_s')}">
						<ec:column width="200" property="otherApplyProveDoc" title="其他申请签证材料"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'sqTime_s')}">
						<ec:column width="90" property="sqTime" title="送签时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'visaResult_s')}">
						<ec:column width="150" property="visaResult" title="送签结果"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'refuserAnalysis_s')}">
						<ec:column width="200" property="refuserAnalysis" title="拒签分析"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'visaApplyDesc_s')}">
						<ec:column width="200" property="visaApplyDesc" title="签证申请备注" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'bookAirTicket_s')}">
						<ec:column width="60" property="bookAirTicket" title="机票预订" style="text-align:center">
							<c:if test="${item.bookAirTicket==1}">
								是
							</c:if>
							<c:if test="${item.bookAirTicket!=1}">
								否
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'pickUpPlan_s')}">
						<ec:column width="60" property="pickUpPlan" title="接机安排" style="text-align:center">
							<c:if test="${item.pickUpPlan==1}">
								有
							</c:if>
							<c:if test="${item.pickUpPlan!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'flyTime_s')}">
						<ec:column width="150" property="flyTime" title="起飞时间" cell="date" format="yyyy-MM-dd HH:mm:ss" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'fallTime_s')}">
						<ec:column width="150" property="fallTime" title="落地时间" cell="date" format="yyyy-MM-dd HH:mm:ss" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'isPickedUp_s')}">
						<ec:column width="60" property="isPickedUp" title="是否接到" style="text-align:center">
							<c:if test="${item.isPickedUp==1}">
								是
							</c:if>
							<c:if test="${item.isPickedUp!=1}">
								否
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'stayPlan_s')}">
						<ec:column width="60" property="stayPlan" title="住宿安排" style="text-align:center">
							<c:if test="${item.stayPlan==1}">
								有
							</c:if>
							<c:if test="${item.stayPlan!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'feedback_s')}">
						<ec:column width="200" property="feedback_s" title="反馈结果"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'feedTime_s')}">
						<ec:column width="90" property="feedTime" title="反馈时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
						<ec:column width="60" property="_4" title="操作" style="text-align:center" sortable="false">
							<a href="#" onclick="onModify('${item.id }','${pageNo }')" target="main">
								<img src="${ctx }/images/icons/modify.gif" border="0"/>
							</a>
						</ec:column>
					</ec:row>
				</c:if>
				<c:if test="${definedField == null || definedField == ''}">
					<ec:row>
					    <ec:column width="40" property="_s" title="选择" style="text-align:center" sortable="false">
					    	<input id="selectedItems" type="checkbox" name="selectedItems" value='${item.id}'/>
					    </ec:column>
						<ec:column width="80" property="stuName" title="学生姓名">
							 <a href="lookStuInfo.do?id=${item.id}" target="stuDetails" title="查看详细信息"><font color="blue">${item.stuName}</font></a>
						</ec:column>
						<ec:column width="80" property="advCountry" title="咨询国家" style="text-align:center">
							${fn:replace(item.advCountry,"#", "")}
						</ec:column>
						<ec:column width="80" property="advisor" title="负责顾问" style="text-align:center"/>
						<ec:column width="80" property="currentGrade" title="在读年级" style="text-align:center"/>
						<ec:column width="80" property="advDate" title="咨询日期" format="yyyy-MM-dd" cell="date" style="text-align:center"/>
						<ec:column width="80" property="currentPlan" title="当前进度" style="text-align:center"/>
						<ec:column width="90" property="stuType" title="学生分类" style="text-align:center"/>
					<c:if test="${showType == '1'}">
						<ec:column width="90" property="signTime" title="签约时间" style="text-align:center" format="yyyy-MM-dd" cell="date"/>
					</c:if>
						<ec:column width="110" property="nextVisitTime" title="下次回访时间" format="yyyy-MM-dd" cell="date" style="text-align:center"/>
						<ec:column width="80" property="signStatus" title="签约情况" style="text-align:center">
							<c:if test="${item.signStatus==1}">
								是
							</c:if>
							<c:if test="${item.signStatus!=1}">
								否
							</c:if>
						</ec:column>
						<ec:column width="60" property="_4" title="操作" style="text-align:center" sortable="false">
							<a href="#" onclick="onModify('${item.id }','${pageNo }')" target="main">
								<img src="${ctx }/images/icons/modify.gif" border="0"/>
							</a>
						</ec:column>
					</ec:row>
				</c:if>
				</ec:table>
			</stc:role>
			
			<stc:role ifAnyGranted="ROLE_SEARCH">
		    	<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit"
		    	filterRowsCallback="limit"
				action="listStuInfo.do"
				useAjax="true" doPreload="false"
				pageSizeList="10,30,45,60,100,500,1000,2000,3000" 
				editable="false" 
				sortable="true"	
				rowsDisplayed="10"	
				generateScript="true"	
				resizeColWidth="true"	
				classic="true"
				width="100%" 	
				height="240"	
				minHeight="240"  
				>
				<c:if test="${definedField != null && definedField != ''}">
					<ec:row>
					    <ec:column width="40" property="_s" title="选择" style="text-align:center" sortable="false">
					    	<input id="selectedItems" type="checkbox" name="selectedItems" value='${item.id}'/>
					    </ec:column>
					<c:if test="${fn:contains(definedField, 'stuName_s')}">
						<ec:column width="80" property="stuName" title="学生姓名">
							<a href="lookStuInfo.do?id=${item.id}" target="stuDetails" title="查看详细信息" id="detail_${item.id}"><font color="blue">${item.stuName}</font></a>
							<span dojoType="dijit.Tooltip" connectId="detail_${item.id}" style="display:none">
				                <span style="font-size:12px;">
				                	${item.traceDesc}
				                </span>
				             </span>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'docId_s')}">
						<ec:column width="40" property="docId" title="档案号"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'advDate_s')}">
						<ec:column width="120" property="advDate" title="咨询日期" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'advCountry_s')}">
						<ec:column width="80" property="advCountry" title="咨询国家">
							${fn:replace(item.advCountry, "#", "")}
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'source_s')}">
						<ec:column width="60" property="source" title="信息来源"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'sourceFrom_s')}">
						<ec:column width="60" property="sourceFrom" title="来源明细" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'advType_s')}">
						<ec:column width="60" property="advType" title="咨询形式" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'recEmp_s')}">
						<ec:column width="60" property="recEmp" title="接待员工"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'advisor_s')}">
						<ec:column width="60" property="advisor" title="负责顾问"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'currentPlan_s')}">
						<ec:column width="60" property="currentPlan" title="当前进度"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'stuType_s')}">
						<ec:column width="80" property="stuType" title="学生类型"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'nextVisitTime_s')}">
						<ec:column width="110" property="nextVisitTime" title="下次回访时间" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'statusDefineTime_s')}">
						<ec:column width="90" property="statusDefineTime" title="状态定义日期" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'contact_s')}">
						<%-- <ec:column width="60" property="contact" title="联系方式">20130802 --%>
						<ec:column width="60" property="contact" title="联系方式">######</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'sex_s')}">
						<ec:column width="40" property="sex" title="性别" style="text-align:center">
							<c:if test="${item.sex==1}">
								男
							</c:if>
							<c:if test="${item.sex!=1}">
								女
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'birthday_s')}">
						<ec:column width="120" property="birthday" title="出生日期" cell="date" format="yyyy-MM-dd"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'isMerried_s')}">
						<ec:column width="40" property="isMerried" title="婚否">
							<c:if test="${item.isMerried==1}">
								是
							</c:if>
							<c:if test="${item.isMerried!=1}">
								否
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'education_s')}">
						<ec:column width="60" property="education" title="文化程度" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'speciality_s')}">
						<ec:column width="60" property="speciality" title="所学专业"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'finishSchool_s')}">
						<ec:column width="120" property="finishSchool" title="毕业院校"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'finishTime_s')}">
						<ec:column width="90" property="finishTime" title="毕业时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'currentSchool_s')}">
						<ec:column width="120" property="currentSchool" title="在读院校"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'currentGrade_s')}">
						<ec:column width="80" property="currentGrade" title="在读年级" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'collegeScore_s')}">
						<ec:column width="60" property="collegeScore" title="高考分" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'isHasRefuser_s')}">
						<ec:column width="60" property="isHasRefuser" title="有无拒签史" style="text-align:center">
							<c:if test="${item.isHasRefuser==1}">
								有
							</c:if>
							<c:if test="${item.isHasRefuser!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'hopeDegree_s')}">
						<ec:column width="60" property="hopeDegree" title="目标学历"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'enDegree_s')}">
						<ec:column width="60" property="enDegree" title="外语程度"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'finances_s')}">
						<ec:column width="60" property="finances" title="资金情况"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'infoDesc_s')}">
						<ec:column width="100" property="infoDesc" title="信息备注" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'traceDesc_s')}">
						<ec:column width="200" property="traceDesc" title="客户跟踪记录" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'recentTraceTime')}">
						<ec:column width="90" property="recentTraceTime" title="最新跟踪时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'introToIELTS_s')}">
						<ec:column width="100" property="introToIELTS" title="介绍给机构"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'signStatus_s')}">
						<ec:column width="80" property="signStatus" title="签约情况" style="text-align:center">
							<c:if test="${item.signStatus==1}">
								是
							</c:if>
							<c:if test="${item.signStatus!=1}">
								否
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'signTime_s')}">
						<ec:column width="90" property="signTime" title="签约时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'signName_s')}">
						<ec:column width="60" property="signName" title="签约人"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'serviceCharge_s')}">
						<ec:column width="60" property="serviceCharge" title="服务费"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'downPayment_s')}">
						<ec:column width="60" property="downPayment" title="首期款"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'endPayment_s')}">
						<ec:column width="60" property="endPayment" title="后期款"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'signDesc_s')}">
						<ec:column width="200" property="signDesc" title="签约备注" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'serviceChargeDetails_s')}">
						<ec:column width="200" property="serviceChargeDetails" title="相关服务费用明细" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'schoolApplyDoc_s')}">
						<ec:column width="120" property="schoolApplyDoc" title="学校申请方案"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'studyingCertificate_cn_s')}">
						<ec:column width="120" property="studyingCertificate_cn" title="在读证明（中）" style="text-align:center">
							<c:if test="${item.studyingCertificate_cn==1}">
								有
							</c:if>
							<c:if test="${item.studyingCertificate_cn!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'studyingCertificate_en_s')}">
						<ec:column width="120" property="studyingCertificate_en" title="在读证明（英）" style="text-align:center">
							<c:if test="${item.studyingCertificate_en==1}">
								有
							</c:if>
							<c:if test="${item.studyingCertificate_en!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'reportCard_cn_s')}">
						<ec:column width="100" property="reportCard_cn" title="成绩单（中）" style="text-align:center">
							<c:if test="${item.reportCard_cn==1}">
								有
							</c:if>
							<c:if test="${item.reportCard_cn!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'reportCard_en_s')}">
						<ec:column width="100" property="reportCard_en" title="成绩单（英）" style="text-align:center">
							<c:if test="${item.reportCard_en==1}">
								有
							</c:if>
							<c:if test="${item.reportCard_en!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'diploma_cn_s')}">
						<ec:column width="100" property="diploma_cn" title="毕业证（中）" style="text-align:center">
							<c:if test="${item.diploma_cn==1}">
								有
							</c:if>
							<c:if test="${item.diploma_cn!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'diploma_en_s')}">
						<ec:column width="100" property="diploma_en" title="毕业证（英）" style="text-align:center">
							<c:if test="${item.diploma_en==1}">
								有
							</c:if>
							<c:if test="${item.diploma_en!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'letterPaper_s')}">
						<ec:column width="30" property="letterPaper" title="信纸" style="text-align:center">
							<c:if test="${item.letterPaper==1}">
								有
							</c:if>
							<c:if test="${item.letterPaper!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'envelope_s')}">
						<ec:column width="30" property="envelope" title="信封" style="text-align:center">
							<c:if test="${item.envelope==1}">
								有
							</c:if>
							<c:if test="${item.envelope!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'schoolApplyPhoto_s')}">
						<ec:column width="120" property="schoolApplyPhoto" title="学校申请照片" style="text-align:center">
							<c:if test="${item.schoolApplyPhoto==1}">
								有
							</c:if>
							<c:if test="${item.schoolApplyPhoto!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'selfDesc_s')}">
						<ec:column width="60" property="selfDesc" title="个人陈述" style="text-align:center">
							<c:if test="${item.selfDesc==1}">
								有
							</c:if>
							<c:if test="${item.selfDesc!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'recommendation_s')}">
						<ec:column width="60" property="recommendation" title="推荐信" style="text-align:center">
							<c:if test="${item.recommendation==1}">
								有
							</c:if>
							<c:if test="${item.recommendation!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'foreignAchievement_s')}">
						<ec:column width="60" property="foreignAchievement" title="外语成绩" style="text-align:center">
							<c:if test="${item.foreignAchievement==1}">
								有
							</c:if>
							<c:if test="${item.foreignAchievement!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'degreeCard_cn_s')}">
						<ec:column width="120" property="degreeCard_cn" title="学位证书（中）" style="text-align:center">
							<c:if test="${item.degreeCard_cn==1}">
								有
							</c:if>
							<c:if test="${item.degreeCard_cn!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'degreeCard_en_s')}">
						<ec:column width="120" property="degreeCard_en" title="学位证书（英）" style="text-align:center">
							<c:if test="${item.degreeCard_en==1}">
								有
							</c:if>
							<c:if test="${item.degreeCard_en!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'encourageCard_s')}">
						<ec:column width="60" property="encourageCard" title="获奖证书" style="text-align:center">
							<c:if test="${item.encourageCard==1}">
								有
							</c:if>
							<c:if test="${item.encourageCard!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'fundProve_s')}">
						<ec:column width="60" property="fundProve" title="存款证明" style="text-align:center">
							<c:if test="${item.fundProve==1}">
								有
							</c:if>
							<c:if test="${item.fundProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'otherApplySchoolDetails_s')}">
						<ec:column width="200" property="otherApplySchoolDetails" title="其他申请学校材料" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'schoolName_s')}">
						<ec:column width="100" property="schoolName" title="学校名称"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'applySpeciality_s')}">
						<ec:column width="80" property="applySpeciality" title="申请专业"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'docSendTime_s')}">
						<ec:column width="90" property="docSendTime" title="材料寄出时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'noticeReceTime_s')}">
						<ec:column width="90" property="noticeReceTime" title="通知书收到时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'inSchoolTime_s')}">
						<ec:column width="90" property="inSchoolTime" title="入学时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'bursaryStatus_s')}">
						<ec:column width="120" property="bursaryStatus" title="奖学金情况"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'schoolApplyDesc_s')}">
						<ec:column width="100" property="schoolApplyDesc" title="学校申请备注"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'visaApplyDoc_s')}">
						<ec:column width="100" property="visaApplyDoc" title="签证申请文案"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'passport_s')}">
						<ec:column width="30" property="passport" title="护照" style="text-align:center">
							<c:if test="${item.passport==1}">
								有
							</c:if>
							<c:if test="${item.passport!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'visaApplyTable_s')}">
						<ec:column width="100" property="visaApplyTable" title="签约申请表" style="text-align:center">
							<c:if test="${item.visaApplyTable==1}">
								有
							</c:if>
							<c:if test="${item.visaApplyTable!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'schoolNoticeBook_s')}">
						<ec:column width="60" property="schoolNoticeBook" title="入学通知书" style="text-align:center">
							<c:if test="${item.schoolNoticeBook==1}">
								有
							</c:if>
							<c:if test="${item.schoolNoticeBook!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'studyPlan_s')}">
						<ec:column width="60" property="studyPlan" title="学习计划" style="text-align:center">
							<c:if test="${item.studyPlan==1}">
								有
							</c:if>
							<c:if test="${item.studyPlan!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'incomeProve_s')}">
						<ec:column width="100" property="incomeProve" title="工作收入证明" style="text-align:center">
							<c:if test="${item.incomeProve==1}">
								有
							</c:if>
							<c:if test="${item.incomeProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'houseHoldBook_s')}">
						<ec:column width="60" property="houseHoldBook" title="户口本" style="text-align:center">
							<c:if test="${item.houseHoldBook==1}">
								有
							</c:if>
							<c:if test="${item.houseHoldBook!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'houseBook_s')}">
						<ec:column width="40" property="houseBook" title="房本" style="text-align:center">
							<c:if test="${item.houseBook==1}">
								有
							</c:if>
							<c:if test="${item.houseBook!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'carBook_s')}">
						<ec:column width="40" property="carBook" title="车本" style="text-align:center">
							<c:if test="${item.carBook==1}">
								有
							</c:if>
							<c:if test="${item.carBook!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'relativeProve_s')}">
						<ec:column width="120" property="relativeProve" title="亲属关系证明" style="text-align:center">
							<c:if test="${item.relativeProve==1}">
								有
							</c:if>
							<c:if test="${item.relativeProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'uncrimeProve_s')}">
						<ec:column width="100" property="uncrimeProve" title="无犯罪证明" style="text-align:center">
							<c:if test="${item.uncrimeProve==1}">
								有
							</c:if>
							<c:if test="${item.uncrimeProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'parentsEduBack_s')}">
						<ec:column width="120" property="parentsEduBack" title="父母教育背景" style="text-align:center">
							<c:if test="${item.parentsEduBack==1}">
								有
							</c:if>
							<c:if test="${item.parentsEduBack!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'applierBack_s')}">
						<ec:column width="120" property="applierBack" title="申请人工作背景" style="text-align:center">
							<c:if test="${item.applierBack==1}">
								有
							</c:if>
							<c:if test="${item.applierBack!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'bankbook_s')}">
						<ec:column width="60" property="bankbook" title="存折存单" style="text-align:center">
							<c:if test="${item.bankbook==1}">
								有
							</c:if>
							<c:if test="${item.bankbook!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'birthProve_s')}">
						<ec:column width="60" property="birthProve" title="出生公证" style="text-align:center">
							<c:if test="${item.birthProve==1}">
								有
							</c:if>
							<c:if test="${item.birthProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'visaApplyPhoto_s')}">
						<ec:column width="120" property="visaApplyPhoto" title="签证申请照片" style="text-align:center">
							<c:if test="${item.visaApplyPhoto==1}">
								有
							</c:if>
							<c:if test="${item.visaApplyPhoto!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'busLicense_s')}">
						<ec:column width="60" property="busLicense" title="营业执照" style="text-align:center">
							<c:if test="${item.busLicense==1}">
								有
							</c:if>
							<c:if test="${item.busLicense!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'taxList_s')}">
						<ec:column width="30" property="taxList" title="税单" style="text-align:center">
							<c:if test="${item.taxList==1}">
								有
							</c:if>
							<c:if test="${item.taxList!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'idCard_s')}">
						<ec:column width="100" property="idCard" title="本人身份证" style="text-align:center">
							<c:if test="${item.idCard==1}">
								有
							</c:if>
							<c:if test="${item.idCard!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'relationIdCard_s')}">
						<ec:column width="100" property="relationIdCard" title="家属身份证" style="text-align:center">
							<c:if test="${item.relationIdCard==1}">
								有
							</c:if>
							<c:if test="${item.relationIdCard!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'loanProve_s')}">
						<ec:column width="60" property="loanProve" title="贷款证明" style="text-align:center">
							<c:if test="${item.loanProve==1}">
								有
							</c:if>
							<c:if test="${item.loanProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'loanAgreement_s')}">
						<ec:column width="60" property="loanAgreement" title="贷款合同" style="text-align:center">
							<c:if test="${item.loanAgreement==1}">
								有
							</c:if>
							<c:if test="${item.loanAgreement!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'physicalExam_s')}">
						<ec:column width="30" property="physicalExam" title="体检" style="text-align:center">
							<c:if test="${item.physicalExam==1}">
								是
							</c:if>
							<c:if test="${item.physicalExam!=1}">
								否
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'loanMoneyHardCopy_s')}">
						<ec:column width="140" property="loanMoneyHardCopy" title="所贷金额存单复印件" style="text-align:center">
							<c:if test="${item.loanMoneyHardCopy==1}">
								有
							</c:if>
							<c:if test="${item.loanMoneyHardCopy!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'loanMoneyProve_s')}">
						<ec:column width="140" property="loanMoneyProve" title="所贷金额存折存单证明" style="text-align:center">
							<c:if test="${item.loanMoneyProve==1}">
								有
							</c:if>
							<c:if test="${item.loanMoneyProve!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'otherApplyProveDoc_s')}">
						<ec:column width="200" property="otherApplyProveDoc" title="其他申请签证材料"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'sqTime_s')}">
						<ec:column width="90" property="sqTime" title="送签时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'visaResult_s')}">
						<ec:column width="150" property="visaResult" title="送签结果"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'refuserAnalysis_s')}">
						<ec:column width="200" property="refuserAnalysis" title="拒签分析"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'visaApplyDesc_s')}">
						<ec:column width="200" property="visaApplyDesc" title="签证申请备注" style="height:30px"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'bookAirTicket_s')}">
						<ec:column width="60" property="bookAirTicket" title="机票预订" style="text-align:center">
							<c:if test="${item.bookAirTicket==1}">
								是
							</c:if>
							<c:if test="${item.bookAirTicket!=1}">
								否
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'pickUpPlan_s')}">
						<ec:column width="60" property="pickUpPlan" title="接机安排" style="text-align:center">
							<c:if test="${item.pickUpPlan==1}">
								有
							</c:if>
							<c:if test="${item.pickUpPlan!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'flyTime_s')}">
						<ec:column width="150" property="flyTime" title="起飞时间" cell="date" format="yyyy-MM-dd HH:mm:ss" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'fallTime_s')}">
						<ec:column width="150" property="fallTime" title="落地时间" cell="date" format="yyyy-MM-dd HH:mm:ss" style="text-align:center"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'isPickedUp_s')}">
						<ec:column width="60" property="isPickedUp" title="是否接到" style="text-align:center">
							<c:if test="${item.isPickedUp==1}">
								是
							</c:if>
							<c:if test="${item.isPickedUp!=1}">
								否
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'stayPlan_s')}">
						<ec:column width="60" property="stayPlan" title="住宿安排" style="text-align:center">
							<c:if test="${item.stayPlan==1}">
								有
							</c:if>
							<c:if test="${item.stayPlan!=1}">
								无
							</c:if>
						</ec:column>
					</c:if>
					<c:if test="${fn:contains(definedField, 'feedback_s')}">
						<ec:column width="200" property="feedback_s" title="反馈结果"/>
					</c:if>
					<c:if test="${fn:contains(definedField, 'feedTime_s')}">
						<ec:column width="90" property="feedTime" title="反馈时间" cell="date" format="yyyy-MM-dd" style="text-align:center"/>
					</c:if>
					<stc:role ifNotGranted="ROLE_FINANCE,ROLE_AUDIT">
						<ec:column width="60" property="_4" title="操作" style="text-align:center" sortable="false">
						<stc:role ifAnyGranted="ROLE_ORADMIN">
							<a href="#" onclick="onModify('${item.id }','${pageNo }')" target="main">
								<img src="${ctx }/images/icons/modify.gif" border="0"/>
							</a>
						</stc:role>
						<stc:role ifNotGranted="ROLE_ORADMIN">
							<c:if test="${item.advisor == userInSession.employees.name || userInSession.employees.isDeptAdmin == '1'}">		
								<a href="#" onclick="onModify('${item.id }','${pageNo }')" target="main">
									<img src="${ctx }/images/icons/modify.gif" border="0"/>
								</a>
							</c:if>
						</stc:role>
						</ec:column>
					</stc:role>
					</ec:row>
				</c:if>
				<c:if test="${definedField == null || definedField == ''}">
					<ec:row>
					    <ec:column width="40" property="_s" title="选择" style="text-align:center" sortable="false">
					    	<input id="selectedItems" type="checkbox" name="selectedItems" value='${item.id}'/>
					    </ec:column>
						<ec:column width="80" property="stuName" title="学生姓名">
							 <a href="lookStuInfo.do?id=${item.id}" target="stuDetails" title="查看详细信息" id="detail_${item.id}"><font color="blue">${item.stuName}</font></a>
							 <span dojoType="dijit.Tooltip" connectId="detail_${item.id}" style="display:none">
				                <span style="font-size:12px;">${item.traceDesc}</span>
				             </span>
						</ec:column>
						<ec:column width="80" property="advCountry" title="咨询国家" style="text-align:center">
							${fn:replace(item.advCountry,"#", "")}
						</ec:column>
						<ec:column width="80" property="advisor" title="负责顾问" style="text-align:center"/>
						<ec:column width="80" property="currentGrade" title="在读年级" style="text-align:center"/>
						<ec:column width="80" property="advDate" title="咨询日期" format="yyyy-MM-dd" cell="date" style="text-align:center"/>
						<ec:column width="80" property="currentPlan" title="当前进度" style="text-align:center"/>
						<ec:column width="90" property="stuType" title="学生分类" style="text-align:center"/>
					<c:if test="${showType == '1'}">
						<ec:column width="90" property="signTime" title="签约时间" style="text-align:center" format="yyyy-MM-dd" cell="date"/>
					</c:if>
						<ec:column width="110" property="nextVisitTime" title="下次回访时间" format="yyyy-MM-dd" cell="date" style="text-align:center"/>
						<ec:column width="80" property="signStatus" title="签约情况" style="text-align:center">
							<c:if test="${item.signStatus==1}">
								是
							</c:if>
							<c:if test="${item.signStatus!=1}">
								否
							</c:if>
						</ec:column>
					<%-- 	
					<stc:role ifNotGranted="ROLE_FINANCE">
						<ec:column width="60" property="_4" title="操作" style="text-align:center" sortable="false">
							<a href="#" onclick="onModify('${item.id }','${pageNo }')" target="main">
								<img src="${ctx }/images/icons/modify.gif" border="0"/>
							</a>
						</ec:column>
					</stc:role>
					--%>	
					</ec:row>
				</c:if>
				</ec:table>
			</stc:role>
			
			<div style="margin-left:-3px;" align="center">
    	    <stc:role ifNotGranted="ROLE_ADMIN,ROLE_SEARCH,ROLE_ORADMIN">
		    	<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit"
		    	filterRowsCallback="limit"
				action="listStuInfo.do"
				useAjax="true" doPreload="false"
				pageSizeList="10,20,45,60" 
				editable="false" 
				sortable="true"	
				rowsDisplayed="10"	
				generateScript="true"	
				resizeColWidth="true"	
				classic="true"
				width="100%" 	
				height="240"	
				minHeight="240"  
				>
				<ec:row>
					    <ec:column width="40" property="_s" title="选择" style="text-align:center" sortable="false">
					    	<input id="selectedItems" type="checkbox" name="selectedItems" value='${item.id}'/>
					    </ec:column>
						<ec:column width="80" property="stuName" title="学生姓名">
							 <a href="lookStuInfo.do?id=${item.id}" target="stuDetails" id="detail_${item.id}">
							 	<font color="blue">${item.stuName}</font>
							 </a>
							 <span dojoType="dijit.Tooltip" connectId="detail_${item.id}" style="display:none">
				                <span style="font-size:12px;">${item.traceDesc}</span>
				             </span>
						</ec:column>
						<ec:column width="80" property="advCountry" title="咨询国家" style="text-align:center">
							${fn:replace(item.advCountry,"#", "")}
						</ec:column>
						<ec:column width="80" property="advisor" title="负责顾问" style="text-align:center"/>
						<ec:column width="80" property="currentGrade" title="在读年级" style="text-align:center"/>
						<ec:column width="80" property="advDate" title="咨询日期" format="yyyy-MM-dd" cell="date" style="text-align:center"/>
						<ec:column width="80" property="currentPlan" title="当前进度" style="text-align:center"/>
						<ec:column width="90" property="stuType" title="学生分类" style="text-align:center"/>
					<c:if test="${showType == '1'}">
						<ec:column width="90" property="signTime" title="签约时间" style="text-align:center" format="yyyy-MM-dd" cell="date"/>
					</c:if>
						<ec:column width="110" property="nextVisitTime" title="下次回访日期" format="yyyy-MM-dd" cell="date" style="text-align:center"/>
					<stc:role ifNotGranted="ROLE_DOC">	
						<ec:column width="80" property="signStatus" title="签约情况" style="text-align:center">
							<c:if test="${item.signStatus==1}">
								是
							</c:if>
							<c:if test="${item.signStatus!=1}">
								否
							</c:if>
						</ec:column>
					</stc:role>
					<stc:role ifAnyGranted="ROLE_DOC">
						<ec:column width="80" property="signTime" title="签约日期" format="yyyy-MM-dd" cell="date" style="text-align:center"/>
					</stc:role>
					<stc:role ifAllGranted="ROLE_ADV,ROLE_AUDIT">
						<ec:column width="60" property="_4" title="操作" style="text-align:center" sortable="false">
						<c:if test="${item.advisor == userInSession.employees.name}">	
							<a href="#" onclick="onModify('${item.id }','${pageNo }')" target="main">
								<img src="${ctx }/images/icons/modify.gif" border="0"/>
							</a>
						</c:if>
						</ec:column>
					</stc:role>
					<stc:role ifNotGranted="ROLE_FINANCE,ROLE_AUDIT">
						<ec:column width="60" property="_4" title="操作" style="text-align:center" sortable="false">
						<stc:role ifAnyGranted="ROLE_ORADMIN">
							<a href="#" onclick="onModify('${item.id }','${pageNo }')" target="main">
								<img src="${ctx }/images/icons/modify.gif" border="0"/>
							</a>
						</stc:role>
						<stc:role ifNotGranted="ROLE_ORADMIN">
							<c:if test="${item.advisor == userInSession.employees.name || userInSession.employees.isDeptAdmin == '1'}">		
								<a href="#" onclick="onModify('${item.id }','${pageNo }')" target="main">
									<img src="${ctx }/images/icons/modify.gif" border="0"/>
								</a>
							</c:if>
						</stc:role>
						</ec:column>
					</stc:role>
					</ec:row>
				</ec:table>
			</stc:role>
			</div>
    	</div>
</div>
<iframe width="100%" name="stuDetails" id="stuDetails" height="380" frameborder="0" scrolling="auto">

</iframe>
</body>
</html>
