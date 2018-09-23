<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<fieldset style="margin:8px;">
      <legend>学生信息</legend>
<table  align="left" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
	<tr>
	  	<td align="right" style="width:90px; text-align: right" bgcolor="#EBEBEB">当前进度：</td>
		<td bgcolor="#EBEBEB" style="width:150px">
			${model.currentPlan }
	  	</td>
		<td align="right" bgcolor="#EBEBEB" width="100">下次回访日期：</td>
		<td bgcolor="#EBEBEB" width="150">
			<s:date name="model.nextVisitTime" format="yyyy-MM-dd"/>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">状态定义日期：</td>
		<td bgcolor="#EBEBEB">
			<s:date name="model.statusDefineTime" format="yyyy-MM-dd"/>
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" style="width:90px">出生年月：</td>
		<td bgcolor="#EBEBEB" style="width:150px">
			<s:date name="model.birthday" format="yyyy-MM-dd"/>
	  	</td>
		<td align="right" bgcolor="#EBEBEB" width="100">毕业时间：</td>
		<td bgcolor="#EBEBEB">
			<s:date name="model.finishTime" format="yyyy-MM-dd"/>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">学生分类：</td>
		<td bgcolor="#EBEBEB">
			${model.stuType }
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" style="width:90px">文化程度：</td>
		<td bgcolor="#EBEBEB" style="width:150px">
			${model.education }
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">毕业院校：</td>
		<td bgcolor="#EBEBEB">
			${model.finishSchool }
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">所学专业：</td>
		<td bgcolor="#EBEBEB">
			${model.speciality }
	  	</td>
    </tr>
    <tr>
    	<td align="right" bgcolor="#EBEBEB" style="width:90px">目标学历：</td>
		<td bgcolor="#EBEBEB" style="width:150px">
			${model.hopeDegree }
	  	</td>
	  	
	  	<td align="right" bgcolor="#EBEBEB" width="100">在读院校：</td>
		<td bgcolor="#EBEBEB" width="150">
			${model.currentSchool }
	  	</td>
	  	<td align="right" width="100" bgcolor="#EBEBEB">高&nbsp;考&nbsp;分：</td>
		<td bgcolor="#EBEBEB" width="200">
			${model.collegeScore}
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" style="width:90px">资金情况：</td>
		<td bgcolor="#EBEBEB" style="width:150px">
			${model.finances }
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">联系方式：</td>
		<td bgcolor="#EBEBEB" width="150">
			<stc:role ifAnyGranted="ROLE_AUDIT,ROLE_SEARCH">
				######
			</stc:role>
			<stc:role ifNotGranted="ROLE_AUDIT,ROLE_SEARCH">
				${model.contact }
			</stc:role>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">在读年级：</td>
	  	<td bgcolor="#EBEBEB">
			${model.currentGrade }
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" style="width:90px">婚否：</td>
		<td bgcolor="#EBEBEB" style="width:150px">
			<c:if test="${model.isMerried=='0' }">
				否
			</c:if>
			<c:if test="${model.isMerried=='1' }">
				是
			</c:if>
	  	</td>
		<td align="right" width="100" bgcolor="#EBEBEB">外语程度：</td>
		<td bgcolor="#EBEBEB" width="200">
			${model.enDegree }
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100">有无拒签史：</td>
		<td bgcolor="#EBEBEB" width="150">
			<c:if test="${model.isHasRefuser=='0' }">
				无
			</c:if>
			<c:if test="${model.isHasRefuser=='1' }">
				有
			</c:if>
	  	</td>
    </tr>
    <tr>
    	<td align="right" bgcolor="#EBEBEB" style="width:90px">性别：</td>
	  	<td bgcolor="#EBEBEB" style="width:150px">
			<c:if test="${model.sex=='0' }">
				女
			</c:if>
			<c:if test="${model.sex=='1' }">
				男
			</c:if>
	  	</td>
	  	<td align="right" width="100" bgcolor="#EBEBEB"><font color="red">签约情况：</font></td>
		<td bgcolor="#EBEBEB" width="200">
			<c:if test="${model.signStatus=='0' }">
				否
			</c:if>
			<c:if test="${model.signStatus=='1' }">
				是
			</c:if>
	  	</td>
	  	<td align="right" bgcolor="#EBEBEB" width="100"><font color="red">介绍给机构：</font></td>
		<td bgcolor="#EBEBEB">
			${model.introToIELTS}
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" style="width:90px">微信/QQ：</td>
		<td bgcolor="#EBEBEB" colspan="5">
			${model.qq }
	  	</td>
    </tr>
    <tr>
	  	<td align="right" bgcolor="#EBEBEB" style="width:90px">信息备注：</td>
		<td bgcolor="#EBEBEB" colspan="5">
			${model.infoDesc }
	  	</td>
    </tr>
    
</table>
</fieldset>

<fieldset style="margin:8px;">
    <legend>客户跟踪记录</legend>
	<table align="left" width="750" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1">
		<tr>
			<td align="right" bgcolor="#EBEBEB" width="100">最新跟踪时间：</td>
			<td bgcolor="#EBEBEB">
				<s:date name="model.recentTraceTime" format="yyyy-MM-dd"/>
		  	</td>
		</tr>
		<tr>
		  	<td align="right" width="100" bgcolor="#EBEBEB">客户跟踪记录：</td>
			<td bgcolor="#EBEBEB" colspan="5">
				${model.traceDesc }
		  	</td>
	    </tr>
	</table>
</fieldset>
	