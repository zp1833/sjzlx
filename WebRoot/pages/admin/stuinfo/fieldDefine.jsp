<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑学员信息</title>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<script type="text/javascript">
	function selectFiled() {
		var checks = document.getElementsByTagName("input");
		var value = "";
		for(var i=0; i<checks.length; i++) {
			if(checks[i].type == "checkbox" && checks[i].checked) {
				value += checks[i].value+",";
			}
		}
		window.returnValue = value;
		alert("选择成功！");
		window.close();
	}
	
	function init() {
		var value = window.dialogArguments;
		if(value != "") {
			var params = value.split(",");
			for(var i=0; i<params.length-1; i++) {
				document.getElementById(params[i]).checked = "checked";
			}
		}
	}
	
</script>
</head>
<body onload="init();" onunload="selectFiled();">
<form action="" method="POST">
	<div class="x-panel">
	    <div class="x-panel-header">自定义显示列</div>
		<table width="100%" border="0" align="center">
		  <tr><td>
		    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="Content">
		        <tr>
		          <td height="110">
					<div>
						<table align="left" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
							<tr>
							  	<td align="right" bgcolor="#EBEBEB" width="120">学生姓名</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="stuName_s" id="stuName_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">档案号</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="docId_s" id="docId_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">咨询日期</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="advDate_s" id="advDate_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">咨询国家</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="advCountry_s" id="advCountry_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">信息来源</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="source_s" id="source_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">来源明细</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="sourceFrom_s" id="sourceFrom_s">
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="120">咨询形式</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="advType_s" id="advType_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">接待员工</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="recEmp_s" id="recEmp_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">负责顾问</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="advisor_s" id="advisor_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">当前进度</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="currentPlan_s" id="currentPlan_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">学生类型</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="stuType_s" id="stuType_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">下次回访时间</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="nextVisitTime_s" id="nextVisitTime_s">
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="120">状态定义日期</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="statusDefineTime_s" id="statusDefineTime_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">联系方式</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="contact_s" id="contact_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">性别</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="sex_s" id="sex_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">出生日期</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="birthday_s" id="birthday_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">婚否</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="isMerried_s" id="isMerried_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">文化程度</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="education_s" id="education_s">
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="120">所学专业</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="speciality_s" id="speciality_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">毕业院校</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="finishSchool_s" id="finishSchool_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">毕业时间</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="finishTime_s" id="finishTime_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">在读院校</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="currentSchool_s" id="currentSchool_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">在读年级</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="currentGrade_s" id="currentGrade_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">高考分</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="collegeScore_s" id="collegeScore_s">
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="120">有无拒签史</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="isHasRefuser_s" id="isHasRefuser_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">目标学历</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="hopeDegree_s" id="hopeDegree_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">外语程度</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="enDegree_s" id="enDegree_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">资金情况</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="finances_s" id="finances_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">信息备注</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="infoDesc_s" id="infoDesc_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">客户跟踪记录</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="traceDesc_s" id="traceDesc_s">
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="120">最新跟踪时间是</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="recentTraceTime_s" id="recentTraceTime_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">介绍给机构</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="introToIELTS_s" id="introToIELTS_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">签约情况</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="signStatus_s" id="signStatus_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">签约时间</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="signTime_s" id="signTime_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">签约人</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="signName_s" id="signName_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">服务费</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="serviceCharge_s" id="serviceCharge_s">
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="120">首期款</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="downPayment_s" id="downPayment_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">后期款</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="endPayment_s" id="endPayment_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">签约备注</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="signDesc_s" id="signDesc_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">相关服务费用明细</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="serviceChargeDetails_s" id="serviceChargeDetails_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">学校申请方案</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="schoolApplyDoc_s" id="schoolApplyDoc_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">在读证明（中）</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="studyingCertificate_cn_s" id="studyingCertificate_cn_s">
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="120">在读证明（英）</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="studyingCertificate_en_s" id="studyingCertificate_en_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">成绩单（中）</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="reportCard_cn_s" id="reportCard_cn_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">成绩单（英）</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="reportCard_en_s" id="reportCard_en_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">毕业证（中）</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="diploma_cn_s" id="diploma_cn_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">毕业证（英）</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="diploma_en_s" id="diploma_en_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">信纸</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="letterPaper_s" id="letterPaper_s">
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="120">信封</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="envelope_s" id="envelope_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">学校申请照片</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="schoolApplyPhoto_s" id="schoolApplyPhoto_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">个人陈述</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="selfDesc_s" id="selfDesc_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">推荐信</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="recommendation_s" id="recommendation_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">外语成绩</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="foreignAchievement_s" id="foreignAchievement_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">学位证书（中）</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="degreeCard_cn_s" id="degreeCard_cn_s">
							  	</td>
						    </tr>
						    <tr>
						    	<td align="right" bgcolor="#EBEBEB" width="130">学位证书（英）</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="degreeCard_en_s" id="degreeCard_en_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="120">获奖证书</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="encourageCard_s" id="encourageCard_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">存款证明</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="fundProve_s" id="fundProve_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">其他申请学校材料</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="otherApplySchoolDetails_s" id="otherApplySchoolDetails_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">学校名称</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="schoolName_s" id="schoolName_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">申请专业</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="applySpeciality_s" id="applySpeciality_s">
							  	</td>
						    </tr>
						    <tr>
						    	<td align="right" bgcolor="#EBEBEB" width="130">材料寄出时间</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="docSendTime_s" id="docSendTime_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="120">通知书收到时间</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="noticeReceTime_s" id="noticeReceTime_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">入学时间</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="inSchoolTime_s" id="inSchoolTime_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">奖学金状况</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="bursaryStatus_s" id="bursaryStatus_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">学校申请备注</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="schoolApplyDesc_s" id="schoolApplyDesc_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">签证申请文案</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="visaApplyDoc_s" id="visaApplyDoc_s">
							  	</td>
						    </tr>
						    <tr>
						    	<td align="right" bgcolor="#EBEBEB" width="130">护照</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="passport_s" id="passport_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="120">签证申请表</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="visaApplyTable_s" id="visaApplyTable_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">入学通知书</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="schoolNoticeBook_s" id="schoolNoticeBook_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">学习计划</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="studyPlan_s" id="studyPlan_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">工作收入证明</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="incomeProve_s" id="incomeProve_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">户口本</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="houseHoldBook_s" id="houseHoldBook_s">
							  	</td>
						    </tr>
						    <tr>
						    	<td align="right" bgcolor="#EBEBEB" width="130">房本</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="houseBook_s" id="houseBook_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="120">车本</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="carBook_s" id="carBook_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">亲属关系证明</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="relativeProve_s" id="relativeProve_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">无犯罪证明</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="uncrimeProve_s" id="uncrimeProve_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">父母教育背景</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="parentsEduBack_s" id="parentsEduBack_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">申请人工作背景</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="applierBack_s" id="applierBack_s">
							  	</td>
						    </tr>
						    <tr>
						    	<td align="right" bgcolor="#EBEBEB" width="130">存折存单</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="bankbook_s" id="bankbook_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="120">出生公证</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="birthProve_s" id="birthProve_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">签证申请照片</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="visaApplyPhoto_s" id="visaApplyPhoto_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">营业执照</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="busLicense_s" id="busLicense_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">税单</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="taxList_s" id="taxList_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">本人身份证</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="idCard_s" id="idCard_s">
							  	</td>
						    </tr>
						    <tr>
						    	<td align="right" bgcolor="#EBEBEB" width="130">家属身份证</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="relationIdCard_s" id="relationIdCard_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="120">贷款证明</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="loanProve_s" id="loanProve_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">贷款合同</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="loanAgreement_s" id="loanAgreement_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">体检</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="physicalExam_s" id="physicalExam_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">所贷金额存单复印件</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="loanMoneyHardCopy_s" id="loanMoneyHardCopy_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">所贷金额存单存款证明</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="loanMoneyProve_s" id="loanMoneyProve_s">
							  	</td>
						    </tr>
						    <tr>
						    	<td align="right" bgcolor="#EBEBEB" width="130">其他申请签证材料</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="otherApplyProveDoc_s" id="otherApplyProveDoc_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="120">送签时间</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="sqTime_s" id="sqTime_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">签证结果</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="visaResult_s" id="visaResult_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">拒签分析</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="refuserAnalysis_s" id="refuserAnalysis_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">签证申请备注</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="visaApplyDesc_s" id="visaApplyDesc_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">机票预订</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="bookAirTicket_s" id="bookAirTicket_s">
							  	</td>
						    </tr>
						    <tr>
						    	<td align="right" bgcolor="#EBEBEB" width="130">接机安排</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="pickUpPlan_s" id="pickUpPlan_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="120">起飞时间</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="flyTime_s" id="flyTime_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">落地时间</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="fallTime_s" id="fallTime_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="100">是否接到</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="isPickedUp_s" id="isPickedUp_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">住宿安排</td>
								<td bgcolor="#EBEBEB" width="20">
									<input type="checkbox" value="stayPlan_s" id="stayPlan_s">
							  	</td>
							  	<td align="right" bgcolor="#EBEBEB" width="130">反馈结果</td>
								<td bgcolor="#EBEBEB">
									<input type="checkbox" value="feedback_s" id="feedback_s">
							  	</td>
						    </tr>
						    <tr>
						    	<td align="right" bgcolor="#EBEBEB" width="130">反馈时间</td>
								<td bgcolor="#EBEBEB" colspan="11">
									<input type="checkbox" value="feedTime_s" id="feedTime_s">
							  	</td>
						    </tr>
						</table>
						
					</div>
				  </td>
		        </tr>
		    </table>		
		  </td></tr>
		</table>
		<table width="100%" >
            <tr>
                <td style="text-align:center;">
					<input type="button" onclick="window.close();" value="确定" class="button">&nbsp;&nbsp;             	
                    <input type="reset" value="重置" class="button">
                </td>
            </tr>
        </table>
	</div>
</form>
</body>
</html>