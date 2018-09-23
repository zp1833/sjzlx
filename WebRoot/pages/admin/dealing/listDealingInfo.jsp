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
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css"> 
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/dwr/interface/DealingInfoManager.js"></script>
<script type="text/javascript">
	
	function selectField(value) {
		var params = window.showModalDialog("${ctx}/pages/admin/dealing/fieldDefine.jsp",$("#definedField").val(),"dialogWidth=730px;dialogHeight=500px");
		$("#definedField").val(params);
	}

	function removeDealingInfo(id) {
		if (confirm('您确定删除当前记录吗？'))
			DealingInfoManager.removeDealingInfo(id, function() {
				ECSideUtil.reload("ec");
			});
	}
	
	function showDetail(id) {
		$("#stuDetails").attr("src","lookDealingInfo.do?model.id="+id);
	}
	
	$(function() {
		var documentHeight = $(document).height();
		$("#stuDetails").height(documentHeight-$(".x-panel").height()-5);
		
		var applyTypes = [{"text":"小学"},{"text":"初中"},{"text":"高中"},{"text":"高中预科"},{"text":"学院双录"},{"text":"学院直录"},{"text":"本科双录"},{"text":"本科直录"},{"text":"转学分"},{"text":"研究生文凭"},{"text":"硕士预科"},{"text":"硕士双录"},{"text":"硕士直录"},{"text":"博士"},{"text":"无"}];
		$("#modelApplyType").combobox({
			data:applyTypes,  
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#modelClientType").combobox({
			data:[{"text":"全程留学"},{"text":"学校申请"},{"text":"学生签证"},{"text":"学生访问签证"},{"text":"探亲签证"},{"text":"旅游签证"},{"text":"商务签证"},{"text":"续签签证"},{"text":"团签"},{"text":"J1"},{"text":"假期工作签证"},{"text":"陪读签证"}],  
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#modelClientClass").combobox({
			data:[{"text":"已/确定退费"},{"text":"退费转国家"},{"text":"暂停"},{"text":"成功结案"},{"text":"活跃"}],  
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#modelInterviewType").combobox({
			data:[{"text":"父母"},{"text":"父子"},{"text":"父女"},{"text":"母子"},{"text":"母女"},{"text":"夫妻"},{"text":"兄弟姐妹"},{"text":"朋友"},{"text":"男女朋友"},{"text":"姑叔舅姨"},{"text":"婆媳"},{"text":"公媳"},{"text":"祖孙"},{"text":"无"}],  
			valueField: 'text',    
        	textField: 'text'
		});
	
		$("#modelPartner").combobox({
			data:[{"text":"澳新国际"},{"text":"加诚博教"},{"text":"枫叶海外"},{"text":"温哥华公立教育联盟"},{"text":"广州亚太"},{"text":"AA"},{"text":"华通"},{"text":"琥珀"},{"text":"INDEX"},{"text":"KPL"},{"text":"INTO"},{"text":"GEC"},{"text":"EF"},{"text":"UF"},{"text":"SG"},{"text":"IBG"},{"text":"CIIE"},{"text":"GSS"},{"text":"UCSE"},{"text":"GDX"},{"text":"RIA"},{"text":"IVY"},{"text":"凯尔教育"},{"text":"PIESG"},{"text":"直代"},{"text":"无"}],  
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#modelRiskEval").combobox({
			data:[{"text":"正常客户"},{"text":"中等风险客户"},{"text":"高等风险客户"}],  
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#modelVisaSurety").combobox({
			data:[{"text":"父母"},{"text":"本人"},{"text":"祖父母"},{"text":"姑叔舅姨"},{"text":"无"}],  
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#o_isGetOffer, #o_isAcceptOffer, #isSigned").combobox({
			data:[{"text":"是"},{"text":"否"}],
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#o_isNeedLang").combobox({
			data:[{"text":"需要"},{"text":"不需要"}],
			valueField: 'text',    
        	textField: 'text'
		});
		
		//advisor   
		var advisors = ",${advEmps}".split(",");
		var modelAdvisor = $("#modelAdvisor");
		for(var type=0;type<advisors.length;type++){
			modelAdvisor.append("<option value='"+advisors[type]+"'>"+advisors[type]+"</option>");
		}
		modelAdvisor.val('${model.advisor}');
		$(modelAdvisor).combobox();
		
		//copyWriter
		var copyWriters = ",${docEmps}".split(",");
		var modelCopyWriter = $("#modelCopyWriter");
		for(var type=0;type<copyWriters.length;type++){
			modelCopyWriter.append("<option value='"+copyWriters[type]+"'>"+copyWriters[type]+"</option>");
		}
		modelCopyWriter.val('${model.copyWriter}');
		$(modelCopyWriter).combobox();
		
		<c:if test="${isAll == 1}">
		$("#modelToCountry").combobox({
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
  <div class="x-panel-header">${model.toCountry }现操作客户管理</div>
    <div class="x-toolbar">
      <s:form action="listDealingInfo" theme="simple">
	      <table width="100%">
	      	<tr>
	          	<td>
	            	姓　　名:<input name="model.name" style="width: 85px">
	            	客户类型:<input type="text" id="modelClientType" name="model.clientType" style="width: 85px" value="${model.clientType }">
	            	客户类别:<input type="text" id="modelClientClass" name="model.clientClass" style="width: 85px" value="${model.clientClass }">
					申请类型:<input type="text" id="modelApplyType" name="model.applyType" style="width: 85px" value="${model.applyType }">
					被访问者关系类型:<input type="text" id="modelInterviewType" name="model.interviewType" style="width: 85px" value="${model.interviewType }">
					合作方:<input type="text" id="modelPartner" name="model.partner" style="width: 85px" value="${model.partner }">
					顾问:<select name="model.advisor"  id="modelAdvisor" style="width: 65px"></select>
					文案:<select name="model.copyWriter" id="modelCopyWriter" style="width: 67px"></select>
					<c:if test="${isAll == 1}">
				         所去国家：<input id="modelToCountry" name="model.toCountry" style="width: 100px;margin: 0" value="${model.toCountry }"/>
			        </c:if> 
			        <c:if test="${isAll != 1}">
				        <input id="modelToCountry" name="model.toCountry" type="hidden" value="${model.toCountry }"/>
			        </c:if>
					<s:submit value="查询" cssClass="button"></s:submit>
					<input type="hidden" name="isAll" value="${isAll }" />
	          	</td>
	       	</tr>
	       	<tr>
	       		<td>
		        	出国前毕业/在读院校及学生阶段(中):<input name="model.beforeSchool"  size="30">
	       			出国前专业名称(中):<input name="model.beforeMajor"  size="30">
	       			语言入读时间:<input type="text" name="beginDate" size="12" id="model.beginDate" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
								value='<s:date name="beginDate" format="yyyy-MM-dd"/>'/> 至 
								<input type="text" name="endDate" size="12" id="model.endDate" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
								value='<s:date name="endDate" format="yyyy-MM-dd"/>'/>  
					正课入读时间:<input type="text" name="beginDate1" size="12" id="model.beginDate" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
								value='<s:date name="beginDate1" format="yyyy-MM-dd"/>'/> 至 
								<input type="text" name="endDate1" size="12" id="model.endDate" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
								value='<s:date name="endDate1" format="yyyy-MM-dd"/>'/>
	       		</td>
	       	</tr>
	       	<tr>
	       		<td>
	       			风险评估:<input type="text" id="modelRiskEval" name="model.riskEval" style="width: 100px" value="${model.riskEval}">
	       			签证担保人:<input type="text" style="width: 90px" name="model.visaSurety" id="modelVisaSurety" value="${model.visaSurety }">
	       			是否拿到offer:<input type="text" name="o_isGetOffer" id="o_isGetOffer" value="${o_isGetOffer }" style="width: 60px">
	       			是否需要配语言:<input type="text" name="o_isNeedLang" id="o_isNeedLang" value="${o_isNeedLang }" style="width: 60px">
	       			offer接受截止时间:<input type="text" name="o_offerEndTime" size="12" class="Wdate" 
	       						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" value='${o_offerEndTime }'/>
	       			是否已接受offer:<input type="text" name="o_isAcceptOffer" id="o_isAcceptOffer" value="${o_isAcceptOffer }" style="width: 60px">
	       			签证递交时间:<input type="text" name="model.signSendTime" size="12" class="Wdate" 
	       						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" value='${model.signSendTime }'/>
	       			是否获签:<input type="text" name="model.isSigned" id="isSigned" value="${model.isSigned }" style="width: 60px">
	       		</td>
	       	</tr>
	       	<tr>
	       		<td>
	       			申请学校(中/英文):<input name="o_applySchool" value="${o_applySchool }" style="width: 100px">
	       			申请专业(中/英文):<input name="o_applySpecial" value="${o_applySpecial }" style="width: 100px">
	       			签证学校(中):<input name="model.visaSchool" style="width: 100px">
	       			入读学校(中):<input name="model.readSchoolZH" style="width: 100px">
	       			入读学校(英):<input name="model.readSchoolEN" style="width: 100px">
	       			入读专业(中):<input name="model.majorZH" style="width: 100px">
	       			入读专业(英):<input name="model.majorEN" style="width: 100px">
	       		</td>
	       	</tr>
	     </table>
      </s:form>
	</div>   
	<stc:role ifAnyGranted="ROLE_ADMIN">
		<c:set var="xlsFileName" value="现操作客户信息列表.xls"></c:set>
	</stc:role>
	<c:if test="${userInSession.employees.isDeptAdmin == '1'}">
		<c:set var="xlsFileName" value="现操作客户信息列表.xls"></c:set>
	</c:if>
	<div class="x-panel-body">
		<div style="margin-left:-3px;" align="center">
			<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit" 
				filterRowsCallback="limit"
				action="listDealingInfo.do"
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
					<c:if test="${definedField == null || definedField == ''}">
					<ec:column width="40" property="_2" title="序号" value="${GLOBALROWCOUNT}" style="text-align:center" sortable="false"/>
						<ec:column width="60" property="name" title="姓名" style="text-align:center"/>
						<ec:column width="80" property="toCountry" title="所去国家" style="text-align:center"/>
						<ec:column width="50" property="clientType" title="客户类型" style="text-align:center"/>
						<ec:column width="50" property="clientClass" title="客户类型" style="text-align:center"/>
						<ec:column width="60" property="applyType" title="申请类型" style="text-align:center"/>
						<ec:column width="150" property="interviewType" title="被访问者关系类型" style="text-align:center"/>
						<ec:column width="90" property="readTime" title="语言入读时间" style="text-align:center" value="${fn:contains(item.readTime,'9999-12-31')?'无':fn:split(item.readTime,' ')[0] }"/>
						<ec:column width="90" property="zhengReadTime" title="正课入读时间" style="text-align:center" value="${fn:contains(item.zhengReadTime,'9999-12-31')?'无':fn:split(item.zhengReadTime,' ')[0] }"/>
						<ec:column width="100" property="readSchoolZH" title="入读学校（中文）" style="text-align:center" />
						<ec:column width="100" property="readSchoolEN" title="入读学校（英文）" style="text-align:center"/>
						<ec:column width="100" property="majorZH" title="入读专业（中文）" style="text-align:center"/>
						<ec:column width="100" property="majorEN" title="入读专业（英文）" style="text-align:center"/>
						<ec:column width="70" property="applyTime" title="申请时间" style="text-align:center" value="${fn:contains(item.applyTime,'9999-12-31')?'无':fn:split(item.applyTime,' ')[0] }"/>
						<ec:column width="70" property="enrollTime" title="录取时间" style="text-align:center" value="${fn:contains(item.enrollTime,'9999-12-31')?'无':fn:split(item.enrollTime,' ')[0] }"/>
						<ec:column width="60" property="partner" title="合作方" style="text-align:center"/>
						<ec:column width="250" property="beforeSchool" title="出国前毕业/在读院校及学生阶段(中文)" style="text-align:center" ellipsis="true" />
						<ec:column width="120" property="beforeMajor" title="出国前专业名称(中文)" style="text-align:center" />
						<ec:column width="60" property="GPA" title="GPA" style="text-align:center"/>
						<ec:column width="70" property="TOEFLORIELTS" title="TOEFL/IELTS" style="text-align:center"/>
						<ec:column width="70" property="GREORGMAT" title="GRE/GMAT" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						<ec:column width="70" property="SATORACT" title="SAT/ACT" style="text-align:center"/>
						<ec:column width="70" property="SLEP" title="SLEP" style="text-align:center"/>
						<ec:column width="130" property="interruptDate" title="断档期" style="text-align:center"/>
						<ec:column width="130" property="praticeExperience" title="相关实习经历" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						<ec:column width="130" property="workExperience" title="工作经历" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						<ec:column width="130" property="nationalAwards" title="国家级奖励" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						<ec:column width="130" property="patentOrThesis" title="发明专利或论文" style="text-align:center"/>
						<ec:column width="150" property="advantage" title="其他申请优势/要点(简述)" style="text-align:center" ellipsis="true"/>
						<ec:column width="130" property="_0" title="其他录取院校" style="text-align:center" value="其他录取院校"/>
						<ec:column width="130" property="visaSchool" title="签证学校（中文）" style="text-align:center" cell="date" format="yyyy-MM-dd"/>
						<ec:column width="85" property="visaSurety" title="签证担保人" style="text-align:center"/>
						<ec:column width="85" property="suretyMoney" title="担保金总额" style="text-align:center"/>
						<ec:column width="110" property="moneySituation" title="资金情况简述" style="text-align:center" ellipsis="true" />
						<ec:column width="80" property="advisor" title="顾问" style="text-align:center"/>
						<ec:column width="60" property="copyWriter" title="文案" style="text-align:center"/>
						<ec:column width="60" property="remark" title="备注" ellipsis="true" style="text-align:center"/>
						<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN,ROLE_DOC,ROLE_END">
							<ec:column width="60" property="_1" title="操作" style="text-align:center" viewsAllowed="html">
							   <a href="editDealingInfo.do?model.id=${item.id}">
							      <img src="${ctx}/images/icons/modify.gif" style="border:0px" title="编辑"/>
							   </a>
							   <a href="#" onclick="removeDealingInfo(${item.id})">
							      <img src="${ctx}/images/icons/delete.gif" style="border:0px" title="删除"/>
							   </a>
							</ec:column>
						</stc:role>
					</c:if>
				</ec:row>
			</ec:table>
		</div>
	</div>
  </div>
  <iframe width="100%" name="stuDetails" id="stuDetails" frameborder="0" scrolling="auto">
  </iframe>
</body>
</html>