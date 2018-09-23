<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<fieldset style="margin:8px;">
      <legend>申请情况</legend>
<table align="left" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
		<td width="120" bgcolor="#EBEBEB" align="right">移民项目类别名称：</td>
		<td colspan="5" bgcolor="#EBEBEB">
			<input name="model.ymTypeName" size="60" maxlength="250" value="${model.ymTypeName }">
		</td>
	</tr>
	<tr>
		<td bgcolor="#EBEBEB" align="right">递交时间：</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.sendTime" size="12" id="model.sendTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.sendTime" format="yyyy-MM-dd"/>'/>
		</td>
		<td bgcolor="#EBEBEB" align="right">档案号码：</td>
		<td bgcolor="#EBEBEB">
			<input name="model.docId" id="model.docId" value="${model.docId }">
		</td>
		<td bgcolor="#EBEBEB" align="right">面试时间：</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.meetTime" size="12" id="model.meetTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.meetTime" format="yyyy-MM-dd"/>'/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#EBEBEB" align="right">备注：</td>
		<td colspan="5" bgcolor="#EBEBEB">
			<textarea name="model.applyDesc" style="width:98%; height:60px">${model.applyDesc }</textarea>
		</td>
	</tr>
</table>
</fieldset>
