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
					<table width>
						<tr>
							<td align="right" width="140">姓名</td>
							<td align="left" >
								<input type="checkbox" value="name_s" id="name_s">
							</td>
							<td align="right" width="140">所去国家</td>
							<td align="left" >
								<input type="checkbox" value="toCountry_s" id="toCountry_s">
							</td>
							<td align="right" width="140">客户类型</td>
							<td align="left" >
								<input type="checkbox" value="clientType_s" id="clientType_s">
							</td>
							<td align="right" width="140">申请类型</td>
							<td align="left" >
								<input type="checkbox" value="applyType_s" id="applyType_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="140">被访问者关系类型</td>
							<td align="left" >
								<input type="checkbox" value="interviewType_s" id="interviewType_s">
							</td>
							<td align="right" width="140">入读时间</td>
							<td align="left" >
								<input type="checkbox" value="readTime_s" id="readTime_s">
							</td>
							<td align="right" width="140">入读学校（中文）</td>
							<td align="left" >
								<input type="checkbox" value="readSchoolZH_s" id="readSchoolZH_s">
							</td>
							<td align="right" width="140">入读学校（英文）</td>
							<td align="left" >
								<input type="checkbox" value="readSchoolEN_s" id="readSchoolEN_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="140">入读专业（中文）</td>
							<td align="left" >
								<input type="checkbox" value="majorZH_s" id="majorZH_s">
							</td>
							<td align="right" width="140">入读专业（英文）</td>
							<td align="left" >
								<input type="checkbox" value="majorEN_s" id="majorEN_s">
							</td>
							<td align="right" width="140">申请时间</td>
							<td align="left"  >
								<input type="checkbox" value="applyTime_s" id="applyTime_s">
							</td>
							<td align="right" width="140">录取时间</td>
							<td align="left"  >
								<input type="checkbox" value="enrollTime_s" id="enrollTime_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="140">合作方</td>
							<td align="left">
								<input type="checkbox" value="partner_s" id="partner_s">
							</td>
						</tr>
					</table>
				</fieldset>
				<fieldset style="margin:10px;">
					<legend>学生申请背景</legend>
					<table>
						<tr>
							<td align="right" width="140">出国前毕业/在读院校及学生阶段(中文)</td>
							<td align="left" width="20">
								<input type="checkbox" value="beforeSchool_s" id="beforeSchool_s">
							</td>
							<td align="right" width="140">出国前专业名称(中文)</td>
							<td align="left" width="20">
								<input type="checkbox" value="beforeMajor_s" id="beforeMajor_s">
							</td>
							<td align="right" width="140">GPA</td>
							<td align="left" width="20">
								<input type="checkbox" value="GPA_s" id="GPA_s">
							</td>
							<td align="right" width="140">TOEFLORIELTS</td>
							<td align="left" width="20">
								<input type="checkbox" value="TOEFLORIELTS_s" id="TOEFLORIELTS_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="140">GREORGMAT</td>
							<td align="left">
								<input type="checkbox" value="GREORGMAT_s" id="GREORGMAT_s">
							</td>
							<td align="right" width="140">SAT/ACT</td>
							<td align="left">
								<input type="checkbox" value="SATORACT_s" id="SATORACT_s">
							</td>
							<td align="right" width="140">SLEP</td>
							<td align="left">
								<input type="checkbox" value="SLEP_s" id="SLEP_s">
							</td>
							<td align="right" width="140">断档期</td>
							<td align="left">
								<input type="checkbox" value="interruptDate_s" id="interruptDate_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="140">相关实习经历</td>
							<td align="left">
								<input type="checkbox" value="praticeExperience_s" id="praticeExperience_s">
							</td>
							<td align="right" width="140">工作经历</td>
							<td align="left">
								<input type="checkbox" value="workExperience_s" id="workExperience_s">
							</td>
							<td align="right" width="140">国家级奖励</td>
							<td align="left">
								<input type="checkbox" value="nationalAwards_s" id="nationalAwards_s">
							</td>
							<td align="right" width="140">发明专利或论文</td>
							<td align="left">
								<input type="checkbox" value="patentOrThesis_s" id="patentOrThesis_s">
							</td>
						</tr>
						<tr>
							<td align="right" width="140">其他申请优势/要点(简述)</td>
							<td align="left">
								<input type="checkbox" value="advantage_s" id="advantage_s">
							</td>
							<td align="right" width="140">其他录取院校</td>
							<td align="left">
								<input type="checkbox" value="otherEnrollSchool_s" id="otherEnrollSchool_s">
							</td>
						</tr>
					</table>
				</fieldset>
				<fieldset style="margin:10px;">
					<legend>学生签证情况</legend>
					<table>
						<tr>
							<td align="right" width="120">签证学校（中文）</td>
							<td align="left">
								<input type="checkbox" value="visaSchool_s" id="visaSchool_s">
							</td>
							<td align="right" width="140">签证担保人</td>
							<td align="left">
								<input type="checkbox" value="visaSurety_s" id="visaSurety_s">
							</td>
							<td align="right" width="140">担保金总额</td>
							<td align="left">
								<input type="checkbox" value="suretyMoney_s" id="suretyMoney_s">
							</td>
							<td align="right" width="140">资金情况简述</td>
							<td align="left">
								<input type="checkbox" value="moneySituation_s" id="moneySituation_s">
							</td>
						</tr>
						<tr>
							<td align="right">顾问</td>
							<td align="left">
								<input type="checkbox" value="advisor_s" id="advisor_s">
							</td>
							<td align="right">文案</td>
							<td align="left">
								<input type="checkbox" value="copyWriter_s" id="copyWriter_s">
							</td>
							<td align="right">备注</td>
							<td align="left">
								<input type="checkbox" value="remark_s" id="remark_s">
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
					<input type="button" onclick="selectFiled()" value="确定" class="button">&nbsp;&nbsp;             	
                    <input type="reset" value="重置" class="button">
                </td>
            </tr>
        </table>
	</div>
</form>
</body>
</html>