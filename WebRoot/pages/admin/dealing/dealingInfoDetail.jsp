<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<fieldset style="margin:10px;">
<legend>学生基本情况</legend>
<table style="width:900px">
	<tr>
		<td align="right">姓名<br>(例：邢璐、邢明月(邢璐父亲))：</td>
		<td align="left" width="200">
			<input name="model.name" id="modelName" title="(例：邢璐、邢明月(邢璐父亲))" value="${model.name}" style="width: 100px"> 
		</td>
		<td align="right">所去国家：</td>
		<td align="left">
			<select id="modelToCountry" name="model.toCountry" style="width: 100px;margin: 0">
			</select>
		</td>
		<td align="right">客户类型：</td>
		<td align="left">
			<input type="text" id="modelClientType" name="model.clientType" style="width: 100px" value="${model.clientType }">
		</td>
	</tr>
	<tr>
		<td align="right">申请类型：</td>
		<td align="left">
			<input type="text" name="model.applyType" id="modelApplyType" style="width: 100px" value="${model.applyType }"/>
		</td>
		<td align="right">被访问者关系类型：</td>
		<td align="left">
			<input type="text" name="model.interviewType" id="modelInterviewType" style="width: 100px" value="${model.interviewType }"/>
		</td>
		<td align="right">客户类别：</td>
		<td align="left">
			<input type="text" id="modelClientClass" name="model.clientClass" style="width: 100px" value="${model.clientClass }">
		</td>
	</tr>
	<tr>
		<td align="right">语言入读时间：</td>
		<td align="left">
			<input type="text" name="model.readTime" style="width: 100px" id="modelReadTime"  
				class="Wdate naDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
					value='<s:date name="model.readTime" format="yyyy-MM-dd"/>'/>
			<input type="checkbox" id="isReadTime" class="na">无		
		</td>
		<td align="right">正课入读时间：</td>
		<td align="left">
			<input type="text" name="model.zhengReadTime" style="width: 100px" id="modelZhengReadTime"  
				class="Wdate naDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
					value='<s:date name="model.zhengReadTime" format="yyyy-MM-dd"/>'/>
			<input type="checkbox" id="isZhengReadTime" class="na">无
		</td>
		<td align="right">合&nbsp;作&nbsp;方：</td>
		<td align="left">
			<input type="text" id="modelPartner" name="model.partner" value="${model.partner }" style="width: 100px">
		</td>
	</tr>
	<tr>
		<td align="right">入读学校(中文)：</td>
		<td align="left">
			<input type="text" name="model.readSchoolZH" id="modelReadSchoolZH" value="${model.readSchoolZH}" style="width: 100px">
		</td>
		<td align="right">入读专业(中文)：</td>
		<td align="left">
			<input type="text" name="model.majorZH" id="modelMajorZH" value="${model.majorZH}" style="width: 100px">
		</td>
		<td align="right">签约时间：</td>
		<td align="left">
			<input type="text" name="model.signTime" style="width: 100px" id="modelSignTime"  
				class="Wdate naDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
					value='<s:date name="model.signTime" format="yyyy-MM-dd"/>'/>
			<input type="checkbox" id="isSignTime" class="na">无
		</td>
	</tr>
	<tr>
		<td align="right">入读学校(英文)：</td>
		<td align="left">
			<input type="text" name="model.readSchoolEN" id="modelReadSchoolEN" value="${model.readSchoolEN}" style="width: 100px">
		</td>
		<td align="right">入读专业(英文)：</td>
		<td align="left">
			<input type="text" name="model.majorEN" id="modelMajorEN" value="${model.majorEN}" style="width: 100px">
			</td>
		<td align="right">转案时间：</td>
		<td align="left">
			<input type="text" name="model.transferTime" style="width: 100px" id="modelTransferTime"  
				class="Wdate naDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
					value='<s:date name="model.transferTime" format="yyyy-MM-dd"/>'/>
			<input type="checkbox" id="isTransferTime" class="na">无
		</td>	
	</tr>
</table>
</fieldset>

<fieldset style="margin:10px;">
	<legend>学生申请背景</legend>
	<table id="stuApplyBg">
		<tr>
			<td align="right" width="210">出国前毕业/在读院校及学生阶段(中文) <br>(例：河北农业大学大二在读)：</td>
			<td align="left">
				<input type="text" id="modelBeforeSchool" name="model.beforeSchool" value="${model.beforeSchool }">
		</td>
		<td align="right">出国前专业名称(中文)：</td>
		<td align="left">
			<input type="text" name="model.beforeMajor" id="modelBeforeMajor" value="${model.beforeMajor}" >
		</td>
		<td align="right">GPA：</td>
		<td align="left">
			<input type="text" name="model.GPA"  id="modelGPA" value="${model.GPA}">
		</td>
	</tr>
	<tr>
		<td align="right">TOEFL/IELTS：</td>
		<td align="left">
			<input type="text" name="model.TOEFLORIELTS" id="modelTOEFLORIELTS" value="${model.TOEFLORIELTS}">
		</td>
		<td align="right">GRE/GMAT：</td>
		<td align="left">
			<input type="text" name="model.GREORGMAT" id="modelGREORGMAT" value="${model.GREORGMAT}">
		</td>
		<td align="right">SAT/ACT：</td>
		<td align="left">
			<input type="text" name="model.SATORACT" id="modelSATORACT" value="${model.SATORACT}">
		</td>
	</tr>
	<tr>
		<td align="right">SLEP：</td>
		<td align="left">
			<input type="text" name="model.SLEP" id="modelSLEP" value="${model.SLEP}">
		</td>
		<td align="right">断档期：</td>
		<td align="left">
			<input type="text" name="model.interruptDate" id="modelInterruptDate" value="${model.interruptDate}">
		</td>
		<td align="right" >相关实习经历：</td>
		<td align="left">
			<input type="text" name="model.praticeExperience" id="modelPraticeExperience" value="${model.praticeExperience}" >
		</td>
	</tr>
	<tr>
		<td align="right">工作经历：</td>
		<td align="left">
			<input type="text" name="model.workExperience" id="modelWorkExperience" value="${model.workExperience}" >
		</td>
		<td align="right">国家级奖励：</td>
		<td align="left">
			<input type="text" name="model.nationalAwards" id="modelNationalAwards"  value="${model.nationalAwards}" >
		</td>
		<td align="right">发明专利或论文：</td>
		<td align="left">
			<input type="text" name="model.patentOrThesis" id="modelPatentOrThesis" value="${model.patentOrThesis}" >
		</td>
	</tr>
	<tr>
		<td align="right">其他申请优势/要点(简述)：</td>
		<td align="left" colspan="5">
			<textarea type="text" id="modelAdvantage" name="model.advantage" style="height: 50px;width: 100%;margin: 0">${model.advantage}</textarea>
			</td>
		</tr>
	</table>
</fieldset>
<fieldset style="margin:10px;">
	<legend>学生签证情况</legend>
	<table style="width:900px">
		<tr>
			<td align="right" width="120">签证学校（中文）：</td>
				<td align="left">
					<input type="text" id="modelVisaSchool" name="model.visaSchool" value="${model.visaSchool }">
			</td>
			<td align="right" width="100">签证担保人：</td>
			<td align="left">
				<input type="text" style="width: 100%" name="model.visaSurety" id="modelVisaSurety" value="${model.visaSurety }">
			</td>
			<td align="right" width="110">担保金总额：</td>
			<td align="left">
				<input type="text" name="model.suretyMoney" id="modelSuretyMoney" value="${model.suretyMoney}" > 
			</td>
		</tr>
		<tr>
			<td align="right" width="120">签证递交时间：</td>
			<td align="left">
				<input type="text" name="model.signSendTime" style="width: 100px" id="modelSignSendTime"  
					class="Wdate naDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" value='<s:date name="model.signSendTime" format="yyyy-MM-dd"/>'/>
			</td>
			<td align="right" width="100">是否获签：</td>
			<td align="left">
				<input type="text" style="width: 100%" name="model.isSigned" id="modelIsSigned" value="${model.isSigned }">
			</td>
			<td align="right">签证获签时间：</td>
			<td align="left">
				<input type="text" name="model.visaTime" style="width: 100px" id="modelVisaTime"  
					class="Wdate naDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" value='<s:date name="model.visaTime" format="yyyy-MM-dd"/>'/>
			</td>
		</tr>
		<tr>
			<td align="right">资金情况简述：</td>
			<td align="left" colspan="4">
				<textarea name="model.moneySituation" id="modelMoneySituation" cols="70" rows="4" style="margin: 0">${model.moneySituation}</textarea>
				<textarea id="tmpMoneySituation" style="display: none;">${model.moneySituation}</textarea>
			</td>
			<td align="left" >
			（工薪阶层/ 企业法人/企业股东/个体/职位、年薪、每笔资金来源描述、其他要点、真实情况对比）<br>
			（例：父亲：工薪阶层，人事部经理，年薪11万，母亲：企业法人，年薪30万。担保金20万转自河北银行理财，30万转自光大银行理财，家庭真实情况）
			</td>
		</tr>
		<tr>
			<td align="right">备注：</td>
			<td align="left" colspan="4">
				<textarea name="model.remark" id="modelRemark" cols=70" rows="2" style="margin: 0">${model.remark}</textarea> 
			</td>
			<td>
				(未提及的其他要点)
			</td>
		</tr>
		<tr>
			<td align="right">顾问：</td>
			<td align="left">
				<select name="model.advisor" id="modelAdvisor" style="margin: 0">
				</select>
			</td>
			<td align="right">文案：</td>
			<td align="left" colspan="3">
				<select name="model.copyWriter" id="modelCopyWriter" style="margin: 0">
				</select>
			</td>
		</tr>
	</table>
</fieldset>
<fieldset style="margin:10px;">
	<legend>操作进度跟进</legend>
	<table style="width:900px">
		<tr>
			<td align="right" width="120">风险评估：</td>
			<td align="left" width="120">
				<input type="text" id="modelRiskEval" name="model.riskEval" style="width: 100px" value="${model.riskEval}"> 
		</td>
		<td align="right" width="120">风险说明及建议措施：</td>
		<td align="left">
			<input type="text" id="modelriskDescn" name="model.riskDescn" style="width: 505px" value="${model.riskDescn}"> 
		</td>
	</tr>
	<tr>
		<td align="right" width="120">操作进度记录：</td>
		<td align="left" colspan="3">
			<textarea name="model.processLog" id="modelProcessLog" cols=120" rows="2" style="margin: 0">${model.processLog}</textarea> 
			</td>
		</tr>
	</table>
</fieldset>