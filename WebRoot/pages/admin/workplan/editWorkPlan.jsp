<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/fckeditor/fckeditor.js"></script>
<script type="text/javascript">
	function preFckEditor(){
		var fckEditor = new FCKeditor( 'model.content' ) ;
	    fckEditor.BasePath = "${ctx}/js/fckeditor/";
	    fckEditor.ToolbarSet = 'zp';
	    fckEditor.Height = 210;
	    fckEditor.ReplaceTextarea();
	}
	
	function showInput() {
		if(document.getElementById("model.employee.id").value == '0')
			document.getElementById("showInput").style.display = "";
		else
			document.getElementById("showInput").style.display = "none";
	}
	
	function init() {
		if("${model.empId}" == "0")
			document.getElementById("showInput").style.display = "";
	}
	
</script>
</head>
<body onload="init();preFckEditor();">
<div class="x-panel">
  <div class="x-panel-header">工作计划管理</div>
    <div class="x-toolbar">
	  <table width="100%">	      
		<tr>	         
		  <td align="right">
          </td>
        </tr>
      </table>
    </div>
<table width="100%" border="0" cellpadding="5" cellspacing="1">
	<tr>
		<td><%@ include file="/common/messages.jsp"%></td>
	</tr>
</table>
<div class="x-panel-body">
<table width="50%" align="center"><tr><td align="center">
<s:form action="saveWorkPlan" validate="true" theme="simple">
<s:hidden name="model.id"/>
	<fieldset style="margin:10px;">
	<legend>添加工作计划</legend>
	<table style="width:700px">
	<tr>
		<td align="right">计划日期：</td>
		<td align="left">
			<input type="text" name="model.startDate" size="12" id="model.startDate" 
				class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
					value='<s:date name="model.startDate" format="yyyy-MM-dd"/>'/>
				至
			<input type="text" name="model.endDate" size="12" id="model.endDate" 
				class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
					value='<s:date name="model.endDate" format="yyyy-MM-dd"/>'/>
			<font color="red">&nbsp;*</font>
		</td>
	</tr>
	<tr>
		<td align="right">工作内容：</td>
		<td align="left">
			<s:textarea id="model.content" name="model.content"></s:textarea>
		</td>
	</tr>
	<tr>
		<td align="right">责&nbsp;任&nbsp;人：</td>
		<td align="left">
			<select name="model.empName" id="model.employee.id" style="width:88px" onchange="showInput()">
				<option value="">--请选择--</option>
				<c:forEach items="${allEmps}" var="emp">
					<option ${model.empName==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
				</c:forEach>
				<option value="0" ${model.empId == 0?"selected":""}>（手填）</option>
			</select>
			<span id="showInput" style="display: none"><input type="text" name="otherEmp" value="${model.empName }"></span>
		</td>
	</tr>
<stc:role ifAnyGranted="ROLE_ADMIN">	
	<tr>
		<td align="right">是否完成：</td>
		<td align="left">
			<input type="checkbox" value="1" name="model.isDone" ${model.isDone == "1"?"checked":"" }>
		</td>
	</tr>
</stc:role>
	</table>
	</fieldset>
	<table width="100%" style="margin-bottom:10px;">
	<tr>
		<td colspan="2" align="center" class="font_white">
		<s:submit value="保存" cssClass="button"></s:submit>&nbsp;&nbsp;
		<input type="button" value="返回" class="button" onclick="history.back()"/>
		</td>
	</tr>
</table>
</s:form>
 </td></tr></table>
        </div></div>
</body>
</html>