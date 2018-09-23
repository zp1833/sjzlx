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
<script type="text/javascript" src="${ctx}/dwr/interface/StuInfoManager.js"></script>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/TabPanel/tabpanel.js"></script>
<script type="text/javascript" src="${ctx}/js/fckeditor/fckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/TabPanel/css/style.css" />
<script type="text/javascript">
	function changeTab() {
		if("${param.flag}" == "stu")
			switchTab($("SystopTab2"),6);
		if("${param.flag}" == "school")
			switchTab($("SystopTab4"),6);
		if("${param.flag}" == "sign")
			switchTab($("SystopTab5"),6);
		if("${param.flag}" == "service")
			switchTab($("SystopTab6"),6);
	}
	
	function preFckEditor(){
		var fckEditor = new FCKeditor( 'model.traceDesc' ) ;
	    fckEditor.BasePath = "${ctx}/js/fckeditor/";
	    fckEditor.ToolbarSet = 'zp';
	    fckEditor.Height = 100;
	    fckEditor.ReplaceTextarea();
	}
	
	function checkForm() {
<stc:role ifNotGranted="ROLE_ADMIN">
<stc:role ifNotGranted="ROLE_ORADMIN">
		if($("model.stuName").value.length == 0) {
			alert("请填写学生姓名");
			return false;
		}
		if($("model.advisor").value.length == 0) {
			alert("请选择负责顾问");
			return false;
		}
		if($("model.advCountry").value.length == 0) {
			alert("请选择咨询国家");
			return false;
		}
	<stc:role ifAnyGranted="ROLE_REC">
		if($("model.advDate").value.length == 0) {
			alert("请选择咨询日期");
			$("model.advDate").focus();
			return false;
		}
		if($("model.source").value.length == 0) {
			alert("请选择信息来源");
			return false;
		}
		if($("model.advType").value.length == 0) {
			alert("请选择咨询形式");
			return false;
		}
		if($("model.recEmp").value.length == 0) {
			alert("请选择接待员工");
			return false;
		}
		if($("model.nextVisitTime").value.length == 0) {
			alert("请选择下次回访时间");
			$("model.nextVisitTime").focus();
			return false;
		}
	</stc:role>
	<stc:role ifAnyGranted="ROLE_ADV,ROLE_ORADMIN">
		if($("model.stuType").value.length == 0) {
			alert("请选择学生分类");
			return false;
		}
		if($("model.stuType").value != "沉默客户") {
			if($("model.currentPlan").value.length == 0) {
				alert("请选择当前进度");
				return false;
			}
			if($("model.nextVisitTime").value.length == 0) {
				alert("请选择下次回访时间");
				switchTab($("SystopTab2"),6);
				$("model.nextVisitTime").focus();
				return false;
			}
			if($("model.statusDefineTime").value.length == 0) {
				alert("请选择状态定义日期");
				switchTab($("SystopTab2"),6);
				$("model.statusDefineTime").focus();
				return false;
			}
			if($("model.hopeDegree").value.length == 0) {
				alert("请选择目标学历");
				return false;
			}
			if($("model.introToIELTS").value.length == 0) {
				alert("请填写介绍给雅思情况");
				switchTab($("SystopTab2"),6);
				$("model.introToIELTS").focus();
				return false;
			}
			if($("model.recentTraceTime").value.length == 0) {
			
				alert("请选择最新跟踪时间");
				switchTab($("SystopTab2"),6);
				$("model.recentTraceTime").focus();
				return false;
			}
			if($("model.signStatus").value == "1" && ($("model.stuType").value != "已签约" && $("model.stuType").value != "退费" ) || 
					$("model.signStatus").value != "1" && ($("model.stuType").value == "退费"||$("model.stuType").value == "已签约")) {
				alert("学生分类与签约情况不一致，请重新选择");
				return false;
			}
			if($("model.stuType").value == "已签约" || $("model.stuType").value == "交订金") {
				if($("model.signTime").value.length == 0) {
					alert("请选择签约日期");
					switchTab($("SystopTab3"),6);
					$("model.signTime").focus();
					return false;
				}
				if($("model.signName").value.length == 0) {
					alert("请选择签约人");
					switchTab($("SystopTab3"),6);
					return false;
				}
				if($("model.serviceCharge").value.length == 0) {
					alert("请填写服务费");
					switchTab($("SystopTab3"),6);
					$("model.serviceCharge").focus();
					return false;
				}
				if($("model.downPayment").value.length == 0) {
					alert("请填写首期款");
					switchTab($("SystopTab3"),6);
					$("model.downPayment").focus();
					return false;
				}
				if($("model.endPayment").value.length == 0) {
					alert("请填写后期款");
					switchTab($("SystopTab3"),6);
					$("model.endPayment").focus();
					return false;
				}
				if($("model.serviceChargeDetails").value.length == 0) {
					alert("请填写相关服务费用明细");
					switchTab($("SystopTab3"),6);
					$("model.serviceChargeDetails").focus();
					return false;
				}
				if($("model.signDesc").value.length == 0) {
					alert("请填写签约备注");
					switchTab($("SystopTab3"),6);
					$("model.signDesc").focus();
					return false;
				}
			}
		}
		if($("model.contact").value.length == 0) {
			alert("请填写联系方式");
			switchTab($("SystopTab2"),6);
			$("model.contact").focus();
			return false;
		}
		var traceDesc = FCKeditorAPI.GetInstance('model.traceDesc').EditorDocument.body.innerHTML;
		traceDesc = traceDesc.replace("<br>","");
		traceDesc = traceDesc.replace("<p>","");
		if(traceDesc.length == 0) {
			alert("请填写客户跟踪记录");
			switchTab($("SystopTab2"),6);
			return false;
		}
	</stc:role>
	
		var signTime = $("model.signTime").value;
		var signName = $("model.signName").value;
		var serviceCharge = $("model.serviceCharge").value;
		var endPayment = $("model.endPayment").value;
		var downPayment = $("model.downPayment").value;
		var serviceChargeDetails = $("model.serviceChargeDetails").value;
		var signDesc = $("model.signDesc").value;
		var signStatus = $("model.signStatus").value;
		var stuType = $("model.stuType").value;
		
		if(signStatus == "1" || stuType == "已签约" || stuType == "交订金") {
			if(signTime.length == 0 || signName.length == 0 || serviceCharge.length == 0 || endPayment.length == 0 || 
				downPayment.length == 0 || serviceChargeDetails.length == 0 || signDesc.length == 0) {
				alert("服务明细必须全部填写！");
				switchTab($("SystopTab3"),6);
				return false;
			}
		} else {
			if(signTime.length > 0 || signName.length > 0 || serviceCharge.length > 0 || endPayment.length > 0 || 
				downPayment.length > 0 || serviceChargeDetails.length > 0 || signDesc.length > 0) {
				alert("签约明细中若有其中一项填写后，其他项必须全部填写并且学生分类和签约情况需发生相应改变！");
				return false;
			}
		}
</stc:role>	
</stc:role>	
		return true;
	}
	
	function doSubmit() {
		if(checkForm()) {
			var contact = $("model.contact").value;
			var id = $("model.id").value;
			if(contact.length > 0) {
				StuInfoManager.isContactExist(id, contact, function(result) {
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
			$("model.signStatus").value = "1";
		else if(obj.value != "退费")
			$("model.signStatus").value = "0";
	}
	
	function changeStuType(obj) {
		if(obj.value == "1") {
			$("model.stuType").value = "已签约";
		}
	}
	
</script>
</head>
<body onload="preFckEditor();changeTab();">
<s:form namespace="/admin/stuinfo" id="form1" action="saveStuInfo" theme="simple" method="POST" validate="true" enctype="multipart/form-data" onsubmit="return checkForm();">
	<div class="x-panel">
	    <div class="x-panel-header">添加学生信息</div>
	    <div class="x-toolbar">
		    <%@include file="navigation.jsp"  %>
	    </div>
		<table width="100%" border="0" align="center">
		  <tr><td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="TabBarLevel" id="TabPage">
		      <tr align="center">
		      <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_REC,ROLE_AUDIT">
		        <td width="80" id="SystopTab1" valign="middle" class="SelectedTab" onclick=switchTab(this,6)>
					接待信息
				</td>
		        <td width="7" class="Black">&nbsp;</td>
		      </stc:role>
		      
		      <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_AUDIT,ROLE_REC">
		        <td width="80" id="SystopTab2"  valign="middle" class="mousehand" onclick=switchTab(this,6)>
		        	学生信息
				</td>
		        <td width="7" class="Black">&nbsp;</td>
		      </stc:role>
		      <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_FINANCE,ROLE_ADV,ROLE_ORADMIN,ROLE_AUDIT,ROLE_REC">
		        <td width="80" id="SystopTab3" valign="middle" class="mousehand" onclick=switchTab(this,6)>
		        	签约明细
		        </td>
		        <td width="7" class="Black">&nbsp;</td>
		      </stc:role>
		      
		      <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_DOC,ROLE_ORADMIN,ROLE_AUDIT,ROLE_REC">
		        <td width="80" id="SystopTab4" valign="middle" class="mousehand" onclick=switchTab(this,6)>
		        	学校申请
		        </td>
		        <td width="7" class="Black">&nbsp;</td>
		      </stc:role>
		      <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_DOC,ROLE_ORADMIN,ROLE_AUDIT,ROLE_REC">
		        <td width="80" id="SystopTab5" valign="middle" class="mousehand" onclick=switchTab(this,6)>
		        	签证申请
		        </td>
		        <td width="7" class="Black">&nbsp;</td>
		      </stc:role>
		      <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_DOC,ROLE_ADV,ROLE_ORADMIN,ROLE_FINANCE,ROLE_AUDIT,ROLE_REC">
		        <td width="80" id="SystopTab6" valign="middle" class="mousehand" onclick=switchTab(this,6)>
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
					<div id='SystopTabDiv1' <stc:role ifAnyGranted="ROLE_REC,ROLE_ADMIN,ROLE_AUDIT">style=" display:block"</stc:role> style=" display:none">
						<%@include file="recInfo.jsp" %>
					</div>
					<div id='SystopTabDiv2' <stc:role ifAnyGranted="ROLE_ADV,ROLE_ORADMIN">style=" display:block"</stc:role> style=" display:none">
						<%@include file="stuDetailsInfo.jsp" %>
					</div>
					<div id='SystopTabDiv3' <stc:role ifAnyGranted="ROLE_FINANCE">style=" display:block"</stc:role> style=" display:none">
						<%@include file="signDetails.jsp" %>
					</div>
					<div id='SystopTabDiv4' <stc:role ifAnyGranted="ROLE_DOC">style=" display:block"</stc:role> style=" display:none">
						<%@include file="schoolApply.jsp" %>
					</div>
					<div id='SystopTabDiv5' style=" display:none">
						<%@include file="signApply.jsp" %>
					</div>
					<div id='SystopTabDiv6' style=" display:none">
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
                    <%--<s:submit value="保存" cssClass="button"></s:submit>--%>
                    <input value="保存" type="button" onclick="doSubmit()" class="button"/>
                    <s:reset value="重置" cssClass="button"></s:reset>
                </td>
            </tr>
        </table>
	</div>
</s:form>
</body>
</html>