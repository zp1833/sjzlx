<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑学员信息</title>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/TabPanel/tabpanel.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/TabPanel/css/style.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css"> 
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<style type="text/css">
	td {
		font-family: Times New Roman;
	}
	
	#enrollSchools td {
		height: 40px;
	}
</style>
<script type="text/javascript">

	$(function(){
	
		<c:if test="${model.id != null}">
			try {
				var schools = JSON.parse('${model.otherEnrollSchool}');
				for(var i=0; i<schools.length; i++) {
					var school = schools[i];
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_readTime']").val(school.o_readTime);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_zhengReadTime']").val(school.o_zhengReadTime);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_applySchool']").val(school.o_applySchool);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_applySpecial']").val(school.o_applySpecial);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_applyType']").val(school.o_applyType);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_partner']").val(school.o_partner);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_applySendTime']").val(school.o_applySendTime);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_receiveTime']").val(school.o_receiveTime);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_isGetOffer']").val(school.o_isGetOffer);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_isNeedLang']").val(school.o_isNeedLang);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_offerCondition']").val(school.o_offerCondition);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_offerEndTime']").val(school.o_offerEndTime);
					$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_isAcceptOffer']").val(school.o_isAcceptOffer);
					//$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_visaSendTime']").val(school.o_visaSendTime);
					//$("#enrollSchools tr:eq("+(i+1)+")").find("[name='o_isBeSigned']").val(school.o_isBeSigned);
				}
			} catch(e) {
			} 
		</c:if>
	
		$("#modelClientType").combobox({
			data:[{"text":"全程留学"},{"text":"学校申请"},{"text":"学生签证"},{"text":"学生访问签证"},{"text":"探亲签证"},{"text":"旅游签证"},{"text":"商务签证"},{"text":"续签签证"},{"text":"团签"},{"text":"J1"},{"text":"假期工作签证"},{"text":"陪读签证"},{"text":"单文书"}],  
			valueField: 'text',    
        	textField: 'text',
        	onChange: function(newValue, oldValue) {
        		onChangeClientType(newValue, oldValue);
        	}
		});
		
		$("#modelClientClass").combobox({
			data:[{"text":"已/确定退费"},{"text":"退费转国家"},{"text":"暂停"},{"text":"成功结案"},{"text":"活跃"}],  
			valueField: 'text',    
        	textField: 'text'
		});

		$("#modelApplyType, [name='o_applyType']").combobox({
			data:[{"text":"小学"},{"text":"初中"},{"text":"高中"},{"text":"高中预科"},{"text":"学院双录"},{"text":"学院直录"},{"text":"本科双录"},{"text":"本科直录"},{"text":"本科转学分"},{"text":"本科预科"},{"text":"研究生文凭"},{"text":"硕士预科"},{"text":"硕士双录"},{"text":"硕士直录"},{"text":"博士"},{"text":"无"}],  
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#modelInterviewType").combobox({
			data:[{"text":"父母"},{"text":"父子"},{"text":"父女"},{"text":"母子"},{"text":"母女"},{"text":"夫妻"},{"text":"兄弟姐妹"},{"text":"朋友"},{"text":"男女朋友"},{"text":"姑叔舅姨"},{"text":"婆媳"},{"text":"公媳"},{"text":"祖孙"},{"text":"无"}],  
			valueField: 'text',    
        	textField: 'text'
		});
	
		$("#modelPartner, [name='o_partner']").combobox({
			data:[{"text":"澳新国际"},{"text":"加诚博教"},{"text":"枫叶海外"},{"text":"温哥华公立教育联盟"},{"text":"广州亚太"},{"text":"AA"},{"text":"华通"},{"text":"琥珀"},{"text":"INDEX"},{"text":"KPL"},{"text":"INTO"},{"text":"GEC"},{"text":"EF"},{"text":"UF"},{"text":"SG"},{"text":"IBG"},{"text":"CIIE"},{"text":"GSS"},{"text":"UCSE"},{"text":"GDX"},{"text":"RIA"},{"text":"IVY"},{"text":"凯尔教育"},{"text":"PIESG"},{"text":"直代"},{"text":"无"}],  
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#modelReadSchoolEN, #modelReadSchoolZH, #modelMajorZH, #modelMajorEN").combobox({
			data:[{"text":"无"}],  
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#modelBeforeSchool, #modelBeforeMajor, #modelGPA, #modelTOEFLORIELTS, #modelGREORGMAT, #modelSATORACT, #modelSLEP, #modelVisaSchool, [name='o_applySchool'], [name='o_applySpecial']").combobox({
			data:[{"text":"无"},{"text":"未留记录"}],  
			valueField: 'text',    
        	textField: 'text'
		});

		$("#modelInterruptDate, #modelPraticeExperience, #modelWorkExperience, #modelNationalAwards, #modelPatentOrThesis").combobox({
			data:[{"text":"有"},{"text":"无"},{"text":"未留记录"}],
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("[name='o_isGetOffer'], [name='o_isAcceptOffer'], [name='o_isBeSigned'], #modelIsSigned").combobox({
			data:[{"text":"是"},{"text":"否"}],
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("[name='o_isNeedLang']").combobox({
			data:[{"text":"需要"},{"text":"不需要"}],
			valueField: 'text',    
        	textField: 'text'
		});
		
		$("#modelVisaSurety").combobox({
			data:[{"text":"父母"},{"text":"本人"},{"text":"祖父母"},{"text":"姑叔舅姨"},{"text":"无"}],  
			valueField: 'text',    
        	textField: 'text'
		});
		//toCountry
		<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN">
			var toCountry = ["美国","加拿大","澳大利亚","新西兰","香港","英国","日本","韩国","法国","新加坡","爱尔兰","马来西亚","俄罗斯","荷兰","西班牙","德国","挪威","瑞典","丹麦","芬兰","瑞士","匈牙利"];
		</stc:role>
		<stc:role ifNotGranted="ROLE_ADMIN,ROLE_ORADMIN" >
		 	var toCountry = "${userInSession.employees.countries}".split(", ");
		</stc:role>
		var modelToCountry = $("#modelToCountry");
		for(var type=0;type<toCountry.length;type++){
			modelToCountry.append("<option value='"+toCountry[type]+"'>"+toCountry[type]+"</option>");
		}
		modelToCountry.val('${model.toCountry}');
		$(modelToCountry).combobox();
		
		//advisor   
		var advisors = ",${advEmps}".split(",");
		var modelAdvisor = $("#modelAdvisor");
		for(var type=0;type<advisors.length;type++){
			modelAdvisor.append("<option value='"+advisors[type]+"'>"+advisors[type]+"</option>");
		}
		$(modelAdvisor).combobox();
		$(modelAdvisor).combobox('setValue','${model.advisor}');
		
		//copyWriter
		var copyWriters = ",${docEmps}".split(",");
		var modelCopyWriter = $("#modelCopyWriter");
		for(var type=0;type<copyWriters.length;type++){
			modelCopyWriter.append("<option value='"+copyWriters[type]+"'>"+copyWriters[type]+"</option>");
		}
		$(modelCopyWriter).combobox();
		$(modelCopyWriter).combobox('setValue','${model.copyWriter}');
		
		$(".na").click(function() {
			if($(this).attr("checked"))
				$(this).siblings(".naDate").css("display","none");
			else
				$(this).siblings(".naDate").css("display","");
		});
		
		$(".naDate").each(function() {
			if($(this).val() == '9999-12-31' || $(this).val() == '无') {
				$(this).siblings(".na").click();
				$(this).css("display","none");
				$(this).val("");
			}
		});
		
		$("form").submit(function() {
			$(".na").each(function() {
				if($(this).attr("checked")) {
					$(this).siblings("input").val("9999-12-31");
					$(this).siblings(".noneDate").val("无");
				}
			});
			serilizeOtherEnrollSchools();
		});
	});
	
	function clearClientTypeAction() {
		$("#modelVisaSchool").combobox('setValue',"${model.visaSchool}");
		$("#modelVisaSurety").combobox('setValue',"${model.visaSurety}");
		$("#modelSuretyMoney").val("${model.suretyMoney}");
		$("#modelApplyType").combobox('setValue',"${model.applyType}");
		$("#modelInterviewType").combobox('setValue',"${model.interviewType}");
		$("#modelPartner").combobox('setValue',"${model.partner}");
		$("#modelAdvantage").val("${model.advantage}");
		$("#enrollSchools input").val("");
		$("#isReadTime").removeAttr("checked");
		$("#isReadTime").change();
		$("#isZhengReadTime").removeAttr("checked");
		$("#isZhengReadTime").change();
		$("#modelReadSchoolEN").combobox('setValue',"${model.readSchoolEN}");
		$("#modelMajorEN").combobox('setValue',"${model.majorEN}");
		$("#modelReadSchoolZH").combobox('setValue',"${model.readSchoolZH}");
		$("#modelMajorZH").combobox('setValue',"${model.majorZH}");
		$("#modelBeforeMajor").combobox("setValue","${model.beforeMajor}");
		$("#modelBeforeSchool").combobox("setValue","${model.beforeSchool}");
		$("#modelTOEFLORIELTS").combobox("setValue","${model.TOEFLORIELTS}");
		$("#modelSLEP").combobox("setValue","${model.SLEP}");
		$("#modelSATORACT").combobox("setValue","${model.SATORACT}");
		$("#modelGREORGMAT").combobox("setValue","${model.GREORGMAT}");
		$("#modelGPA").combobox("setValue","${model.GPA}");
		$("#modelWorkExperience").combobox("setValue","${model.workExperience}");
		$("#modelPraticeExperience").combobox("setValue","${model.praticeExperience}");
		$("#modelPatentOrThesis").combobox("setValue","${model.patentOrThesis}");
		$("#modelNationalAwards").combobox("setValue","${model.nationalAwards}");
		$("#modelInterruptDate").combobox("setValue","${model.interruptDate}");
		$("#modelMoneySituation").val($("#tmpMoneySituation").val());
		$("#modelReadTime, #modelZhengReadTime").show();
	}
	
	function onChangeClientType(newValue, oldValue){
		clearClientTypeAction();
		if(newValue=="全程留学"){
			$("#modelInterviewType").combobox('setValue',"无");
		} else if(newValue=="学校申请"){
			$("#modelInterviewType, #modelVisaSchool, #modelVisaSurety, #modelIsSigned").combobox('setValue',"无");
			$("#modelSuretyMoney, #modelMoneySituation").val("无");
		} else if(newValue=="学生签证" || newValue=="J1" || newValue=="陪读签证" || newValue=="学生访问签证"){
			$("#modelInterviewType, #modelPartner").combobox('setValue',"无");
			//$("#modelInterviewType, #modelPartner, #modelBeforeSchool, #modelBeforeMajor, #modelGPA, #modelTOEFLORIELTS, #modelGREORGMAT, #modelSATORACT").combobox('setValue',"无");
			//$("#modelSLEP, #modelInterruptDate, #modelPraticeExperience, #modelWorkExperience, #modelNationalAwards, #modelPatentOrThesis").combobox("setValue","无");
			$("#enrollSchools input").val("无");
		} else if(newValue=="探亲签证" || newValue=="商务签证" || newValue=="旅游签证"){
			$("#modelApplyType, #modelReadSchoolEN, #modelMajorEN, #modelReadSchoolZH, #modelMajorZH, #modelVisaSchool").combobox('setValue',"无");
			$("#modelInterviewType, #modelPartner, #modelBeforeSchool, #modelBeforeMajor, #modelGPA, #modelTOEFLORIELTS, #modelGREORGMAT, #modelSATORACT").combobox('setValue',"无");
			$("#modelSLEP, #modelInterruptDate, #modelPraticeExperience, #modelWorkExperience, #modelNationalAwards, #modelPatentOrThesis").combobox("setValue","无");
			$("#modelAdvantage, #enrollSchools input").val("无");
			$("#isReadTime, #isZhengReadTime").attr("checked","true");
			$("#modelReadTime, #modelZhengReadTime").hide();
		}
	}
	
	function serilizeOtherEnrollSchools(){
		var otherSchools = new Array();
		$("#enrollSchools tr:gt(0)").each(function() {
			var otherSchool = new Object();
			otherSchool.o_readTime = $(this).find("[name='o_readTime']").val();
			otherSchool.o_zhengReadTime = $(this).find("[name='o_zhengReadTime']").val();
			otherSchool.o_applySchool = $(this).find("[name='o_applySchool']").val();
			otherSchool.o_applySpecial = $(this).find("[name='o_applySpecial']").val();
			otherSchool.o_applyType = $(this).find("[name='o_applyType']").val();
			otherSchool.o_partner = $(this).find("[name='o_partner']").val();
			otherSchool.o_applySendTime = $(this).find("[name='o_applySendTime']").val();
			otherSchool.o_receiveTime = $(this).find("[name='o_receiveTime']").val();
			otherSchool.o_isGetOffer = $(this).find("[name='o_isGetOffer']").val();
			otherSchool.o_isNeedLang = $(this).find("[name='o_isNeedLang']").val();
			otherSchool.o_offerCondition = $(this).find("[name='o_offerCondition']").val();
			otherSchool.o_offerEndTime = $(this).find("[name='o_offerEndTime']").val();
			otherSchool.o_isAcceptOffer = $(this).find("[name='o_isAcceptOffer']").val();
			//otherSchool.o_visaSendTime = $(this).find("[name='o_visaSendTime']").val();
			//otherSchool.o_isBeSigned = $(this).find("[name='o_isBeSigned']").val();
			otherSchools.push(otherSchool);
		});
		
		$("#modelOtherEnrollSchool").val(JSON.stringify(otherSchools));
	}
	
	//conmunicate
	
	function getMoreInfo(name){
		$.ajax({
			type: 'POST',
			url: 'getMoreInfoFromBrokerage.do',
			data: {'matchName':name},
			success: function(data){
				if(data.msg == "success"){
					//合作方 申请类型 所去国家 转入时间 转入学校 中英 转入专业 中英 顾问 文案
					$("#modelPartner").combobox("setValue",data.stuInfos.partner);
					$("#modelApplyType").combobox("setValue",data.stuInfos.applyType);
					$("#toCountry").combobox("setValue",data.stuInfos.country);
					
					var time = data.stuInfos.joinDate;
					if(time!=null && time != "" ){
						$("#modelReadTime").val(time.substring(0,time.indexOf("T")));
					}
					
					$("#modelReadSchoolEN").combobox("setValue",data.stuInfos.schoolEnName);
					$("#modelMajorEN").combobox("setValue",data.stuInfos.specialityEnName);
					$("#modelReadSchoolZH").combobox("setValue",data.stuInfos.school);
					$("#modelMajorZH").combobox("setValue",data.stuInfos.speciality);
					   
					$("#modelAdvisor").combobox("setValue",data.stuInfos.advisor=='0'?data.stuInfos.otherAdvisor:data.stuInfos.advisor);
					$("#modelCopyWriter").combobox("setValue",data.stuInfos.docEmp=='0'?data.stuInfos.otherDocEmp:data.stuInfos.docEmp);
				}else{
					alert("佣金管理中无此人信息！");
				}
			},
			dataType:'json'
		});
	}
	
	function checkForm() {
		var copyWriter = $("#modelCopyWriter").combobox("getValue");
		if(copyWriter == null || copyWriter.length <= 0) {
			alert("请选择文案");
			return false;
		}
		return true;
	}

</script>
</head>
<body>
<s:form namespace="/admin/successfulCase" action="saveSuccessfulCase" theme="simple" method="POST" onsubmit="return checkForm();">
	<div class="x-panel">
	    <div class="x-panel-header">添加学员成功案例信息</div>
		<table width="100%" border="0" align="center">
		  <tr><td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="TabBarLevel" id="TabPage">
		      <tr align="center">
				<td width="80" id="SystopTab1" valign="middle" class="SelectedTab" onclick=switchTab(this,2)>
					基本信息
				</td>
		        <td width="7" class="Black">&nbsp;</td>
		        <td width="80" id="SystopTab2"  valign="middle" class="mousehand" onclick=switchTab(this,2)>
		        	其他申请学校
				</td>
		        <td width="7" class="Black">&nbsp;</td>
		        <td width="" align="right" class="Black">&nbsp;&nbsp;</td>
		      </tr>
		    </table>
	    
		    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="Content">
		        <tr>
		          <td height="110">
					<div id='SystopTabDiv1'>
						<%@include file="caseDetail.jsp" %>
					</div>
					<div id='SystopTabDiv2' style="display:none">
						<%@include file="otherEnrollSchool.jsp" %>
					</div>
				  </td>
		        </tr>
		    </table>		
		  </td></tr>
		</table>
		<table width="100%" >
            <tr>
                <td style="text-align:center;">
                	<s:hidden name="model.id" id="model.id"/>
                	<input type="hidden" name="isAll" value="${isAll }" />
                	<s:hidden name="model.dealingId" id="model.dealingId"/>
                    <s:submit value="保存" cssClass="button"></s:submit>&nbsp;&nbsp;
                    <s:reset value="重置" cssClass="button"></s:reset>
                </td>
            </tr>
        </table>
	</div>
</s:form>
</body>
</html>