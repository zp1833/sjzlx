<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看考核信息</title>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
</head>
<body >
	<div class="x-panel">
	    <div class="x-panel-header">查看考核信息</div>
		<table width="100%" border="0" align="center">
		  <tr><td>
		    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="Content">
		        <tr>
		          <td>
					<div>
						<table align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1" width="100%">
							<tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">人员姓名：</td>
								<td bgcolor="#EBEBEB">
									${assessCell.employee.name }
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">考核项目：</td>
								<td bgcolor="#EBEBEB">
									${assessCell.assessItem.name }
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">考核日期：</td>
								<td bgcolor="#EBEBEB">
									<s:date name="assessCell.adate" format="yyyy-MM-dd"/>
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">是否交钱：</td>
								<td bgcolor="#EBEBEB">
									${assessCell.isPay == "0"?"否":"是" }
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">备注：</td>
								<td bgcolor="#EBEBEB">
									<textarea rows="5" cols="30" readonly="readonly">${assessCell.descn }</textarea>
							  	</td>
						    </tr>
						</table>
					</div>
				  </td>
		        </tr>
		    </table>		
		  </td></tr>
		</table>
		<table width="100%" >
            <tr>
                <td style="text-align:center;">
					<input type="button" onclick="window.close()" value="关闭" class="button">&nbsp;&nbsp;             	
                </td>
            </tr>
        </table>
	</div>
</body>
</html>