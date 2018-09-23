<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义查询</title>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/extSkin.jsp" %>
<script type="text/javascript" src="${ctx}/calendar/WdatePicker.js"></script>
<script type="text/javascript">
	function selectSearch() {
		
		var searchName = document.getElementById("searchName").value;
		var searchValue = document.getElementById("searchValue").value;
		
		
		if(searchName != "" && searchValue != "") {
			window.returnValue = searchName + "|$|" + searchValue;
			alert("选择成功！");
		} else {
			window.returnValue = "";
		}
		window.close();
	}
	
	function init() {
		var value = window.dialogArguments;
		if(value != "") {
			var params = value.split("|$|");
			document.getElementById("searchName").value = params[0];
			document.getElementById("searchValue").value = params[1];
		}
	}
	
	function showDateInput(obj) {
		if(obj.value == 'recentTraceTime') {
			document.getElementById("searchValue").className = "Wdate";
			document.getElementById("searchValue").onfocus = function() {
				WdatePicker({dateFmt:'yyyy-MM-dd'})
			};
		} else {
			document.getElementById("searchValue").className = "";
			document.getElementById("searchValue").onfocus = function(){};
			document.getElementById("searchValue").value = "";
		}
	}
	
</script>
</head>
<body onload="init();">
<form action="" method="POST">
	<div class="x-panel">
	    <div class="x-panel-header">自定义查询</div>
		<table width="100%" border="0" align="center">
		  <tr><td>
		    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="Content">
		        <tr>
		          <td>
					<div>
						<table align="center" bgcolor="#FFFFFF" cellpadding="2" cellspacing="1" width="100%">
							<tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">查询条件：</td>
								<td bgcolor="#EBEBEB">
									<select name="searchName" id="searchName" onchange="showDateInput(this);">
										<option value="">--请选择--</option>
										<option value="source">信息来源</option>
										<option value="sourceFrom">来源明细</option>
										<option value="contact">联系方式</option>
										<option value="advType">咨询形式</option>
										<option value="currentGrade">在读年级</option>
										<option value="hopeDegree">目标学历</option>
										<option value="introToIELTS">介绍给机构</option>
										<option value="recentTraceTime">最新跟踪时间</option>
										<option value="qq">QQ/微信</option>
									</select>
							  	</td>
						    </tr>
						    <tr>
							  	<td align="right" bgcolor="#EBEBEB" width="130">查询内容：</td>
								<td bgcolor="#EBEBEB">
									<input type="text" value="" id="searchValue" name="searchValue">
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
					<input type="button" onclick="selectSearch();" value="确定" class="button">&nbsp;&nbsp;             	
                    <input type="reset" value="重置" class="button">
                </td>
            </tr>
        </table>
	</div>
</form>
</body>
</html>