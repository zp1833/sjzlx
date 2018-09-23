<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table width="100%" align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">做认证(交接/完成时间):</td>
		<td bgcolor="#EBEBEB" width="100">
			<s:date name="model.doAuthTime" format="yyyy-MM-dd"/>
	  	</td>
		<td align="right" bgcolor="#EBEBEB" width="200">住宿安排(交接/完成时间):</td>
		<td bgcolor="#EBEBEB" width="100">
			<s:date name="model.doStayTime" format="yyyy-MM-dd"/>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="200">做贷款(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<s:date name="model.doLoanTime" format="yyyy-MM-dd"/>
	  	</td>
    </tr>
  	<tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">买汇票(交接/完成时间):</td>
		<td bgcolor="#EBEBEB" width="20">
			<s:date name="model.buyDraftTime" format="yyyy-MM-dd"/>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="200">机票预订(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<s:date name="model.bookTicketTime" format="yyyy-MM-dd"/>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="200">起飞时间(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<s:date name="model.flyTime" format="yyyy-MM-dd"/>
	  	</td>
    </tr>
    <tr>
    	<td align="right" bgcolor="#EBEBEB" width="200">调取高考成绩(交接/完成时间):</td>
		<td bgcolor="#EBEBEB" width="20">
			<s:date name="model.takeScoreTime" format="yyyy-MM-dd"/>
	  	</td>
	  	<td align="right" width="200" bgcolor="#EBEBEB">接机安排(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<s:date name="model.pickUpPlanTime" format="yyyy-MM-dd"/>
	  	</td>
	  	<td align="right" width="200" bgcolor="#EBEBEB">落地时间(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<s:date name="model.fallTime" format="yyyy-MM-dd"/>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="200">电汇学费或押金(交接/完成时间):</td>
		<td bgcolor="#EBEBEB" width="20">
			<s:date name="model.giveMoneyTime" format="yyyy-MM-dd"/>
	  	</td>
	  	<td align="right" width="200" bgcolor="#EBEBEB">接机问候(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<s:date name="model.pickUpAskTime" format="yyyy-MM-dd"/>
	  	</td>
	  	<td align="right" width="200" bgcolor="#EBEBEB">反馈结果:</td>
		<td bgcolor="#EBEBEB">
			${model.feedback }
	  	</td>
    </tr>
</table>
