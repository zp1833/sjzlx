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
		if(value && value != "") {
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
		  <tr>
		  	<td>
		  		<fieldset style="margin:10px;">
					<legend>接待信息</legend>
					<table>
						<tr>
							<td align="right" width="100">咨询日期</td>
							<td align="left" width="20">
								<input type="checkbox" value="advDate_s" id="advDate_s">
							</td>
							<td align="right" width="100">客户姓名</td>
							<td align="left" width="20">
								<input type="checkbox" value="stuName_s" id="stuName_s">
							</td>
							<td align="right" width="100">负责顾问</td>
							<td align="left" width="20">
								<input type="checkbox" value="advisor_s" id="advisor_s">
							</td>
							<td align="right" width="100">咨询国家</td>
							<td align="left" width="20">
								<input type="checkbox" value="advCountry_s" id="advCountry_s">
							</td>
						</tr>
						<tr>
							<td align="right">信息来源</td>
							<td align="left" width="20">
								<input type="checkbox" value="source_s" id="source_s">
							</td>
							<td align="right">来源明细</td>
							<td align="left" width="20">
								<input type="checkbox" value="sourceFrom_s" id="sourceFrom_s">
							</td>
							<td align="right">咨询形式</td>
							<td align="left" width="20">
								<input type="checkbox" value="advType_s" id="advType_s">
							</td>
							<td align="right">接待员工</td>
							<td align="left" width="20">
								<input type="checkbox" value="recEmp_s" id="recEmp_s">
							</td>
						</tr>
					</table>
				</fieldset>
				<fieldset style="margin:10px;">
					<legend>客户信息</legend>
					<table>
						<tr>
							<td align="right" width="100">当前进度</td>
							<td align="left" width="20">
								<input type="checkbox" value="currentPlan_s" id="currentPlan_s">
							</td>
							<td align="right" width="100">下次回访日期</td>
							<td align="left" width="20">
								<input type="checkbox" value="nextVisitTime_s" id="nextVisitTime_s">
							</td>
							<td align="right" width="100">状态定义日期</td>
							<td align="left" width="20">
								<input type="checkbox" value="statusDefineTime_s" id="statusDefineTime_s">
							</td>
							<td align="right" width="100">所学专业</td>
							<td align="left" width="20">
								<input type="checkbox" value="speciality_s" id="speciality_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="100">毕业院校</td>
							<td align="left" width="20">
								<input type="checkbox" value="finishSchool_s" id="finishSchool_s">
							</td>
							<td align="right" width="100">客户分类</td>
							<td align="left" width="20">
								<input type="checkbox" value="stuType_s" id="stuType_s">
							</td>
							<td align="right" width="100">最高学历</td>
							<td align="left" width="20">
								<input type="checkbox" value="education_s" id="education_s">
							</td>
							<td align="right" width="100">工作经验</td>
							<td align="left" width="20">
								<input type="checkbox" value="jobExp_s" id="jobExp_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="100">经商经验</td>
							<td align="left" width="20">
								<input type="checkbox" value="busiExp_s" id="busiExp_s">
							</td>
							<td align="right" width="100">海外购房</td>
							<td align="left" width="20">
								<input type="checkbox" value="buyHouse_s" id="buyHouse_s">
							</td>
							<td align="right" width="100">海外投资</td>
							<td align="left" width="20">
								<input type="checkbox" value="abroadInvest_s" id="abroadInvest_s">
							</td>
							<td align="right" width="100">短期考察</td>
							<td align="left" width="20">
								<input type="checkbox" value="inspect_s" id="inspect_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="100">资金状况</td>
							<td align="left" width="20">
								<input type="checkbox" value="finances_s" id="finances_s">
							</td>
							<td align="right" width="100">联系方式</td>
							<td align="left" width="20">
								<input type="checkbox" value="contact_s" id="contact_s">
							</td>
							<td align="right" width="100">外语程度</td>
							<td align="left" width="20">
								<input type="checkbox" value="enDegree_s" id="enDegree_s">
							</td>
							<td align="right" width="100">年龄</td>
							<td align="left" width="20">
								<input type="checkbox" value="age_s" id="age_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="100">移民类型</td>
							<td align="left" width="20">
								<input type="checkbox" value="ymType_s" id="ymType_s">
							</td>
							<td align="right" width="100">有无拒签史</td>
							<td align="left" width="20">
								<input type="checkbox" value="isHasRefuser_s" id="isHasRefuser_s">
							</td>
							<td align="right" width="100">婚否</td>
							<td align="left" width="20">
								<input type="checkbox" value="isMerried_s" id="isMerried_s">
							</td>
							<td align="right" width="100">签约情况</td>
							<td align="left" width="20">
								<input type="checkbox" value="signStatus_s" id="signStatus_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="100">介绍给语言</td>
							<td align="left" width="20">
								<input type="checkbox" value="introToIELTS_s" id="introToIELTS_s">
							</td>
							<td align="right" width="100">性别</td>
							<td align="left" width="20">
								<input type="checkbox" value="sex_s" id="sex_s">
							</td>
							<td align="right" width="100">信息备注</td>
							<td align="left" colspan="3">
								<input type="checkbox" value="infoDesc_s" id="infoDesc_s">
							</td>
						</tr>
					</table>
				</fieldset>
		    	<fieldset style="margin:10px;">
					<legend>签约明细</legend>
					<table>
						<tr>
							<td align="right" width="100">签约日期</td>
							<td align="left" width="20">
								<input type="checkbox" value="signTime_s" id="signTime_s">
							</td>
							<td align="right" width="100">签约人</td>
							<td align="left" width="20">
								<input type="checkbox" value="signName_s" id="signName_s">
							</td>
							<td align="right" width="100">服务费</td>
							<td align="left" width="20">
								<input type="checkbox" value="serviceCharge_s" id="serviceCharge_s">
							</td>
							<td align="right" width="100">后期款</td>
							<td align="left" width="20">
								<input type="checkbox" value="endPayment_s" id="endPayment_s">
							</td>
						</tr>
						<tr>
							<td align="right">首期款</td>
							<td align="left" width="20">
								<input type="checkbox" value="downPayment_s" id="downPayment_s">
							</td>
							<td align="right">相关服务费用明细</td>
							<td align="left" width="20">
								<input type="checkbox" value="serviceChargeDetails_s" id="serviceChargeDetails_s">
							</td>
							<td align="right">签约备注</td>
							<td align="left" colspan="3">
								<input type="checkbox" value="signDesc_s" id="signDesc_s">
							</td>
						</tr>
					</table>
				</fieldset>	
				<fieldset style="margin:10px;">
					<legend>移民申请</legend>
					<table>
						<tr>
							<td align="right" width="100">移民项目类别名称</td>
							<td align="left" width="20">
								<input type="checkbox" value="ymTypeName_s" id="ymTypeName_s">
							</td>
							<td align="right" width="100">递交时间</td>
							<td align="left" width="20">
								<input type="checkbox" value="sendTime_s" id="sendTime_s">
							</td>
							<td align="right" width="100">档案号码</td>
							<td align="left" width="20">
								<input type="checkbox" value="docId_s" id="docId_s">
							</td>
							<td align="right" width="100">面试时间</td>
							<td align="left" width="20">
								<input type="checkbox" value="meetTime_s" id="meetTime_s">
							</td>
						</tr>
					</table>
				</fieldset>
				<fieldset style="margin:10px;">
					<legend>后期服务</legend>
					<table>
						<tr>
							<td align="right" width="100">预计离境时间</td>
							<td align="left" width="20">
								<input type="checkbox" value="leaveTime_s" id="leaveTime_s">
							</td>
							<td align="right" width="100">接机安排</td>
							<td align="left" width="20">
								<input type="checkbox" value="pickUpPlan_s" id="pickUpPlan_s">
							</td>
							<td align="right" width="100">住宿协助安排</td>
							<td align="left" width="20">
								<input type="checkbox" value="livePlan_s" id="livePlan_s">
							</td>
							<td align="right" width="100">>其他需求</td>
							<td align="left" width="20">
								<input type="checkbox" value="otherRequest_s" id="otherRequest_s">
							</td>
						</tr>
					</table>
				</fieldset>
		  	</td>
		  </tr>
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