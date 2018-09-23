<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<style type="text/css">
	td {
		font-family:Times New Roman
	}
</style>
</head>
<body>
	<div class="x-panel">
		<div class="x-panel-body">
			<table align="center">
				<tr>
					<td align="center">
							<fieldset style="margin:10px;">
								<legend>学生基本信息</legend>
								<table>
									<tr>
										<td align="right" width="80">姓名：</td>
										<td align="left" width="100">
											${model.stuName }
										</td>
										<td align="right" width="150">出生日期：</td>
										<td align="left">
											<s:date name="model.birthday" format="yyyy-MM-dd"/>
										</td>
										<td align="right" width="120">性　　别：</td>
										<td align="left">
											${model.sex}
										</td>
									</tr>
									<tr>
										<td align="right">学　生ID：</td>
										<td align="left">
											${model.stuId }
										</td>
										<td align="right">所去国家：</td>
										<td align="left">
											${model.country}
										</td>
										<td align="right">申请类型：</td>
										<td align="left">
											${model.applyType}
										</td>
									</tr>
									<tr>
										<td align="right">语言入读时间：</td>
										<td align="left">
											<s:date name="model.joinDate" format="yyyy-MM-dd"/>
										</td>
										<td align="right">入读学校(中文)：</td>
										<td align="left">
											${model.school}
										</td>
										<td align="right">入读学校(英文)：</td>
										<td align="left">
											${model.schoolEnName}
										</td>
									</tr>
									<tr>
										<td align="right">正课入读时间</td>
										<td align="left">
											<s:date name="model.zhengJoinDate" format="yyyy-MM-dd"/>
										</td>
										<td align="right">入读专业(中文)：</td>
										<td align="left">
											${model.speciality}
										</td>
										<td align="right">入读专业(英文)：</td>
										<td align="left">
											${model.specialityEnName}
										</td>
									</tr>
								</table>
							</fieldset>
							<fieldset style="margin:10px;">
								<legend>学生佣金情况</legend>
								<table>
									<tr>
										<td align="right" width="100">语言学费金额：</td>
										<td align="left">
											${fn:contains(model.langTuition,'N/A')?'N/A':model.langTuition }
										</td>
										<td align="right" width="100">专业课学费金额：</td>
										<td align="left">
											${fn:contains(model.speTuition,'N/A')?'N/A':model.speTuition }
										</td>
										<td align="right">合&nbsp;作&nbsp;方：</td>
										<td align="left">
											${model.partner}
										</td>
										<td align="right">合作方返佣周期：</td>
										<td align="left" colspan="3">
											${model.partnerPeriod}
										</td>
									</tr>
									<tr>
										<td align="right" width="80">佣金制度/比例：</td>
										<td align="left" colspan="7">
											${model.langProportion}
										</td>
									</tr>
									<tr>
										<td align="right" width="140">第一笔佣金到账金额：</td>
										<td align="left">
											${fn:contains(model.brokerageArriveNum,'N/A')?'N/A':model.brokerageArriveNum }
										</td>
										<td align="right" width="140">第一笔佣金到账时间：</td>
										<td align="left">
											${fn:contains(model.brokerageArriveDate,'2000-01-01')?'N/A':fn:split(model.brokerageArriveDate,' ')[0] }
										</td>
										<td align="right" width="130">第一笔佣金当前汇率：</td>
										<td align="left">
											${model.brokerageRate}
										</td>
										<td align="right" width="140">第一笔佣金折合人民币：</td>
										<td align="left">
											${model.brokerageToRmb }
										</td>
									</tr>
									<tr>
										<td align="right">全额佣金到账：</td>
										<td align="left" colspan="7">
											${model.isAllBrokerageArrived}
										</td>
									</tr>
									<tr>
										<td align="right" width="140">第二笔佣金到账金额：</td>
										<td align="left">
											${fn:contains(model.brokerageArriveNum2,'N/A')?'N/A':model.brokerageArriveNum2 }
										</td>
										<td align="right" width="140">第二笔佣金到账时间：</td>
										<td align="left">
											${fn:contains(model.brokerageArriveDate2,'2000-01-01')?'N/A':fn:split(model.brokerageArriveDate2,' ')[0] }
										</td>
										<td align="right" width="130">第二笔佣金当前汇率：</td>
										<td align="left">
											${model.brokerageRate2}
										</td>
										<td align="right" width="140">第二笔佣金折合人民币：</td>
										<td align="left">
											${model.brokerageToRmb2 }
										</td>
									</tr>
									<tr>
										<td align="right">剩余佣金金额：</td>
										<td align="left">
											${fn:contains(model.lastBrokerageNum,'N/A')?'N/A':model.lastBrokerageNum }
										</td>
										<td align="right">剩余佣金预计返还时间：</td>
										<td align="left" colspan="5">
											${fn:contains(model.lastBrokerageArriveDate,'2000-01-01')?'N/A':fn:split(model.lastBrokerageArriveDate,' ')[0] }
										</td>
									</tr>
									<tr>
										<td align="right" width="120">备　　注：</td>
										<td align="left" colspan="7">
											${model.descn }
										</td>
									</tr>
								</table>
							</fieldset>
							<fieldset style="margin:10px;">
								<legend>其他</legend>
								<table style="width:800px">
									<tr>
										<td align="right" width="70">学生来源：</td>
										<td align="left" width="210">
											<c:if test="${model.source == '0'}">${model.otherSource}</c:if>
											<c:if test="${model.source != '0'}">${model.source}</c:if>
										</td>
										<td align="right" width="80">顾问：</td>
										<td align="left">
											${model.advisor=='0'?model.otherAdvisor:model.advisor }
										</td>
										<td align="right">文案：</td>
										<td align="left">
											${model.docEmp=='0'?model.otherDocEmp:model.docEmp }
										</td>
										<td align="right">规划：</td>
										<td align="left">
											${model.planEmp}
											
										</td>
									</tr>
								</table>
							</fieldset>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>