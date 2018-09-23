<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择字段</title>
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
<body onload="init();">
<form>
	<div class="x-panel">
	    <div class="x-panel-header">自定义显示列</div>
		<table width="100%" border="0" align="center">
		  <tr>
		  	<td>
		  		<fieldset style="margin:10px;">
					<legend>学生基本信息</legend>
					<table>
						<tr>
							<td align="right">姓名</td>
							<td align="left" width="20">
								<input type="checkbox" value="stuName_s" id="stuName_s">
							</td>
							<td align="right" width="100">出生日期</td>
							<td align="left" width="20">
								<input type="checkbox" value="birthday_s" id="birthday_s">
							</td>
							<td align="right">性　　别</td>
							<td align="left" width="20">
								<input type="checkbox" value="sex_s" id="sex_s">
							</td>
							<td align="right" width="80">学　生ID</td>
							<td align="left" width="20">
								<input type="checkbox" value="stuId_s" id="stuId_s">
							</td>
						</tr>
						<tr>
							<td align="right">所去国家</td>
							<td align="left" width="20">
								<input type="checkbox" value="country_s" id="country_s">
							</td>
							<td align="right">申请类型</td>
							<td align="left" width="20">
								<input type="checkbox" value="applyType_s" id="applyType_s">
							</td>
							<td align="right">入读时间</td>
							<td align="left" width="20">
								<input type="checkbox" value="joinDate_s" id="joinDate_s">
							</td>
							<td align="right">入读学校</td>
							<td align="left" width="20">
								<input type="checkbox" value="school_s" id="school_s">
							</td>
						</tr>
						<tr>
							<td align="right">入读专业</td>
							<td align="left" width="20">
								<input type="checkbox" value="speciality_s" id="speciality_s">
							</td>
							<td align="right">合作方</td>
							<td align="left" width="20">
								<input type="checkbox" value="partner_s" id="partner_s">
							</td>
							<td align="right" width="180">合作方规定返还佣金周期</td>
							<td align="left" colspan="3" width="20">
								<input type="checkbox" value="partnerPeriod_s" id="partnerPeriod_s">
							</td>
						</tr>
					</table>
				</fieldset>
				<fieldset style="margin:10px;">
					<legend>佣金情况</legend>
					<table>
						<tr>
							<td align="right" width="90">语言开课时间</td>
							<td align="left" width="20">
								<input type="checkbox" value="langBeginDate_s" id="langBeginDate_s">
							</td>
							<td align="right" width="120">语言所缴学费</td>
							<td align="left" width="20">
								<input type="checkbox" value="langTuition_s" id="langTuition_s">
							</td>
							<td align="right" width="120">语言佣金比例</td>
							<td align="left" width="20">
								<input type="checkbox" value="langProportion_s" id="langProportion_s">
							</td>
							
						</tr>
						<tr>
							<td align="right">专业课开课时间</td>
							<td align="left">
								<input type="checkbox" value="speBeginDate_s" id="speBeginDate_s">
							</td>
							<td align="right">专业课所缴学费</td>
							<td align="left">
								<input type="checkbox" value="speTuition_s" id="speTuition_s">
							</td>
							<td align="right">专业课佣金比例</td>
							<td align="left">
								<input type="checkbox" value="speProportion_s" id="speProportion_s">
							</td>
							
						</tr>
					</table>
				</fieldset>
				<fieldset style="margin:10px;">
					<legend>佣金返还情况</legend>
					<table>
						<tr>
							<td align="right" width="120">第一笔佣金到账金额</td>
							<td align="left">
								<input type="checkbox" value="brokerageArriveNum_s" id="brokerageArriveNum_s">
							</td>
							<td align="right" width="140">第一笔佣金到账时间</td>
							<td align="left">
								<input type="checkbox" value="brokerageArriveDate_s" id="brokerageArriveDate_s">
							</td>
							<td align="right" width="140">第一笔佣金当前汇率</td>
							<td align="left">
								<input type="checkbox" value="brokerageRate_s" id="brokerageRate_s">
							</td>
							<td align="right" width="140">第一笔佣金折合人民币</td>
							<td align="left">
								<input type="checkbox" value="brokerageToRmb_s" id="brokerageToRmb_s">
							</td>
						</tr>
						<tr>
							<td align="right">第二笔佣金到账金额</td>
							<td align="left">
								<input type="checkbox" value="brokerageArriveNum2_s" id="brokerageArriveNum2_s">
							</td>
							<td align="right">第二笔佣金到账时间</td>
							<td align="left">
								<input type="checkbox" value="brokerageArriveDate2_s" id="brokerageArriveDate2_s">
							</td>
							<td align="right">第二笔佣金当前汇率</td>
							<td align="left">
								<input type="checkbox" value="brokerageRate2_s" id="brokerageRate2_s">
							</td>
							<td align="right">第二笔佣金折合人民币</td>
							<td align="left">
								<input type="checkbox" value="brokerageToRmb2_s" id="brokerageToRmb2_s">
							</td>
						</tr>
						<tr>
							<td align="right">全额佣金到账</td>
							<td align="left">
								<input type="checkbox" value="isAllBrokerageArrived_s" id="isAllBrokerageArrived_s">
							</td>
							<td align="right">剩余佣金金额</td>
							<td align="left">
								<input type="checkbox" value="lastBrokerageNum_s" id="lastBrokerageNum_s">
							</td>
							<td align="right">剩余佣金返还时间</td>
							<td align="left">
								<input type="checkbox" value="lastBrokerageArriveDate_s" id="lastBrokerageArriveDate_s">
							</td>
							<td align="right">备　　注</td>
							<td align="left">
								<input type="checkbox" value="descn_s" id="descn_s">
							</td>
						</tr>
					</table>
				</fieldset>
				<fieldset style="margin:10px;">
					<legend>其他</legend>
					<table>
						<tr>
							<td align="right" width="70">学生来源</td>
							<td align="left" width="20">
								<input type="checkbox" value="source_s" id="source_s">
							</td>
							<td align="right" width="80">顾问</td>
							<td align="left" width="20">
								<input type="checkbox" value="advisor_s" id="advisor_s">
							</td>
							<td align="right" width="80">文案</td>
							<td align="left" width="20">
								<input type="checkbox" value="docEmp_s" id="docEmp_s">
							</td>
							<td align="right" width="80">规划</td>
							<td align="left">
								<input type="checkbox" value="planEmp_s" id="planEmp_s">
							</td>
						</tr>
					</table>
				</fieldset>
		  </td></tr>
		</table>
		<table width="100%" >
            <tr>
                <td style="text-align:center;">
					<input type="button" onclick="selectFiled()" value="确定" class="button">&nbsp;&nbsp;             	
                    <input type="reset" value="重置" class="button">
                </td>
            </tr>
        </table>
	</div>
</form>
</body>
</html>