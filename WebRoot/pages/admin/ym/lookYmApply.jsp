<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<fieldset style="margin:8px;">
	<legend>申请情况</legend>
	<table align="left" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
		<tr>
			<td width="120" bgcolor="#EBEBEB" align="right">移民项目类别名称：</td>
			<td colspan="5" bgcolor="#EBEBEB">
				${model.ymTypeName }
			</td>
		</tr>
		<tr>
			<td bgcolor="#EBEBEB" align="right">递交时间：</td>
			<td bgcolor="#EBEBEB" width="120">
				<s:date name="model.sendTime" format="yyyy-MM-dd"/>
			</td>
			<td bgcolor="#EBEBEB" align="right">档案号码：</td>
			<td bgcolor="#EBEBEB" width="120">
				${model.docId }
			</td>
			<td bgcolor="#EBEBEB" align="right">面试时间：</td>
			<td bgcolor="#EBEBEB" width="120">
				<s:date name="model.meetTime" format="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<td bgcolor="#EBEBEB" align="right">备注：</td>
			<td colspan="5" bgcolor="#EBEBEB">
				${model.applyDesc }
			</td>
		</tr>
	</table>
</fieldset>
