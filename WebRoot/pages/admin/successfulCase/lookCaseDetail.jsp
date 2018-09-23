<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("vEnter", "\r\n");
%>
<fieldset style="margin:10px;">
	<legend>学生基本情况</legend>
	<table style="width:900px">
		<tr>
			<td align="right">姓名<br>(例：邢璐、邢明月(邢璐父亲))：</td>
			<td align="left" width="200">
				${model.name}
			</td>
			<td align="right">所去国家：</td>
			<td align="left">
				${model.toCountry }
			</td>
			<td align="right">客户类型：</td>
			<td align="left">
				${model.clientType }
			</td>
		</tr>
		<tr>
			<td align="right">申请类型：</td>
			<td align="left">
				${model.applyType }
			</td>
			<td align="right">被访问者关系类型：</td>
			<td align="left">
				${model.interviewType }
			</td>
			<td align="right">客户类别：</td>
			<td align="left">
				${model.clientClass }
			</td>
		</tr>
		<tr>
			<td align="right">语言入读时间：</td>
			<td align="left">
				${fn:contains(model.readTime,'9999-12-31')?'无':fn:split(model.readTime,' ')[0] }
			</td>
			<td align="right">正课入读时间：</td>
			<td align="left">
				${fn:contains(model.zhengReadTime,'9999-12-31')?'无':fn:split(model.zhengReadTime,' ')[0] }
			</td>
			<td align="right">合&nbsp;作&nbsp;方：</td>
			<td align="left">
				${model.partner }
			</td>
		</tr>
		<tr>
			<td align="right">入读学校(中文)：</td>
			<td align="left">
				${model.readSchoolZH}
			</td>
			<td align="right">入读专业(中文)：</td>
			<td align="left">
				${model.majorZH}
			</td>
			<td align="right">签约时间：</td>
			<td align="left">
				<s:date name="model.signTime" format="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<td align="right">入读学校(英文)：</td>
			<td align="left">
				${model.readSchoolEN}
			</td>
			<td align="right">入读专业(英文)：</td>
			<td align="left">
				${model.majorEN}
			</td>
			<td align="right">转案时间：</td>
			<td align="left">
				<s:date name="model.transferTime" format="yyyy-MM-dd"/>
			</td>
		</tr>
	</table>
</fieldset>

<fieldset style="margin:10px;">
	<legend>学生申请背景</legend>
	<table style="width:900px">
		<tr>
			<td align="right" width="210">出国前毕业/在读院校及学生阶段(中文) <br>(例：河北农业大学大二在读)：</td>
			<td align="left">
				${model.beforeSchool }
			</td>
			<td align="right">出国前专业名称(中文)：</td>
			<td align="left">
				${model.beforeMajor}
			</td>
			<td align="right">GPA：</td>
			<td align="left">
				${model.GPA}
			</td>
		</tr>
		<tr>
			<td align="right">TOEFL/IELTS：</td>
			<td align="left">
				${model.TOEFLORIELTS}
			</td>
			<td align="right">GRE/GMAT：</td>
			<td align="left">
				${model.GREORGMAT}
			</td>
			<td align="right">SAT/ACT：</td>
			<td align="left">
				${model.SATORACT}
			</td>
		</tr>
		<tr>
			<td align="right">SLEP：</td>
			<td align="left">
				${model.SLEP}
			</td>
			<td align="right">断档期：</td>
			<td align="left">
				${model.interruptDate}
			</td>
			<td align="right" >相关实习经历：</td>
			<td align="left">
				${model.praticeExperience}
			</td>
		</tr>
		<tr>
			<td align="right">工作经历：</td>
			<td align="left">
				${model.workExperience}
			</td>
			<td align="right">国家级奖励：</td>
			<td align="left">
				${model.nationalAwards}
			</td>
			<td align="right">发明专利或论文：</td>
			<td align="left">
				${model.patentOrThesis}
			</td>
		</tr>
		<tr>
			<td align="right">其他申请优势/要点(简述)：</td>
			<td align="left" colspan="5">
				${fn:replace(model.advantage, vEnter, '<br>')}
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
				${model.visaSchool }
			</td>
			<td align="right" width="100">签证担保人：</td>
			<td align="left">
				${model.visaSurety }
			</td>
			<td align="right" width="110">担保金总额：</td>
			<td align="left">
				${model.suretyMoney}
			</td>
		</tr>
		<tr>
			<td align="right" width="120">签证递交时间：</td>
			<td align="left">
				<s:date name="model.signSendTime" format="yyyy-MM-dd"/>
			</td>
			<td align="right" width="100">是否获签：</td>
			<td align="left">
				${model.isSigned }
			</td>
			<td align="right">签证获签时间：</td>
			<td align="left">
				<s:date name="model.visaTime" format="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<td align="right">资金情况简述：</td>
			<td align="left" colspan="5">
				${fn:replace(model.moneySituation, vEnter, '<br>')}
			</td>
		</tr>
		<tr>
			<td align="right">备注：</td>
			<td align="left" colspan="5">
				${fn:replace(model.remark, vEnter, '<br>')}
			</td>
		</tr>
		<tr>
			<td align="right">顾问：</td>
			<td align="left">
				${model.advisor}
			</td>
			<td align="right">文案：</td>
			<td align="left" colspan="3">
				${model.copyWriter}
			</td>
		</tr>
	</table>
</fieldset>