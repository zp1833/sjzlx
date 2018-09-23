<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
<!--
	function inputCountry(obj) {
		if(obj.value == '0') {
			document.getElementById("otherCountry").style.display = "";
		} else {
			document.getElementById("otherCountry").style.display = "none";
		}
	}
//-->
</script>
<table width="100%" align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
	  	<td align="right" width="100" bgcolor="#EBEBEB">咨询日期：</td>
		<td bgcolor="#EBEBEB" width="200">
			<input type="text" name="model.advDate" style="width:90px" id="model.advDate" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.advDate" format="yyyy-MM-dd"/>'/>
	  	</td>
		<td align="right" bgcolor="#EBEBEB" width="100">客户姓名：</td>
		<td bgcolor="#EBEBEB">
			<stc:role ifNotGranted="ROLE_ADV">
				<input maxlength="50" style="width:90px" name="model.stuName" id="model.stuName" value="${model.stuName }">
			</stc:role>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB">负责顾问：</td>
		<td bgcolor="#EBEBEB">
			<stc:role ifNotGranted="ROLE_ADV">
				<select name="model.advisor" id="model.advisor">
					<option value="">--请选择--</option>
					<c:forEach items="${advEmps}" var="emp">
						<option ${model.advisor==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
					</c:forEach>
				</select>
			</stc:role>
	  	</td>
		<td align="right" bgcolor="#EBEBEB">咨询国家：</td>
		<td bgcolor="#EBEBEB">
			<stc:role ifNotGranted="ROLE_ADV">
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
			</stc:role>
	  	</td>
    </tr>
	<tr>
	  	<td align="right" bgcolor="#EBEBEB">信息来源：</td>
		<td bgcolor="#EBEBEB">
			<select name="model.source" id="model.source">
				<option value="">--请选择--</option>
				<option ${model.source=='网络搜索'?"selected":"" } value="网络搜索">网络搜索</option>
				<option ${model.source=='网代介绍'?"selected":"" } value="网代介绍">网代介绍</option>
				<option ${model.source=='朋友介绍'?"selected":"" } value="朋友介绍">朋友介绍</option>
				<option ${model.source=='内部转介'?"selected":"" } value="内部转介">内部转介</option>
				<option ${model.source=='报纸广告'?"selected":"" } value="报纸广告">报纸广告</option>
				<option ${model.source=='展会活动'?"selected":"" } value="展会活动">展会活动</option>
				<option ${model.source=='地推传单'?"selected":"" } value="地推传单">地推传单</option>
				<option ${model.source=='在线客服'?"selected":"" } value="在线客服">在线客服</option>
				<option ${model.source=='渠道合作'?"selected":"" } value="渠道合作">渠道合作</option>
				<option ${model.source=='室外广告'?"selected":"" } value="室外广告">室外广告</option>
				<option ${model.source=='校园宣传'?"selected":"" } value="校园宣传">校园宣传</option>
				<option ${model.source=='其他'?"selected":"" } value="其他">其他</option>
			</select>
	  	</td>
		<td align="right" bgcolor="#EBEBEB">来源明细：</td>
		<td bgcolor="#EBEBEB">
			<input name="model.sourceFrom" value="${model.sourceFrom }" style="width:90px" maxlength="50">
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB">咨询形式：</td>
		<td bgcolor="#EBEBEB">
			<select name="model.advType" id="model.advType">
				<option value="">--请选择--</option>
				<option ${model.advType=='网络'?"selected":"" } value="网络">网络</option>
				<option ${model.advType=='电话'?"selected":"" } value="电话">电话</option>
				<option ${model.advType=='面访'?"selected":"" } value="面访">面访</option>
			</select>
	  	</td>
		<td align="right" bgcolor="#EBEBEB">接待员工：</td>
		<td bgcolor="#EBEBEB">
			<select name="model.recEmp" id="model.recEmp" style="width:88px">
				<option value="">--请选择--</option>
				<c:forEach items="${allEmps}" var="emp">
					<option ${model.recEmp==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
				</c:forEach>
			</select>
	  	</td>
    </tr>
    <stc:role ifAnyGranted="ROLE_REC">
    <tr>
	  	<td align="right" bgcolor="#EBEBEB">下次回访时间：</td>
		<td bgcolor="#EBEBEB" colspan="3">
			<input type="text" name="model.nextVisitTime" size="12" id="model.nextVisitTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-%d'})"
							value='<s:date name="model.nextVisitTime" format="yyyy-MM-dd"/>'/>
	  	</td>
    </tr>
    </stc:role>
</table>
