<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<fieldset style="margin:8px;">
      <legend>学生信息</legend>
<table  align="left" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<stc:role ifAnyGranted="ROLE_ADV">
	<tr>
	  	<td align="right" style="width:90px; height:25px; text-align: right" bgcolor="#EBEBEB">客户姓名：</td>
		<td bgcolor="#EBEBEB" style="width:150px">
			<input maxlength="50" style="width:90px" name="model.stuName" id="model.stuName" value="${model.stuName }">
	  	</td>
		<td align="right" bgcolor="#EBEBEB" width="100">咨询国家：</td>
		<td bgcolor="#EBEBEB">
			<select name="model.advCountry" id="model.advCountry" style="width:88px" onchange="inputCountry(this)">
				<option value="">--请选择--</option>
				<option ${model.advCountry=='美国'?"selected":"" } value="美国">美国</option>
				<option ${model.advCountry=='加拿大'?"selected":"" } value="加拿大">加拿大</option>
				<option ${model.advCountry=='希腊'?"selected":"" } value="希腊">希腊</option>
				<option ${model.advCountry=='西班牙'?"selected":"" } value="西班牙">西班牙</option>
				<option ${model.advCountry=='葡萄牙'?"selected":"" } value="葡萄牙">葡萄牙</option>
				<option ${model.advCountry=='塞浦路斯'?"selected":"" } value="塞浦路斯">塞浦路斯</option>
				<option ${model.advCountry=='匈牙利'?"selected":"" } value="匈牙利">匈牙利</option>
				<option ${model.advCountry=='意大利'?"selected":"" } value="意大利">意大利</option>
				<option ${model.advCountry=='澳大利亚'?"selected":"" } value="澳大利亚">澳大利亚</option>
				<option ${model.advCountry=='新西兰'?"selected":"" } value="新西兰">新西兰</option>
				<option ${model.advCountry=='英国'?"selected":"" } value="英国">英国</option>
				<option ${model.advCountry=='香港'?"selected":"" } value="香港">香港</option>
				<option ${model.advCountry=='新加坡'?"selected":"" } value="新加坡">新加坡</option>
				<option ${model.advCountry=='0'?"selected":"" } value="0" ${fn:contains(model.advCountry, "#")?"selected":"" }>（可以手填）</option>
			</select>
			<input type="text" value="${fn:replace(model.advCountry, "#", "")}" name="otherCountry" id="otherCountry" size="20" style="display:  ${fn:contains(model.advCountry, "#")?"":"none" }">
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">负责顾问：</td>
		<td bgcolor="#EBEBEB">
			<select name="model.advisor" id="model.advisor">
				<option value="">--请选择--</option>
				<c:forEach items="${advEmps}" var="emp">
					<option ${model.advisor==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
				</c:forEach>
			</select>
	  	</td>
    </tr>
    </stc:role>
	<tr>
	  	<td align="right" style="width:90px; text-align: right" bgcolor="#EBEBEB">当前进度：</td>
		<td bgcolor="#EBEBEB" style="width:150px">
			<select name="model.currentPlan" id="model.currentPlan" style="margin: 0px; width: 100px">
				<option value="">--请选择--</option>
				<option ${model.currentPlan=="咨询中"?"selected":"" } value="咨询中">咨询中</option>
				<option ${model.currentPlan=="移民签证材料中"?"selected":"" } value="移民签证材料中">移民签证材料中</option>
				<option ${model.currentPlan=="移民申请中"?"selected":"" } value="移民申请中">移民申请中</option>
				<option ${model.currentPlan=="后期服务"?"selected":"" } value="后期服务">后期服务</option>
				<option ${model.currentPlan=="退费"?"selected":"" } value="退费">退费</option>
			</select>
	  	</td>
		<td align="right" bgcolor="#EBEBEB" width="100">下次回访日期：</td>
		<td bgcolor="#EBEBEB" width="150">
		<stc:role ifNotGranted="ROLE_REC">
			<input type="text" name="model.nextVisitTime" size="12" id="model.nextVisitTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-%d'})"
							value='<s:date name="model.nextVisitTime" format="yyyy-MM-dd"/>'/>
		</stc:role>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">状态定义日期：</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.statusDefineTime" size="12" id="model.statusDefineTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.statusDefineTime" format="yyyy-MM-dd"/>'/>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="100">所学专业：</td>
		<td bgcolor="#EBEBEB">
			<input name="model.speciality" value="${model.speciality }" size="15" maxlength="50">
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">毕业院校：</td>
		<td bgcolor="#EBEBEB">
			<input name="model.finishSchool" value="${model.finishSchool }" size="15" maxlength="50">
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">客户分类：</td>
		<td bgcolor="#EBEBEB">
			<select name="model.stuType" id="model.stuType" onchange="changeSignStatus(this)" style="margin: 0px">
				<option value="">--请选择--</option>
				<option ${model.stuType=="签约率90%以上"?"selected":"" } value="签约率90%以上">签约率90%以上</option>
				<option ${model.stuType=="签约率80%"?"selected":"" } value="签约率80%">签约率80%</option>
				<option ${model.stuType=="签约率50%"?"selected":"" } value="签约率50%">签约率50%</option>
				<option ${model.stuType=="签约率20%"?"selected":"" } value="签约率20%">签约率20%</option>
				<option ${model.stuType=="长期客户"?"selected":"" } value="长期客户">长期客户</option>
				<option ${model.stuType=="沉默客户"?"selected":"" } value="沉默客户">沉默客户</option>
				<option ${model.stuType=="交订金"?"selected":"" } value="交订金">交订金</option>
				<option ${model.stuType=="已签约"?"selected":"" } value="已签约">已签约</option>
				<option ${model.stuType=="退费"?"selected":"" } value="退费">退费</option>
			</select>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="100">最高学历：</td>
		<td bgcolor="#EBEBEB" width="150">
			<input name="model.education" value="${model.education }" size="15">
	  	</td>
	  	
	  	<td align="right" bgcolor="#EBEBEB" width="100">工作经验：</td>
		<td bgcolor="#EBEBEB">
			<input name="model.jobExp" value="${model.jobExp }" size="15">
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">经商经验：</td>
		<td bgcolor="#EBEBEB" width="150">
			<input name="model.busiExp" value="${model.busiExp }" size="15">
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" style="width:90px">资金状况：</td>
		<td bgcolor="#EBEBEB" style="width:150px">
			<input name="model.finances" value="${model.finances }" size="15" maxlength="50">
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">联系方式：</td>
		<td bgcolor="#EBEBEB" width="150">
			<c:if test="${model.id != null }">
				<stc:role ifAnyGranted="ROLE_AUDIT">
					######
					<input name="model.contact" id="model.contact" type="hidden" value="${model.contact }" size="15" maxlength="50">
				</stc:role>
				<stc:role ifNotGranted="ROLE_AUDIT">
					<input name="model.contact" id="model.contact" value="${model.contact }" size="15" maxlength="50">
				</stc:role>
			</c:if>
			
			<c:if test="${model.id == null }">
				<input name="model.contact" id="model.contact" value="${model.contact }" size="15" maxlength="50">
			</c:if>
	  	</td>
	  	<td align="right" width="100" bgcolor="#EBEBEB">外语程度：</td>
		<td bgcolor="#EBEBEB" width="200">
			<input name="model.enDegree" value="${model.enDegree }" size="15" maxlength="50">
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="100">海外购房：</td>
		<td bgcolor="#EBEBEB">
			<select name="model.buyHouse" id="model.buyHouse" style="margin: 0px; width: 100px">
				<option value="">--请选择--</option>
				<option ${model.buyHouse=="美国"?"selected":"" } value="美国">美国</option>
				<option ${model.buyHouse=="加拿大"?"selected":"" } value="加拿大">加拿大</option>
				<option ${model.buyHouse=="澳大利亚"?"selected":"" } value="澳大利亚">澳大利亚</option>
				<option ${model.buyHouse=="新西兰"?"selected":"" } value="新西兰">新西兰</option>
				<option ${model.buyHouse=="英国"?"selected":"" } value="英国">英国</option>
				<option ${model.buyHouse=="香港"?"selected":"" } value="香港">香港</option>
				<option ${model.buyHouse=="其他"?"selected":"" } value="其他">其他</option>
			</select>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">海外投资：</td>
		<td bgcolor="#EBEBEB" width="150">
			<select name="model.abroadInvest" id="model.abroadInvest" style="margin: 0px; width: 100px">
				<option value="">--请选择--</option>
				<option ${model.abroadInvest=="美国"?"selected":"" } value="美国">美国</option>
				<option ${model.abroadInvest=="加拿大"?"selected":"" } value="加拿大">加拿大</option>
				<option ${model.abroadInvest=="澳大利亚"?"selected":"" } value="澳大利亚">澳大利亚</option>
				<option ${model.abroadInvest=="新西兰"?"selected":"" } value="新西兰">新西兰</option>
				<option ${model.abroadInvest=="英国"?"selected":"" } value="英国">英国</option>
				<option ${model.abroadInvest=="香港"?"selected":"" } value="香港">香港</option>
				<option ${model.abroadInvest=="其他"?"selected":"" } value="其他">其他</option>
			</select>
	  	</td>
	  	<td align="right" width="100" bgcolor="#EBEBEB">短期考察：</td>
		<td bgcolor="#EBEBEB" width="200">
			<select name="model.inspect" id="model.inspect" style="margin: 0px; width: 100px">
				<option value="">--请选择--</option>
				<option ${model.inspect=="美国"?"selected":"" } value="美国">美国</option>
				<option ${model.inspect=="加拿大"?"selected":"" } value="加拿大">加拿大</option>
				<option ${model.inspect=="澳大利亚"?"selected":"" } value="澳大利亚">澳大利亚</option>
				<option ${model.inspect=="新西兰"?"selected":"" } value="新西兰">新西兰</option>
				<option ${model.inspect=="欧洲"?"selected":"" } value="欧洲">欧洲</option>
				<option ${model.inspect=="其他"?"selected":"" } value="其他">其他</option>
			</select>
	  	</td>
    </tr>
	<tr>
	  	<td align="right" width="100" bgcolor="#EBEBEB">年龄：</td>
		<td bgcolor="#EBEBEB" width="200">
			<input name="model.age" value="${model.age}"  style="width: 100px" maxlength="4">
	  	</td>
	  	<td align="right" width="100" bgcolor="#EBEBEB">移民类型：</td>
		<td bgcolor="#EBEBEB" width="200">
			<select name="model.ymType" id="model.ymType" style="margin: 0px; width: 100px">
				<option value="">--请选择--</option>
				<option ${model.ymType=="技术移民"?"selected":"" } value="技术移民">技术移民</option>
				<option ${model.ymType=="雇主担保"?"selected":"" } value="雇主担保">雇主担保</option>
				<option ${model.ymType=="投资移民"?"selected":"" } value="投资移民">投资移民</option>
				<option ${model.ymType=="家属团聚"?"selected":"" } value="家属团聚">家属团聚</option>
				<option ${model.ymType=="购房移民"?"selected":"" } value="购房移民">购房移民</option>
				<option ${model.ymType=="其他"?"selected":"" } value="其他">其他</option>
			</select>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">有无拒签史：</td>
		<td bgcolor="#EBEBEB" width="150">
			<select name="model.isHasRefuser" style="margin: 0px; width: 100px">
				<option value="0" ${model.isHasRefuser=='0'?"selected":"" }>无</option>
				<option value="1" ${model.isHasRefuser=='1'?"selected":"" }>有</option>
			</select>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" style="width:90px">婚否：</td>
		<td bgcolor="#EBEBEB" style="width:150px">
			<select name="model.isMerried">
				<option ${model.isMerried=="0"?"selected":"" } value="0">否</option>
				<option ${model.isMerried=="1"?"selected":"" } value="1">是</option>
			</select>
	  	</td>
	  	<td align="right" width="100" bgcolor="#EBEBEB"><font color="red">签约情况：</font></td>
		<td bgcolor="#EBEBEB" width="200">
			<select name="model.signStatus" id="model.signStatus" onchange="changeStuType(this)">
				<option ${model.signStatus=="0"?"selected":"" } value="0">否</option>
				<option ${model.signStatus=="1"?"selected":"" } value="1">是</option>
			</select>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100"><font color="red">介绍给语言：</font></td>
		<td bgcolor="#EBEBEB">
			<input name="model.introToIELTS" id="model.introToIELTS" value="${model.introToIELTS}" size="15" maxlength="50">
	  	</td>
    </tr>
    <tr>
    	<td align="right" bgcolor="#EBEBEB" style="width:90px">性别：</td>
	  	<td bgcolor="#EBEBEB" style="width:150px" colspan="5">
			<select name="model.sex">
				<option ${model.sex=="1"?"selected":"" } value="1">男</option>
				<option ${model.sex=="0"?"selected":"" } value="0">女</option>
			</select>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" style="width:90px">信息备注：</td>
		<td bgcolor="#EBEBEB" colspan="5">
			<textarea style="width:400px; height: 40px" name="model.infoDesc">${model.infoDesc }</textarea>
	  	</td>
    </tr>
    
</table>
</fieldset>

<fieldset style="margin:8px;">
    <legend>客户跟踪记录</legend>
	<table align="left" bgcolor="#FFFFFF" width="800" cellpadding="2" cellspacing="1">
		<tr>
			<td align="right" bgcolor="#EBEBEB" width="100">最新跟踪时间：</td>
			<td bgcolor="#EBEBEB">
				<input type="text" name="model.recentTraceTime" size="12" id="model.recentTraceTime" 
							class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})"
								value='<s:date name="model.recentTraceTime" format="yyyy-MM-dd"/>'/>
		  	</td>
		</tr>
		<tr>
		  	<td align="right" width="100" bgcolor="#EBEBEB">客户跟踪记录：</td>
			<td bgcolor="#EBEBEB" colspan="5">
				<textarea style="width:400px; height: 60px" name="model.traceDesc" id="model.traceDesc">${model.traceDesc }</textarea>
		  	</td>
	    </tr>
	</table>
</fieldset>
	