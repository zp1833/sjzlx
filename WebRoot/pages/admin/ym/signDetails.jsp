<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table width="100%" align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
	  	<td align="right" width="135" bgcolor="#EBEBEB">签约日期：</td>
		<td bgcolor="#EBEBEB" width="220">
			<input type="text" name="model.signTime" size="12" id="model.signTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.signTime" format="yyyy-MM-dd"/>'/>
	  	</td>
		<td align="right" bgcolor="#EBEBEB" width="100">签&nbsp;约&nbsp;人：</td>
		<td bgcolor="#EBEBEB">
			<select name="model.signName" id="model.signName">
				<option value="">--请选择--</option>
				<c:forEach items="${advEmps}" var="emp">
					<option ${model.signName==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
				</c:forEach>
			</select>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="135">服&nbsp;务&nbsp;费：</td>
		<td bgcolor="#EBEBEB" width="220">
			<input size="12" maxlength="50" name="model.serviceCharge" id="model.serviceCharge" value="${model.serviceCharge }">
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB">后&nbsp;期&nbsp;款：</td>
		<td bgcolor="#EBEBEB">
			<input size="12" maxlength="50" name="model.endPayment" id="model.endPayment" value="${model.endPayment }">
	  	</td>
    </tr>
	<tr>
	  	<td align="right" bgcolor="#EBEBEB" width="135">首&nbsp;期&nbsp;款：</td>
		<td bgcolor="#EBEBEB" colspan="3">
			<input size="12" maxlength="50" name="model.downPayment" id="model.downPayment" value="${model.downPayment }">
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="135">相关服务费用明细：</td>
		<td bgcolor="#EBEBEB" width="220">
			<textarea name="model.serviceChargeDetails" style="width:200px; height:60px;" id="model.serviceChargeDetails">${model.serviceChargeDetails }</textarea>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB">签约备注：</td>
		<td bgcolor="#EBEBEB">
			<textarea name="model.signDesc" style="width:200px; height:60px;" id="model.signDesc">${model.signDesc }</textarea>
	  	</td>
    </tr>
</table>
