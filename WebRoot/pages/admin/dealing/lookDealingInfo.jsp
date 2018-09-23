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
		var schools = JSON.parse('${model.otherEnrollSchool}');
		for(var i=0; i<schools.length; i++) {
			var school = schools[i];
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(1)").html(school.o_readTime);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(2)").html(school.o_zhengReadTime);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(3)").html(school.o_applySchool);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(4)").html(school.o_applySpecial);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(5)").html(school.o_applyType);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(6)").html(school.o_partner);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(7)").html(school.o_applySendTime);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(8)").html(school.o_receiveTime);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(9)").html(school.o_isGetOffer);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(10)").html(school.o_isNeedLang);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(11)").html(school.o_offerCondition);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(12)").html(school.o_offerEndTime);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(13)").html(school.o_isAcceptOffer);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(14)").html(school.o_visaSendTime);
			$("#enrollSchools tr:eq("+(i+1)+")").find("td:eq(15)").html(school.o_isBeSigned);
		}
	});
	
</script>
</head>
<body>
	<div class="x-panel">
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
		          <td height="110" align="center">
					<div id='SystopTabDiv1'>
						<%@include file="lookDealingInfoDetail.jsp" %>
					</div>
					<div id='SystopTabDiv2' style="display:none">
						<%@include file="lookOtherEnrollSchool.jsp" %>
					</div>
				  </td>
		        </tr>
		    </table>		
		  </td></tr>
		</table>
	</div>
</body>
</html>