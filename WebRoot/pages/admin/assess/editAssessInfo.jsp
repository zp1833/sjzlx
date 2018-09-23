<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑考核信息</title>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<%@include file="/common/dwr.jsp"%>
<script type="text/javascript"	src="${ctx}/dwr/interface/AssessManager.js"></script>
<script type="text/javascript">
	function addAssessCell() {
		var select = document.getElementById("empId");
		var empId = select.value;
		var empName = select.options[select.selectedIndex].text;
		var itemId = document.getElementById("itemId").value;
		var adate = document.getElementById("adate").value;
		var isPay = document.getElementById("isPay").value;
		var descn = document.getElementById("descn").value;
		if(empId == "") {
			alert("请选择人员姓名");
			return;
		}
		if(itemId == "") {
			alert("请选择考核项目");
			return;
		}
		if(adate == "") {
			alert("请选择考核日期");
			return;
		}
		if(isPay == "") {
			alert("请选择是否交钱");
			return;
		}
		AssessManager.saveAssessCell(${assessCell.id},empId,itemId,adate,isPay,descn,function(result) {
			if(result != "0") {
				window.returnValue = [adate,itemId,empName,result];
				window.close();
			} else {
				alert("系统繁忙，请稍后再试！");
			}
		}); 
	}
	
	function delAssessCell() {
		if(confirm("确认删除？")) {
			AssessManager.delAssessCell(${assessCell.id},function(result) {
				if(result == "1") {
					window.close();
				} else {
					alert("系统繁忙，请稍后再试！");
				}
			});
		}
	}
</script>
</head>
<body>
	<div class="x-panel">
	    <div class="x-panel-header">编辑考核信息</div>
		<table width="100%" border="0" align="center">
		  <tr><td>
		    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="Content">
		        <tr>
		          <td>
					<div>
					<s:form action="saveAssessCell.do" namespace="/admin/assess" theme="simple" id="assessForm">
						<table align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1" width="100%">
							<tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">人员姓名：</td>
								<td bgcolor="#EBEBEB">
									<select name="assessCell.employee.id" id="empId">
										<option value="">--请选择--</option>
									<c:forEach items="${employees}" var="emp">	
										<option value="${emp.id }" ${assessCell.employee.id == emp.id?"selected":"" }>${emp.name }</option>
									</c:forEach>
									</select><font color="red">*</font>
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">考核项目：</td>
								<td bgcolor="#EBEBEB">
									<select name="assessCell.assessItem.id" id="itemId">
										<option value="">--请选择--</option>
									<c:forEach items="${assessItemsById}" var="assessItem">	
										<option value="${assessItem.id }" ${assessCell.assessItem.id == assessItem.id?"selected":"" }>${assessItem.name }</option>
									</c:forEach>
									</select><font color="red">*</font>
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">考核日期：</td>
								<td bgcolor="#EBEBEB">
									<select name="assessCell.adate" id="adate">
										<option value="">--请选择--</option>
									<c:forEach items="${daysInCurrentMonth}" var="day">	
										<option value="<s:date name="#attr.day" format="yyyy-MM-dd"/>" <c:if test="${assessCell.adate >= day && assessCell.adate <= day}">selected</c:if>><s:date name="#attr.day" format="yyyy-MM-dd"/></option>
									</c:forEach>
									</select><font color="red">*</font>
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">是否交钱：</td>
								<td bgcolor="#EBEBEB">
									<select name="assessCell.isPay" id="isPay">
										<option value="">--请选择--</option>
										<option value="0" ${assessCell.isPay == "0"?"selected":"" }>未交</option>
										<option value="1" ${assessCell.isPay == "1"?"selected":"" }>已交</option>
									</select><font color="red">*</font>
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">备注：</td>
								<td bgcolor="#EBEBEB">
									<textarea rows="5" cols="30" name="assessCell.descn" id="descn">${assessCell.descn }</textarea>
							  	</td>
						    </tr>
						</table>
					</s:form>
					</div>
				  </td>
		        </tr>
		    </table>		
		  </td></tr>
		</table>
		<table width="100%" >
            <tr>
                <td style="text-align:center;">
					<input type="button" onclick="addAssessCell();" value="确定" class="button">&nbsp;&nbsp;   
				<stc:role ifAnyGranted="ROLE_ADMIN">
					<c:if test="${assessCell.id != 0}">	
						<input type="button" onclick="delAssessCell();" value="删除" class="button"> 
					</c:if>   
				</stc:role>      	
                </td>
            </tr>
        </table>
	</div>
</body>
</html>