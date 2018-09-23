<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑学员信息</title>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<%@include file="/common/dwr.jsp" %>
<script type="text/javascript" src="${ctx}/dwr/interface/YmInfoManager.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/default/easyui.css"></link>
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/TabPanel/tabpanel.js"></script>
<script type="text/javascript" src="${ctx}/js/fckeditor/fckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/TabPanel/css/style.css" />
<script type="text/javascript">

	function changeTab() {
		<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_REC,ROLE_AUDIT">
			switchTab(document.getElementById("SystopTab1"),5);
		</stc:role>
		<stc:role ifAnyGranted="ROLE_ADV,ROLE_DOC,ROLE_ORADMIN">
			switchTab(document.getElementById("SystopTab2"),5);
		</stc:role>
	}
	
	function preFckEditor(){
		var fckEditor = new FCKeditor( 'model.traceDesc' ) ;
	    fckEditor.BasePath = "${ctx}/js/fckeditor/";
	    fckEditor.ToolbarSet = 'zp';
	    fckEditor.Height = 100;
	    fckEditor.ReplaceTextarea();
	}
	
	function checkForm() {
		if(document.getElementById("model.stuName").value.length == 0) {
			alert("请填写客户姓名");
			return false;
		}
		if(document.getElementById("model.advisor").value.length == 0) {
			alert("请选择负责顾问");
			return false;
		}
		if(document.getElementById("model.advCountry").value.length == 0) {
			alert("请选择咨询国家");
			return false;
		}
	<stc:role ifAnyGranted="ROLE_REC">
		if(document.getElementById("model.advDate").value.length == 0) {
			alert("请选择咨询日期");
			document.getElementById("model.advDate").focus();
			return false;
		}
		if(document.getElementById("model.source").value.length == 0) {
			alert("请选择信息来源");
			return false;
		}
		if(document.getElementById("model.advType").value.length == 0) {
			alert("请选择咨询形式");
			return false;
		}
		if(document.getElementById("model.recEmp").value.length == 0) {
			alert("请选择接待员工");
			return false;
		}
		if(document.getElementById("model.nextVisitTime").value.length == 0) {
			alert("请选择下次回访时间");
			document.getElementById("model.nextVisitTime").focus();
			return false;
		}
	</stc:role>
	<stc:role ifNotGranted="ROLE_REC">
		if(document.getElementById("model.stuType").value.length == 0) {
			alert("请选择客户分类");
			return false;
		}
		if(document.getElementById("model.stuType").value != "沉默客户") {
			if(document.getElementById("model.currentPlan").value.length == 0) {
				alert("请选择当前进度");
				return false;
			}
			if(document.getElementById("model.nextVisitTime").value.length == 0) {
				alert("请选择下次回访时间");
				switchTab(document.getElementById("SystopTab2"),6);
				document.getElementById("model.nextVisitTime").focus();
				return false;
			}
			if(document.getElementById("model.statusDefineTime").value.length == 0) {
				alert("请选择状态定义日期");
				switchTab(document.getElementById("SystopTab2"),6);
				document.getElementById("model.statusDefineTime").focus();
				return false;
			}
			if(document.getElementById("model.introToIELTS").value.length == 0) {
				alert("请填写介绍给语言情况");
				switchTab(document.getElementById("SystopTab2"),6);
				document.getElementById("model.introToIELTS").focus();
				return false;
			}
			if(document.getElementById("model.recentTraceTime").value.length == 0) {
			
				alert("请选择最新跟踪时间");
				switchTab(document.getElementById("SystopTab2"),6);
				document.getElementById("model.recentTraceTime").focus();
				return false;
			}
			if(document.getElementById("model.signStatus").value == "1" && (document.getElementById("model.stuType").value != "已签约" && document.getElementById("model.stuType").value != "退费" ) || 
					document.getElementById("model.signStatus").value != "1" && (document.getElementById("model.stuType").value == "退费"||document.getElementById("model.stuType").value == "已签约")) {
				alert("客户分类与签约情况不一致，请重新选择");
				return false;
			}
			if(document.getElementById("model.stuType").value == "已签约" || document.getElementById("model.stuType").value == "交订金") {
				if(document.getElementById("model.signTime").value.length == 0) {
					alert("请选择签约日期");
					switchTab(document.getElementById("SystopTab3"),6);
					document.getElementById("model.signTime").focus();
					return false;
				}
				if(document.getElementById("model.signName").value.length == 0) {
					alert("请选择签约人");
					switchTab(document.getElementById("SystopTab3"),6);
					return false;
				}
				if(document.getElementById("model.serviceCharge").value.length == 0) {
					alert("请填写服务费");
					switchTab(document.getElementById("SystopTab3"),6);
					document.getElementById("model.serviceCharge").focus();
					return false;
				}
				if(document.getElementById("model.downPayment").value.length == 0) {
					alert("请填写首期款");
					switchTab(document.getElementById("SystopTab3"),6);
					document.getElementById("model.downPayment").focus();
					return false;
				}
				if(document.getElementById("model.endPayment").value.length == 0) {
					alert("请填写后期款");
					switchTab(document.getElementById("SystopTab3"),6);
					document.getElementById("model.endPayment").focus();
					return false;
				}
				if(document.getElementById("model.serviceChargeDetails").value.length == 0) {
					alert("请填写相关服务费用明细");
					switchTab(document.getElementById("SystopTab3"),6);
					document.getElementById("model.serviceChargeDetails").focus();
					return false;
				}
				if(document.getElementById("model.signDesc").value.length == 0) {
					alert("请填写签约备注");
					switchTab(document.getElementById("SystopTab3"),6);
					document.getElementById("model.signDesc").focus();
					return false;
				}
			}
		}
		if(document.getElementById("model.contact").value.length == 0) {
			alert("请填写联系方式");
			switchTab(document.getElementById("SystopTab2"),6);
			document.getElementById("model.contact").focus();
			return false;
		}
		var traceDesc = FCKeditorAPI.GetInstance('model.traceDesc').EditorDocument.body.innerHTML;
		traceDesc = traceDesc.replace("<br>","");
		traceDesc = traceDesc.replace("<p>","");
		if(traceDesc.length == 0) {
			alert("请填写客户跟踪记录");
			switchTab(document.getElementById("SystopTab2"),6);
			return false;
		}
		/*
		var signTime = document.getElementById("model.signTime").value;
		var signName = document.getElementById("model.signName").value;
		var serviceCharge = document.getElementById("model.serviceCharge").value;
		var endPayment = document.getElementById("model.endPayment").value;
		var downPayment = document.getElementById("model.downPayment").value;
		var serviceChargeDetails = document.getElementById("model.serviceChargeDetails").value;
		var signDesc = document.getElementById("model.signDesc").value;
		var signStatus = document.getElementById("model.signStatus").value;
		var stuType = document.getElementById("model.stuType").value;
		
		if(signStatus == "1" || stuType == "已签约" || stuType == "交订金") {
			if(signTime.length == 0 || signName.length == 0 || serviceCharge.length == 0 || endPayment.length == 0 || 
				downPayment.length == 0 || serviceChargeDetails.length == 0 || signDesc.length == 0) {
				alert("服务明细必须全部填写！");
				switchTab(document.getElementById("SystopTab3"),6);
				return false;
			}
		} else {
			if(signTime.length > 0 || signName.length > 0 || serviceCharge.length > 0 || endPayment.length > 0 || 
				downPayment.length > 0 || serviceChargeDetails.length > 0 || signDesc.length > 0) {
				alert("签约明细中若有其中一项填写后，其他项必须全部填写并且客户分类和签约情况需发生相应改变！");
				return false;
			}
		}
		*/
		</stc:role>
		return true;
	}
	
	function doSubmit() {
		if(checkForm()) {
			var contact = document.getElementById("model.contact").value;
			var id = document.getElementById("model.id").value;
			if(contact.length > 0) {
				YmInfoManager.isContactExist(id, contact, function(result) {
					if(result == "1") {
						alert("联系方式重复");
						return;
					}
					document.getElementById("form1").submit();
				});
			} else {
				document.getElementById("form1").submit();
			}
		}
	}
	
	function changeSignStatus(obj) {
		if(obj.value == "已签约")
			document.getElementById("model.signStatus").value = "1";
		else if(obj.value != "退费")
			document.getElementById("model.signStatus").value = "0";
	}
	
	function changeStuType(obj) {
		if(obj.value == "1") {
			document.getElementById("model.stuType").value = "已签约";
		}
	}
	
</script>
</head>
<body onload="preFckEditor();changeTab();">
<s:form namespace="/admin/ym" action="saveYmInfo" id="form1" theme="simple" method="POST" validate="true" onsubmit="return checkForm();">
	<div class="x-panel">
	    <div class="x-panel-header">添加客户信息</div>
	    <table width="100%" border="0" cellpadding="5"
			cellspacing="1">
			<tr>
				<td><%@ include file="/common/messages.jsp"%></td>
			</tr>
		</table>
		<table width="100%" border="0" align="center">
		  <tr><td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="TabBarLevel" id="TabPage">
		      <tr align="center">
		      <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_REC,ROLE_AUDIT">
		        <td width="80" id="SystopTab1" valign="middle" class="SelectedTab" onclick=switchTab(this,5)>
					接待信息
				</td>
		        <td width="7" class="Black">&nbsp;</td>
		      </stc:role>
		      
		      <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_DOC,ROLE_ORADMIN,ROLE_REC,ROLE_AUDIT">
		        <td width="80" id="SystopTab2"  valign="middle" class="mousehand" onclick=switchTab(this,5)>
		        	客户信息
				</td>
		        <td width="7" class="Black">&nbsp;</td>
		        <td width="80" id="SystopTab3" valign="middle" class="mousehand" onclick=switchTab(this,5)>
		        	签约明细
		        </td>
		        <td width="7" class="Black">&nbsp;</td>
		        <td width="80" id="SystopTab4" valign="middle" class="mousehand" onclick=switchTab(this,5)>
		        	移民申请
		        </td>
		        <td width="7" class="Black">&nbsp;</td>
		        <td width="80" id="SystopTab5" valign="middle" class="mousehand" onclick=switchTab(this,5)>
		        	后期服务
		        </td>
		        <td width="7" class="Black">&nbsp;</td>
		      </stc:role>
	        	<td width="" align="right" class="Black">&nbsp;&nbsp;</td>
		      </tr>
		    </table>
	    
		    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="Content">
		        <tr>
		          <td height="110">
					<div id='SystopTabDiv1' style="display:none">
						<%@include file="recInfo.jsp" %>
					</div>
					<div id='SystopTabDiv2' style="display:none">
						<%@include file="stuDetailsInfo.jsp" %>
					</div>
					<div id='SystopTabDiv3' style="display:none">
						<%@include file="signDetails.jsp" %>
					</div>
					<div id='SystopTabDiv4' style="display:none">
						<%@include file="ymApply.jsp" %>
					</div>
					<div id='SystopTabDiv5' style="display:none">
						<%@include file="laterService.jsp" %>
					</div>
				  </td>
		        </tr>
		    </table>		
		  </td></tr>
		</table>
		<table width="100%" >
            <tr>
                <td style="text-align:center;">
                	<s:hidden name="model.id" id="model.id"/>
                	<input type="hidden" name="beginAdvDate" value='<s:date name="beginAdvDate" format="yyyy-MM-dd"/>'/>
                	<input type="hidden" name="endAdvDate" value='<s:date name="endAdvDate" format="yyyy-MM-dd"/>'/>
                	<input type="hidden" name="beginSignDate" value='<s:date name="beginSignDate" format="yyyy-MM-dd"/>'/>
                	<input type="hidden" name="endSignDate" value='<s:date name="endSignDate" format="yyyy-MM-dd"/>'/>
                	<input type="hidden" name="beginVisitDate" value='<s:date name="beginVisitDate" format="yyyy-MM-dd"/>'/>
                	<input type="hidden" name="endVisitDate" value='<s:date name="endVisitDate" format="yyyy-MM-dd"/>'/>
                	<s:hidden name="currentPageNo"/>
                	<s:hidden name="modifyFlag"/>
                	<s:hidden name="definedField" id="definedField"/>
                	<s:hidden name="definedSearch" id="definedSearch"/>
                	<s:hidden name="showType" id="showType"/>
                    <s:submit value="保存" cssClass="button"></s:submit>
                    <input value="保存" type="button" onclick="doSubmit()" class="button"/>
                    <s:reset value="重置" cssClass="button"></s:reset>
                </td>
            </tr>
        </table>
	</div>
</s:form>
</body>
</html>