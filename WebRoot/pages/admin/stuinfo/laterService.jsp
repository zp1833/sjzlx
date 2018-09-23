<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table width="100%" align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
  	<tr>
	  	<td align="right" width="170" bgcolor="#EBEBEB">做认证(交接/完成时间):</td>
		<td bgcolor="#EBEBEB"  width="120">
			<input type="text" name="model.doAuthTime" size="12" id="model.doAuthTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.doAuthTime" format="yyyy-MM-dd"/>'/>
	  	</td>
	  	<td align="right" width="170" bgcolor="#EBEBEB">住宿安排(交接/完成时间):</td>
		<td bgcolor="#EBEBEB" width="120">
			<input type="text" name="model.doStayTime" size="12" id="model.doStayTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.doStayTime" format="yyyy-MM-dd"/>'/>
	  	</td>
	  	<td align="right" width="170" bgcolor="#EBEBEB">做贷款(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.doLoanTime" size="12" id="model.doLoanTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.doLoanTime" format="yyyy-MM-dd"/>'/>
	  	</td>
    </tr>
    <tr>
    	<td align="right" width="170" bgcolor="#EBEBEB">买汇票(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.buyDraftTime" size="12" id="model.buyDraftTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.buyDraftTime" format="yyyy-MM-dd"/>'/>
	  	</td>
	  	<td align="right" width="170" bgcolor="#EBEBEB">机票预订(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.bookTicketTime" size="12" id="model.bookTicketTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.bookTicketTime" format="yyyy-MM-dd"/>'/>
	  	</td>
	  	<td align="right" width="170" bgcolor="#EBEBEB">起飞时间(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.flyTime" size="12" id="model.flyTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.flyTime" format="yyyy-MM-dd"/>'/>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" width="170" bgcolor="#EBEBEB">调取高考成绩(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.takeScoreTime" size="12" id="model.takeScoreTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.takeScoreTime" format="yyyy-MM-dd"/>'/>
	  	</td>
	  	<td align="right" width="170" bgcolor="#EBEBEB">接机安排(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.pickUpPlanTime" size="12" id="model.pickUpPlanTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.pickUpPlanTime" format="yyyy-MM-dd"/>'/>
	  	</td>
	  	<td align="right" width="170" bgcolor="#EBEBEB">落地时间(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.fallTime" size="12" id="model.fallTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.fallTime" format="yyyy-MM-dd"/>'/>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" width="200" bgcolor="#EBEBEB">电汇学费或押金(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.giveMoneyTime" size="12" id="model.giveMoneyTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.giveMoneyTime" format="yyyy-MM-dd"/>'/>
	  	</td>
	  	<td align="right" width="170" bgcolor="#EBEBEB">接机问候(交接/完成时间):</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.pickUpAskTime" size="12" id="model.pickUpAskTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.pickUpAskTime" format="yyyy-MM-dd"/>'/>
	  	</td>
	  	<td align="right" width="170" bgcolor="#EBEBEB">反馈结果:</td>
		<td bgcolor="#EBEBEB">
			<input type="text" value="${model.feedback }" size="30" maxlength="200" name="model.feedback">
	  	</td>
    </tr>
</table>
