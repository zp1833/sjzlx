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
</script>
</head>
<body onload="preFckEditor();">
<div class="x-panel">
  <div class="x-panel-header">同行电话管理</div>
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
<s:form action="saveTradeTel" validate="true" theme="simple">
<s:hidden name="model.id"/>
<s:hidden name="model.employee.id"/>
	<fieldset style="margin:10px;">
	<legend>添加同行电话信息</legend>
	<table style="width:700px">
	<tr>
		<td align="right">拨打日期：</td>
		<td align="left">
			<input type="text" name="model.createDate" size="12" id="model.createDate" 
				class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
					value='<s:date name="model.createDate" format="yyyy-MM-dd"/>'/>
			<font color="red">&nbsp;*</font>
		</td>
	</tr>
	<tr>
		<td align="right">拨打电话：</td>
		<td align="left">
			<input type="text" name="model.tel" id="model.tel" value="${model.tel }" size="12">
			<font color="red">&nbsp;*</font>
		</td>
	</tr>
	<tr>
		<td align="right">机构名称：</td>
		<td align="left">
			<input type="text" name="model.orgName" id="model.orgName" value="${model.orgName }" size="12">
			<font color="red">&nbsp;*</font>
		</td>
	</tr>
	<tr>
		<td align="right">具体描述：</td>
		<td align="left">
			<s:textarea id="model.content" name="model.content"></s:textarea>
		</td>
	</tr>
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