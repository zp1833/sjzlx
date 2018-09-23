<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<table width="100%" align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
		<td width="100" align="right" bgcolor="#EBEBEB">签证申请文案：</td>
		<td bgcolor="#EBEBEB">
			<select name="model.visaApplyDoc">
				<option value="">--请选择--</option>
				<c:forEach items="${docEmps}" var="emp">
					<option ${model.visaApplyDoc==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
				</c:forEach>
				<c:forEach items="${advEmps}" var="emp">
					<option ${model.visaApplyDoc==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<fieldset style="margin:8px;">
      <legend>申请准备</legend>
<table align="left" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
	  	<td align="right" bgcolor="#EBEBEB" width="120">签证申请表</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.visaApplyTable" ${model.visaApplyTable=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">入学通知书</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.schoolNoticeBook" ${model.schoolNoticeBook=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">学习计划</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.studyPlan" ${model.studyPlan=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="130">护照</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.passport" ${model.passport=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="130">户口本</td>
		<td bgcolor="#EBEBEB">
			<input type="checkbox" value="1" name="model.houseHoldBook" ${model.houseHoldBook=="1"?"checked":"" }>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="120">本人身份证</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.idCard" ${model.idCard=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">家属身份证</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.relationIdCard" ${model.relationIdCard=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">亲属关系证明</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.relativeProve" ${model.relativeProve=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="130">申请人工作背景</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.applierBack" ${model.applierBack=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="130">工作收入证明</td>
		<td bgcolor="#EBEBEB">
			<input type="checkbox" value="1" name="model.incomeProve" ${model.incomeProve=="1"?"checked":"" }>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="120">父母教育背景</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.parentsEduBack" ${model.parentsEduBack=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">无犯罪证明</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.uncrimeProve" ${model.uncrimeProve=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">签证申请照片</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.visaApplyPhoto" ${model.visaApplyPhoto=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">贷款证明</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.loanProve" ${model.loanProve=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="130">存折存单</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.bankbook" ${model.bankbook=="1"?"checked":"" }>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="120">营业执照</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.busLicense" ${model.busLicense=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">税单</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.taxList" ${model.taxList=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="120">房本</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.houseBook" ${model.houseBook=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="130">贷款合同</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.loanAgreement" ${model.loanAgreement=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="130">所贷金额存单复印件</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.loanMoneyHardCopy" ${model.loanMoneyHardCopy=="1"?"checked":"" }>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="100">车本</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.carBook" ${model.carBook=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">体检</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.physicalExam" ${model.physicalExam=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="130">所贷金额存单存款证明</td>
		<td bgcolor="#EBEBEB" width="20" colspan="5">
			<input type="checkbox" value="1" name="model.loanMoneyProve" ${model.loanMoneyProve=="1"?"checked":"" }>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="120">其他申请签证资料：</td>
		<td bgcolor="#EBEBEB" width="20" colspan="9">
			<input type="text" value="${model.otherApplyProveDoc }" size="50" maxlength="200" name="model.otherApplyProveDoc">
	  	</td>
    </tr>
</table>
</fieldset>

<fieldset style="margin:8px;">
      <legend>申请情况</legend>
<table align="left" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
		<td width="100" align="right" bgcolor="#EBEBEB">送签时间：</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.sqTime" size="12" id="model.sqTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.sqTime" format="yyyy-MM-dd"/>'/>
		</td>
		<td width="100" align="right" bgcolor="#EBEBEB">签证结果：</td>
		<td bgcolor="#EBEBEB" width="120">
			<select name="model.visaResult">
				<option value="">--请选择--</option>
				<option ${model.visaResult=="1"?"selected":"" } value="1">已签</option>
				<option ${model.visaResult=="0"?"selected":"" } value="0">拒签</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="100" align="right" bgcolor="#EBEBEB">签证收到时间：</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.visaRecDate" size="12" id="model.visaRecDate" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.visaRecDate" format="yyyy-MM-dd"/>'/>
		</td>
		<td width="100" align="right" bgcolor="#EBEBEB">提交市场部：</td>
		<td bgcolor="#EBEBEB" width="120">
			<select name="model.isSubMarket">
				<option value="">--请选择--</option>
				<option ${model.isSubMarket=="1"?"selected":"" } value="1">是</option>
				<option ${model.isSubMarket=="0"?"selected":"" } value="0">否</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align="right" bgcolor="#EBEBEB">拒签分析：</td>
		<td colspan="3" bgcolor="#EBEBEB">
			<textarea style="width:98%;height: 60px" name="model.refuserAnalysis">${model.refuserAnalysis }</textarea>
		</td>
	</tr>
	<tr>
		<td align="right" bgcolor="#EBEBEB">签证申请备注：</td>
		<td colspan="3" bgcolor="#EBEBEB">
			<textarea style="width:98%;height: 60px" name="model.visaApplyDesc">${model.visaApplyDesc }</textarea>
		</td>
	</tr>
</table>
</fieldset>