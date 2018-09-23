<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
</head>
<body>
<div class="x-panel">
  <div class="x-panel-header">员工考核表</div>
    <div class="x-toolbar">
	  <table width="100%">	      
		<tr>	         
		  <td align="right">
          </td>
        </tr>
      </table>
    </div>
<table width="100%" border="0" cellpadding="5" cellspacing="1">
	<tr>
		<td><%@ include file="/common/messages.jsp"%></td>
	</tr>
</table>
<div class="x-panel-body">
<table width="99%" align="center"><tr><td align="center">
<s:form action="saveAssessTable" validate="true" theme="simple">
	<s:hidden name="model.id"/>
	<fieldset style="margin:10px;">
	<legend>员工考核表</legend>
	<table width="99%" align="center" bgcolor="#FFFFFF" border="1" style="border-collapse: collapse" cellpadding="2" cellspacing="1">
		<tr>            
		  	<th align="center"  bgcolor="#EBEBEB" rowspan="2">日期</th>
			<th align="center" bgcolor="#EBEBEB" >考核项</th>
			<th align="center" bgcolor="#EBEBEB" >新客户录入</th>
			<th align="center" bgcolor="#EBEBEB" >市场推广任务</th>
			<th align="center" bgcolor="#EBEBEB" >新客户回复</th>
			<th align="center" bgcolor="#EBEBEB" >跟踪电话数量</th>
			<th align="center" bgcolor="#EBEBEB" >遗漏的回访</th>
			<th align="center" bgcolor="#EBEBEB" >推广项目总结</th>
			<th align="center" bgcolor="#EBEBEB" >材料清单</th>
			<th align="center" bgcolor="#EBEBEB" >费用清单</th>
			<th align="center" bgcolor="#EBEBEB" >档案管理</th>
			<th align="center" bgcolor="#EBEBEB" >数据库签约信息</th>
			<th align="center" bgcolor="#EBEBEB" >考勤变更登记</th>
			<th align="center" bgcolor="#EBEBEB" >工作内容</th>
			<th align="center" bgcolor="#EBEBEB" >工装工牌</th>
			<th align="center" bgcolor="#EBEBEB" >周报表和周计划</th>
			<th align="center" bgcolor="#EBEBEB"  height="30">工作计划完成</th>
	    </tr>
	    <tr>
			<th align="center" bgcolor="#EBEBEB" >考核描述</th>
			<th align="center" bgcolor="#EBEBEB" >当天新客户的录入</th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" >两天一个项目</th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB" ></th>
			<th align="center" bgcolor="#EBEBEB"  height="30"></th>
	    </tr>
	<c:forEach items="${assessTables}" var="assessTable">
		<tr>
		  	<td align="center" >
		  		<input type="hidden" name="ids" value="${assessTable.id }">
		  		<input type="hidden" name="assessDates" value="${assessTable.adate }">
		  		<s:date name="#attr.assessTable.adate" format="yyyy-MM-dd"/>
		  	</td>
			<td align="center" ><input type="text" style="width:98%" name="col1s" value="${assessTable.col1 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col2s" value="${assessTable.col2 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col3s" value="${assessTable.col3 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col4s" value="${assessTable.col4 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col5s" value="${assessTable.col5 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col6s" value="${assessTable.col6 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col7s" value="${assessTable.col7 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col8s" value="${assessTable.col8 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col9s" value="${assessTable.col9 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col9s" value="${assessTable.col10 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col9s" value="${assessTable.col11 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col9s" value="${assessTable.col12 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col9s" value="${assessTable.col13 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col9s" value="${assessTable.col14 }"></td>
			<td align="center" ><input type="text" style="width:98%" name="col9s" value="${assessTable.col15 }"></td>
			<td align="center"  height="25"><input type="text" style="width:98%" name="col10s" value="${assessTable.col16 }"></td>
	    </tr>
	</c:forEach>
    </table>
	</fieldset>
	<table width="100%" style="margin-bottom:10px;">
	<tr>
		<td colspan="2" align="center" class="font_white">
		<s:submit value="保存" cssClass="button"></s:submit>&nbsp;&nbsp;
		<input type="button" value="返回" class="button" onclick="history.back()"/>
		</td>
	</tr>
</table>
</s:form>
 </td></tr></table>
        </div></div>
</body>
</html>