<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table width="100%" align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
		<td bgcolor="#EBEBEB" align="right" width="120">学校申请文案：</td>
		<td bgcolor="#EBEBEB">
			<select name="model.schoolApplyDoc">
				<option value="">--请选择--</option>
				<c:forEach items="${docEmps}" var="emp">
					<option ${model.schoolApplyDoc==emp.name?"selected":"" } value="${emp.name }">${emp.name }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<fieldset style="margin:8px;">
      <legend>申请准备</legend>
<table align="left" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
	  	<td align="right" bgcolor="#EBEBEB" width="100">在读证明（中）</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.studyingCertificate_cn" ${model.studyingCertificate_cn=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">学位证书（中）</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.degreeCard_cn" ${model.degreeCard_cn=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">学校申请照片</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.schoolApplyPhoto" ${model.schoolApplyPhoto=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">存款证明</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.fundProve" ${model.fundProve=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">推荐信</td>
		<td bgcolor="#EBEBEB">
			<input type="checkbox" value="1" name="model.recommendation" ${model.recommendation=="1"?"checked":"" }>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="100">在读证明（英）</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.studyingCertificate_en" ${model.studyingCertificate_en=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">学位证书（英）</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.degreeCard_en" ${model.degreeCard_en=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">个人陈述</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.selfDesc" ${model.selfDesc=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">出生公证</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.birthProve" ${model.birthProve=="1"?"checked":"" }>
	  	</td>
	  	<td align="left" bgcolor="#EBEBEB" colspan="2" rowspan="3">
	  		其他申请学校材料：<br>
	  		<textarea name="model.otherApplySchoolDetails" style="width:150px;height:60px">${model.otherApplySchoolDetails }</textarea>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="100">成绩单（中）</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.reportCard_cn" ${model.reportCard_cn=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">毕业证（中）</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.diploma_cn" ${model.diploma_cn=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">外语成绩</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.foreignAchievement" ${model.foreignAchievement=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">信纸</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.letterPaper" ${model.letterPaper=="1"?"checked":"" }>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" width="100">成绩单（英）</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.reportCard_en" ${model.reportCard_en=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">毕业证（英）</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.diploma_en" ${model.diploma_en=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">获奖证书</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.encourageCard" ${model.encourageCard=="1"?"checked":"" }>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">信封</td>
		<td bgcolor="#EBEBEB" width="20">
			<input type="checkbox" value="1" name="model.envelope" ${model.envelope=="1"?"checked":"" }>
	  	</td>
    </tr>
</table>
</fieldset>

<fieldset style="margin:8px;">
      <legend>申请情况</legend>
<table align="left" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
		<td width="100" bgcolor="#EBEBEB" align="right">学校名称：</td>
		<td colspan="5" bgcolor="#EBEBEB">
			<input name="model.schoolName" size="60" maxlength="250" value="${model.schoolName }">
		</td>
	</tr>
	<tr>
		<td bgcolor="#EBEBEB" align="right">申请专业：</td>
		<td colspan="5" bgcolor="#EBEBEB">
			<input name="model.applySpeciality" size="60" maxlength="250" value="${model.applySpeciality }">
		</td>
	</tr>
	<tr>
		<td bgcolor="#EBEBEB" align="right">入学时间：</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.inSchoolTime" size="12" id="model.inSchoolTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.inSchoolTime" format="yyyy-MM-dd"/>'/>
		</td>
		<td width="120" bgcolor="#EBEBEB" align="right">通知书收到时间：</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.noticeReceTime" size="12" id="model.noticeReceTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.noticeReceTime" format="yyyy-MM-dd"/>'/>
		</td>
		<td width="100" align="right" bgcolor="#EBEBEB">提交市场部：</td>
		<td bgcolor="#EBEBEB" width="120">
			<select name="model.isNoticeSubMarket">
				<option value="">--请选择--</option>
				<option ${model.isNoticeSubMarket=="1"?"selected":"" } value="1">是</option>
				<option ${model.isNoticeSubMarket=="0"?"selected":"" } value="0">否</option>
			</select>
		</td>
	</tr>
	<tr>
		<td bgcolor="#EBEBEB" align="right">材料寄出时间：</td>
		<td bgcolor="#EBEBEB">
			<input type="text" name="model.docSendTime" size="12" id="model.docSendTime" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value='<s:date name="model.docSendTime" format="yyyy-MM-dd"/>'/>
		</td>
		<td width="120" bgcolor="#EBEBEB" align="right">奖学金状况：</td>
		<td bgcolor="#EBEBEB" colspan="3">
			<input type="text" name="model.bursaryStatus" size="12" maxlength="200" id="model.bursaryStatus" value="${model.bursaryStatus }"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#EBEBEB" align="right">学校申请备注：</td>
		<td colspan="5" bgcolor="#EBEBEB">
			<textarea name="model.schoolApplyDesc" style="width:98%; height:60px">${model.schoolApplyDesc }</textarea>
		</td>
	</tr>
</table>
</fieldset>
