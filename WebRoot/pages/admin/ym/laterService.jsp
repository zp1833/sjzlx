<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table width="100%" align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
    <tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">预计离境时间:</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.leaveTime" size="12" id="model.leaveTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.leaveTime" format="yyyy-MM-dd"/>'/>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">接机安排:</td>
		<td bgcolor="#EBEBEB">
			<input type="text" value="${model.pickUpPlan }" size="30" maxlength="200" name="model.pickUpPlan">
	  	</td>
    </tr>
    <tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">住宿协助安排:</td>
		<td bgcolor="#EBEBEB">
			<input type="text" value="${model.livePlan }" size="30" maxlength="200" name="model.livePlan">
	  	</td>
    </tr>
    <tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">其他需求:</td>
		<td bgcolor="#EBEBEB">
			<input type="text" value="${model.otherRequest }" size="30" maxlength="200" name="model.otherRequest">
	  	</td>
    </tr>
</table>
