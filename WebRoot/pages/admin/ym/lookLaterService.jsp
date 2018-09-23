<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table width="100%" align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">预计离境时间:</td>
		<td bgcolor="#EBEBEB">
			<s:date name="model.leaveTime" format="yyyy-MM-dd"/>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">接机安排:</td>
		<td bgcolor="#EBEBEB">
			${model.pickUpPlan }
	  	</td>
    </tr>
    <tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">住宿协助安排:</td>
		<td bgcolor="#EBEBEB">
			${model.livePlan }
	  	</td>
    </tr>
    <tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">其他需求:</td>
		<td bgcolor="#EBEBEB">
			${model.otherRequest }
	  	</td>
    </tr>
</table>
