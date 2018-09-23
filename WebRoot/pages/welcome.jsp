<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/common/extAll.jsp"%>
<html lang="en">
<head>
    <title>Ext - Welcome</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/welcome/reset-min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/welcome/welcome.css"/>
    <style type="text/css">
<!--
.STYLE6 {color: #CCCCCC}
.tdborder{
	border-bottom-style:dotted;
	border-bottom-width:1px
}
.toptdborder{
	border-bottom-style:dotted;
	border-bottom-width:1px;
	border-bottom-color:#0A246A
}
.STYLE10 {font-size: 12}
.STYLE12 {color: #FF0000}
-->
    </style>
    <script type="text/javascript">
    	function editAssessInfo(aid,cid) {
			window.showModalDialog("${ctx}/admin/assess/editAssessInfo.do?model.id="+aid+"&assessCell.id="+cid,0,"dialogWidth=500px;dialogHeight=300px");
		}
    </script>
</head>
<body>

<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_AUDIT">
	<div <stc:role ifAnyGranted="ROLE_ORADMIN,ROLE_ADMIN,ROLE_AUDIT">class="col1"</stc:role> <stc:role ifNotGranted="ROLE_ORADMIN">class="col"</stc:role> style="height:98%;">
		<div class="block" style="height:98%; overflow: auto;">
			<table width="100%" class="toptdborder">
				<tr>
					<td class="block-title"><img src="${ctx}/images/icons/authority.gif" width="16" height="16">
						<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN,ROLE_AUDIT">
							顾问工作考核<font size="1">（昨日回访完成情况）</font>
						</stc:role>
						<stc:role ifNotGranted="ROLE_ADMIN,ROLE_ORADMIN,ROLE_AUDIT">
							顾问工作提醒<font size="1">（今日需回访的学生）</font>
						</stc:role>			
					</td>
				</tr>
			</table>
			<div class="block-body">
				<table width="93%" border="0" cellpadding="0" cellspacing="0">
					<cms:remindTag></cms:remindTag>
				</table>
			</div>
		</div>
	</div>
</stc:role> 

<div <stc:role ifAnyGranted="ROLE_ORADMIN,ROLE_ADMIN,ROLE_AUDIT">class="col1"</stc:role> <stc:role ifNotGranted="ROLE_ORADMIN">class="col"</stc:role> style="height:98%;">
	<div class="block" style="height:98%; overflow: auto;">
		<table width="100%" class="toptdborder">
			<tr>
				<td class="block-title"><img src="${ctx}/images/icons/authority.gif" width="16" height="16">
					公司制度考核<font size="1"></font>
				</td>
			</tr>
		</table>
		<div class="block-body">
			<table width="93%" border="0" cellpadding="0" cellspacing="0">
				<cms:remindAuditTag></cms:remindAuditTag>
			</table>
		</div>
	</div>
</div>

<div <stc:role ifAnyGranted="ROLE_ORADMIN,ROLE_ADMIN,ROLE_AUDIT">class="col1"</stc:role> <stc:role ifNotGranted="ROLE_ORADMIN">class="col"</stc:role> style="height:98%">
	<div class="block" style="height:98%; overflow: auto;">
		<table width="100%" class="toptdborder">
			<tr>
				<td class="block-title"><img src="${ctx}/images/icons/authority.gif" width="16" height="16">
					工作计划
				</td>
			</tr>
		</table>
		<div class="block-body">
			<table width="93%" height="50%" border="0" cellpadding="0" cellspacing="4">
				<tr>
					<td valign="top">
						<table cellpadding="0" cellspacing="0" align="left" class="STYLE10">
							<cms:workPlanTag></cms:workPlanTag>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<stc:role ifAnyGranted="ROLE_FINANCE">
	<div <stc:role ifAnyGranted="ROLE_ORADMIN">class="col1"</stc:role> <stc:role ifNotGranted="ROLE_ORADMIN">class="col"</stc:role> style="height:98%;">
		<div class="block" style="height:98%; overflow: auto;">
			<table width="100%" class="toptdborder">
				<tr>
					<td class="block-title"><img src="${ctx}/images/icons/authority.gif" width="16" height="16">
						签约客户信息<font size="1">（本月与上月的签约客户名单）</font>
					</td>
				</tr>
			</table>
			<div class="block-body">
				<table width="93%" border="0" cellpadding="0" cellspacing="0">
					<cms:remindFinanceTag></cms:remindFinanceTag>
				</table>
			</div>
		</div>
	</div>
</stc:role> 

<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_FINANCE,ROLE_AUDIT">
	<div <stc:role ifAnyGranted="ROLE_ORADMIN,ROLE_ADMIN,ROLE_AUDIT">class="col1"</stc:role> <stc:role ifNotGranted="ROLE_ORADMIN">class="col"</stc:role> style="height:98%;">
		<div class="block" style="height:98%; overflow: auto;">
			<table width="100%" class="toptdborder">
				<tr>
					<td class="block-title"><img src="${ctx}/images/icons/authority.gif" width="16" height="16">
						<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN,ROLE_ADV,ROLE_AUDIT">
							顾问工作交接<font size="1">（签约后未完全交接的学生）</font>
						</stc:role>
						<stc:role ifNotGranted="ROLE_ADMIN,ROLE_ORADMIN,ROLE_ADV,ROLE_AUDIT">
							顾问工作交接<font size="1">（后期服务与顾问的交接）</font>
						</stc:role>			
					</td>
				</tr>
			</table>
			<div class="block-body">
				<table width="93%" border="0" cellpadding="0" cellspacing="0">
					<cms:remindChangeTag></cms:remindChangeTag>
				</table>
			</div>
		</div>
	</div>
</stc:role> 

<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_DOC,ROLE_ORADMIN,ROLE_AUDIT">
	<div <stc:role ifAnyGranted="ROLE_ORADMIN,ROLE_ADMIN,ROLE_AUDIT">class="col1"</stc:role> <stc:role ifNotGranted="ROLE_ORADMIN">class="col"</stc:role> style="height:98%">
		<div class="block" style="height:98%; overflow: auto;">
			<table width="100%" class="toptdborder">
				<tr>
					<td class="block-title"><img src="${ctx}/images/icons/authority.gif" width="16" height="16">
						<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN,ROLE_AUDIT">
							文案工作考核<font size="1">（本月签约学生及以往未完成的学生）</font>
						</stc:role>
						<stc:role ifNotGranted="ROLE_ADMIN,ROLE_ORADMIN,ROLE_AUDIT">
							文案工作提醒<font size="1">（本月签约学生及以往未完成的学生）</font>
						</stc:role>
					</td>
				</tr>
			</table>
			<div class="block-body">
				<table width="93%" border="0" cellpadding="0" cellspacing="0">
					<cms:remindDocTag></cms:remindDocTag>
				</table>
			</div>
		</div>
	</div>
	<div class="col1" style="height:98%;">
		<div class="block" style="height:98%; overflow: auto;">
			<table width="100%" class="toptdborder">
				<tr>
					<td class="block-title"><img src="${ctx}/images/icons/authority.gif" width="16" height="16">
						现操作客户提醒		
					</td>
				</tr>
			</table>
			<div class="block-body">
				<table width="98%" border="0" cellpadding="0" cellspacing="0">
					<cms:dealingTag></cms:dealingTag>
				</table>
			</div>
		</div>
	</div>
</stc:role>
	<div class="col" style="height:100%;width: 80%; display: none;">
		<div class="block" style="height:98%; overflow: auto; ">
			<table width="100%" class="toptdborder">
				<tr>
					<td class="block-title"><img src="${ctx}/images/icons/authority.gif" width="16" height="16">
						佣金工作提醒		
					</td>
				</tr>
			</table>
			<div class="block-body">
				<table width="98%" border="0" cellpadding="0" cellspacing="0">
					<cms:remindBrokerageTag></cms:remindBrokerageTag>
				</table>
			</div>
		</div>
	</div>
</body>
</html>