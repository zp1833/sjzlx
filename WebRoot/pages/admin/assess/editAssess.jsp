<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<%@include file="/common/dwr.jsp" %>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/dwr/interface/AssessManager.js"></script>
<script type="text/javascript">
	function addAssessItem() {
		var tbody = document.getElementById("assessItem");
		var tr = document.createElement("tr");
		var td1 = document.createElement("td");
		var td2 = document.createElement("td");
		td2.innerHTML = "名称：<input type='text' name='itemNames'>&nbsp;&nbsp;描述：<input type='text' name='descns' size='30'>&nbsp;";
		var del = document.createElement("a");
		del.innerHTML = "<img src='${ctx}/images/icons/delschedule.gif' />";
		del.href = "#";
		del.onclick = function() {
			tbody.removeChild(tr);
		}
		td2.align="left";
		td2.appendChild(del);
		tr.appendChild(td1);
		tr.appendChild(td2);
		tbody.appendChild(tr);
	}
	
	function delItem(itemId) {
		if(confirm("删除考核项将会连同对应的考核记录同时删除，确定删除？")) {
			AssessManager.delItem(itemId,function(result) {
				if(result == "1") {
					$("hasItems").removeChild($("item_"+itemId));
					alert("删除成功！");
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
<table width="50%" align="center"><tr><td align="center">
<s:form action="saveAssess" validate="true" theme="simple">
<s:hidden name="model.id"/>
	<fieldset style="margin:10px;">
	<legend>员工考核管理</legend>
	<table style="width:700px">
		<tbody id="assessItem">
			<tr>
				<td align="right">考核表名称：</td>
				<td align="left">
					<s:textfield name="model.name" size="15"></s:textfield>
				</td>
			</tr>
			<tr>
				<td align="right">复制已有表：</td>
				<td align="left">
					<select name="assessId">
						<option value="">-请选择-</option>
					<c:forEach items="${currentTables}" var="table">
						<option value="${table.id }">${table.name }</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">考核月份：</td>
				<td align="left">
					<input type="hidden" name="oldAssessDate" value="<s:date name="model.adate" format="yyyy-MM"/>">
					<input type="text" name="assessDate" size="10" id="model.adate" 
						class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM',readOnly:true})"
							value='<s:date name="model.adate" format="yyyy-MM"/>'/>
				</td>
			</tr>
		<c:if test="${model.id != null}">	
			<tr>
				<td align="right">已有考核项：</td>
				<td align="left">
					<table cellpadding="0" align="left">
						<tbody id="hasItems">
					<c:forEach items="${assessItemsById}" var="assessItem">	
						<tr id="item_${assessItem.id }">
							<td align="right" height="25"><input type="hidden" value="${assessItem.id }" name="hasItemIds">名称：</td>
							<td><input type="text" name="hasItemNames" value="${assessItem.name }"></td>
							<td align="right">描述：</td>
							<td><input type="text" name="hasItemDescns" value="${assessItem.descn }"></td>
							<td><a href="#return" onclick="delItem(${assessItem.id })"><img src="${ctx}/images/icons/delete.gif" /></a></td>
						</tr>
					</c:forEach>
						</tbody>
					</table>
				</td>
			</tr>
		</c:if>
			<tr>
				<td align="right">添加考核项：</td>
				<td align="left">
					<a href="#" onclick="addAssessItem();">
						<img src="${ctx }/images/icons/add_3.gif" border="0"/>添加</a>
				</td>
			</tr>
		</tbody>
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