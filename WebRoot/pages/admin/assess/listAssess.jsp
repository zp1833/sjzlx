<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<%@include file="/common/meta.jsp" %>
<title></title>
<%@include file="/common/ec.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<%@include file="/common/dwr.jsp" %>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/dwr/interface/AssessManager.js"></script>
<script type="text/javascript">
	function removeAss(id) {
		if(confirm("确认删除相应记录？")) {
			AssessManager.remove(id,function(result) {
				if(result == "1") {
					ECSideUtil.reload("ec");
				} else {
					alert("删除失败，请稍后再试！");
				}
			});
		}
	} 
</script>
</head>
<body>
<div class="x-panel">
  <div class="x-panel-header">员工考核管理</div>
    <div class="x-toolbar">
      <table width="99%">
        <tr>
         <td align="right">
         <stc:role ifAnyGranted="ROLE_ADMIN">
         	<a href="${ctx}/admin/assess/newAssess.do"><img src="${ctx}/images/exticons/add.gif"/>添加</a>
         </stc:role>
         </td>
       </tr>
     </table>
   </div>   

   <div class="x-panel-body">
     <div style="margin-left:-3px;" align="center">
	<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit" 
	filterRowsCallback="limit"
	action="listAssess.do"
	useAjax="true" doPreload="false"
	maxRowsExported="1000" 
	pageSizeList="5,10,20,100" 
	editable="false" 
	sortable="true"	
	rowsDisplayed="5"	
	generateScript="true"	
	resizeColWidth="true"	
	classic="false"	
	width="100%" 	
	height="350px"	
	minHeight="200"  
	>
	<ec:row>
		<ec:column width="40" property="_0" title="序号" value="${GLOBALROWCOUNT}" style="text-align:center" sortable="false"/>
		<ec:column width="120" property="name" title="考核表名称" style="text-align:center">
			<a href="lookAssessTable.do?model.id=${item.id }" target="_blank"><font color="blue">${item.name }</font></a>
		</ec:column>
		<ec:column width="80" property="adate" title="考核月份" cell="date" format="yyyy-MM" style="text-align:center"/>
	<stc:role ifAnyGranted="ROLE_ADMIN">	
		<ec:column width="80" property="_1" title="操作" style="text-align:center" viewsAllowed="html">
		   <a href="editAssess.do?model.id=${item.id}"> 
		      <img src="${ctx}/images/icons/modify.gif" style="border:0px" title="编辑"/>
		   </a>
		   <a href="#" onclick="removeAss(${item.id })"><img src="${ctx}/images/icons/delete.gif" title="删除"/></a>
		</ec:column>
	</stc:role>
	</ec:row>
	</ec:table>
  </div>
  </div>
  </div>
</body>
</html>