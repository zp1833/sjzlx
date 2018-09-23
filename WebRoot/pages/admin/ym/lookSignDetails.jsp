<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table width="100%" align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
	  	<td align="right" width="135" bgcolor="#EBEBEB">签约日期：</td>
		<td bgcolor="#EBEBEB" width="220">
			<s:date name="model.signTime" format="yyyy-MM-dd"/>
	  	</td>
		<td align="right" bgcolor="#EBEBEB" width="100">签&nbsp;约&nbsp;人：</td>
		<td bgcolor="#EBEBEB">
			${model.signName }
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="135">服&nbsp;务&nbsp;费：</td>
		<td bgcolor="#EBEBEB" width="220">
			${model.serviceCharge }
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB">后&nbsp;期&nbsp;款：</td>
		<td bgcolor="#EBEBEB">
			${model.endPayment }
	  	</td>
    </tr>
	<tr>
	  	<td align="right" bgcolor="#EBEBEB" width="135">首&nbsp;期&nbsp;款：</td>
		<td bgcolor="#EBEBEB" colspan="3">
			${model.downPayment }
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="135">相关服务费用明细：</td>
		<td bgcolor="#EBEBEB" width="220">
			${model.serviceChargeDetails }
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB">签约备注：</td>
		<td bgcolor="#EBEBEB">
			${model.signDesc }
	  	</td>
    </tr>
</table>
