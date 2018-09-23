<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>员工考核表</title>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<%@include file="/common/dwr.jsp"%>
<script type="text/javascript"	src="${ctx}/dwr/interface/AssessManager.js"></script>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/dojo/dojo/dojo.js" djConfig="isDebug:false, parseOnLoad: true"></script>
<style type="text/css">
	@import "${ctx}/js/dojo/jsam/resources/tooltip.css"; 
</style>
<script type="text/javascript">

	dojo.require("dijit.Tooltip");
	dojo.require("dojo.parser");
	
	function editAssessInfo(id) {
		var params = window.showModalDialog("${ctx}/admin/assess/editAssessInfo.do?model.id=${model.id}&assessCell.id="+id,0,"dialogWidth=500px;dialogHeight=300px");
		//document.getElementById("id_"+params[0]+"_"+params[1]).innerHTML += "<a href='#' onclick='editAssessInfo("+params[3]+")'><font color='blue'>"+params[2]+"</blue></a><br>";
		<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_AUDIT">
		window.location.reload();
		</stc:role>
	}
	
	function addAssessInfo() {
		var params = window.showModalDialog("${ctx}/admin/assess/editAssessInfo.do?action=add&assessCell.id=0&model.id=${model.id}",0,"dialogWidth=500px;dialogHeight=300px");
		//document.getElementById("id_"+params[0]+"_"+params[1]).innerHTML += "<a href='#' onclick='editAssessInfo("+params[3]+")'><font color='blue'>"+params[2]+"</blue></a><br>";
		<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_AUDIT">
		window.location.reload();
		</stc:role>
	}
	
	function init() {
		AssessManager.getAllAssessCells(${model.id},function(cells) {
			for(var i=0; i<cells.length; i++) {
				var yearStr = cells[i].adate.getFullYear();
				var monthStr = (cells[i].adate.getMonth()+1+"").length == 1?"0"+(cells[i].adate.getMonth()+1):(cells[i].adate.getMonth()+1);
				var dayStr = (cells[i].adate.getDate()+"").length == 1?"0"+cells[i].adate.getDate():cells[i].adate.getDate();
				var dateStr = yearStr+"-"+monthStr+"-"+dayStr;
				var td = document.getElementById("id_"+dateStr+"_"+cells[i].assessItem.id);
				td.innerHTML += "<a href='#' onclick='editAssessInfo("+cells[i].id+")'><font color='blue'>"+cells[i].employee.name+"</blue></a><br>";
			}
		});
	}
</script>
</head>
<body onload="init();">
<div class="x-panel">
<div class="x-panel-header">员工考核表</div>
<div class="x-toolbar">
  <table width="100%">	      
	<tr>	         
	  <td align="right">
	  	<input type="button" class="button" value="添加" onclick="addAssessInfo();">&nbsp;&nbsp;
		<input type="button" class="button" value="关闭" onclick="javascript:window.close(1)">
	  </td>
	  <td width="15"></td>
	</tr>
  </table>
</div>
<table width="100%" border="0" cellpadding="5" cellspacing="1">
	<tr>
		<td><%@ include file="/common/messages.jsp"%></td>
	</tr>
</table>
<div class="x-panel-body">
<table width="99%" align="center"><tr><td align="center">
	<fieldset style="margin:10px;">
	<legend>员工考核表</legend>
	<table width="99%" align="center" bgcolor="#FFFFFF" border="1" style="border-collapse: collapse" cellpadding="2" cellspacing="1">
		<tr>            
		  	<th align="center"  bgcolor="#EBEBEB" rowspan="2">日期</th>
		  <c:forEach items="${assessItemsById}" var="assessItem">
		  	<th align="center" bgcolor="#EBEBEB" height="30">${assessItem.name }</th>
		  </c:forEach>
	    </tr>
	    <tr>
	      <c:forEach items="${assessItemsById}" var="assessItem">
		  	<th align="center" bgcolor="#EBEBEB" height="30">
		  		<div align="center" id="detail_${assessItem.id}">${fn:substring(assessItem.descn, 0, 7)}</div>
	             <span dojoType="dijit.Tooltip" connectId="detail_${assessItem.id}" style="display:none;">
	                <span style="font-size:12px;">
	                	${assessItem.descn}
	                </span>
	             </span> 
		  	</th>
		  </c:forEach>
	    </tr>
	<c:forEach items="${daysInCurrentMonth}" var="day">
		<tr>
		  	<td align="center" height="25" width="75"><s:date name="#attr.day" format="yyyy-MM-dd"/></td>
		<c:forEach items="${assessItemsById}" var="assessItem">
			<td align="center" id="id_<s:date name="#attr.day" format="yyyy-MM-dd"/>_${assessItem.id }"></td>
		</c:forEach>
	    </tr>
	</c:forEach>
    </table>
	</fieldset>
 </td></tr></table>
        </div></div>
</body>
</html>