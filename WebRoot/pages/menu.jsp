
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="stc" uri="/alphasta/common" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<div id="menu" style="display:none">
 	<div id="menu_stuinfo">
         <div style="padding-left:5px;">
            <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_REC"> 
            <div style="padding-top:2px">
                <img src="${ctx}/images/exticons/add.gif" class="icon">
                <a href="${ctx}/admin/stuinfo/newStuInfo.do" target="main">添加学生信息</a>
            </div>
            </stc:role>
            <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_SEARCH,ROLE_AUDIT,ROLE_ORADMIN">
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/expand-all.gif" class="icon">
			    <a href="${ctx}/admin/stuinfo/listStuInfo.do" target="main">学生信息总表</a>
			</div>
			</stc:role>
            <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_DOC,ROLE_AUDIT">
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/stuinfo/listStuInfo.do?showType=0" target="main">学生信息列表</a>
			</div>
			</stc:role>
			<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_DOC,ROLE_AUDIT">
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/stuinfo/listStuInfo.do?showType=1" target="main">签约客户列表</a>
			</div>
			</stc:role>
			<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_DOC,ROLE_AUDIT">
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/stuinfo/listStuInfo.do?showType=2" target="main">沉默客户列表</a>
			</div>
			</stc:role>
			<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_DOC,ROLE_AUDIT">
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/stuinfo/listStuInfo.do?showType=3" target="main">长期客户列表</a>
			</div>
			</stc:role>
			<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_DOC,ROLE_AUDIT">
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/stuinfo/listStuInfo.do?showType=success" target="main">成功客户列表</a>
			</div>
			</stc:role>
			<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_DOC,ROLE_AUDIT">
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/stuinfo/listStuInfo.do?showType=4" target="main">退费客户列表</a>
			</div>
			</stc:role>
            <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ORADMIN,ROLE_ADV,ROLE_AUDIT"> 
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/list-items.gif" class="icon">
			    <a href="${ctx}/admin/stuinfo/listVisitStuInfo.do" target="main">顾问回访记录</a>
			</div>
			</stc:role>
         </div>
      </div>
      
      <div id="menu_dealinginfo">
         <div style="padding-left:5px;">
            <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_DOC,ROLE_END">
	            <div style="padding-top:2px">
	                <img src="${ctx}/images/exticons/add.gif" class="icon">
	                <a href="${ctx}/admin/dealinginfo/newDealingInfo.do" target="main">添加现操作客户信息</a>
	            </div>
	        </stc:role>
        	<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?isAll=1" target="main">现操作客户总表</a>
			</div>
			<c:if test="${fn:contains(userInSession.employees.countries, '美国')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=美国" target="main">美国现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '加拿大')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=加拿大" target="main">加拿大现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '澳大利亚')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=澳大利亚" target="main">澳洲现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '新西兰')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=新西兰" target="main">新西兰现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '香港')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=香港" target="main">香港现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '英国')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=英国" target="main">英国现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '日本')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=日本" target="main">日本现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '韩国')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=韩国" target="main">韩国现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '法国')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=法国" target="main">法国现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '新加坡')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=新加坡" target="main">新加坡现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '爱尔兰')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=爱尔兰" target="main">爱尔兰现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '马来西来')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=马来西来" target="main">马来西来现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '俄罗斯')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=俄罗斯" target="main">俄罗斯现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '荷兰')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=荷兰" target="main">荷兰现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '西班牙')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=西班牙" target="main">西班牙现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '德国')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=德国" target="main">德国现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '挪威')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=挪威" target="main">挪威现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '瑞典')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=瑞典" target="main">瑞典现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '丹麦')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=丹麦" target="main">丹麦现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '芬兰')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=芬兰" target="main">芬兰现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '瑞士')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=瑞士" target="main">瑞士现操作客户列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '匈牙利')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=匈牙利" target="main">匈牙利现操作客户列表</a>
				</div>
			</c:if>
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/dealinginfo/listDealingInfo.do?model.toCountry=other" target="main">其他现操作客户列表</a>
				</div>
         </div>
      </div>
      
      <div id="menu_brokerage">
         <div style="padding-left:5px;">
            <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_DOC,ROLE_END">
	            <div style="padding-top:2px">
	                <img src="${ctx}/images/exticons/add.gif" class="icon">
	                <a href="${ctx}/admin/brokerage/newBrokerage.do" target="main">添加佣金信息</a>
	            </div>
	        </stc:role>
	        	<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/brokerage/listBrokerage.do?isAll=1" target="main">学员佣金信息总表</a>
				</div>
				<c:if test="${fn:contains(userInSession.employees.countries, '美国')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=美国" target="main">美国佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '加拿大')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=加拿大" target="main">加拿大佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '澳大利亚')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=澳大利亚" target="main">澳大利亚佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '新西兰')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=新西兰" target="main">新西兰佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '香港')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=香港" target="main">香港佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '英国')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=英国" target="main">英国佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '日本')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=日本" target="main">日本佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '韩国')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=韩国" target="main">韩国佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '法国')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=法国" target="main">法国佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '新加坡')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=新加坡" target="main">新加坡佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '爱尔兰')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=爱尔兰" target="main">爱尔兰佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '马来西来')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=马来西来" target="main">马来西来佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '俄罗斯')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=俄罗斯" target="main">俄罗斯佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '荷兰')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=荷兰" target="main">荷兰佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '西班牙')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=西班牙" target="main">西班牙佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '德国')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=德国" target="main">德国佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '挪威')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=挪威" target="main">挪威佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '瑞典')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=瑞典" target="main">瑞典佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '丹麦')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=丹麦" target="main">丹麦佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '芬兰')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=芬兰" target="main">芬兰佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '瑞士')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=瑞士" target="main">瑞士佣金信息列表</a>
					</div>
				</c:if>
				<c:if test="${fn:contains(userInSession.employees.countries, '匈牙利')}">
					<div style="padding-top:2px">
					    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
					    <a href="${ctx}/admin/brokerage/listBrokerage.do?model.country=匈牙利" target="main">匈牙利佣金信息列表</a>
					</div>
				</c:if>
         </div>
      </div>
      <div id="menu_successfulCase">
         <div style="padding-left:5px;">
            <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_DOC,ROLE_END">
	            <div style="padding-top:2px">
	                <img src="${ctx}/images/exticons/add.gif" class="icon">
	                <a href="${ctx}/admin/successfulCase/newSuccessfulCase.do" target="main">添加成功案例信息</a>
	            </div>
	        </stc:role>
	        <div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?isAll=1" target="main">学员成功案例管理总表</a>
			</div>
			<c:if test="${fn:contains(userInSession.employees.countries, '美国')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=美国" target="main">美国成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '加拿大')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=加拿大" target="main">加拿大成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '澳大利亚')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=澳大利亚" target="main">澳大利亚成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '新西兰')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=新西兰" target="main">新西兰成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '香港')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=香港" target="main">香港成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '英国')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=英国" target="main">英国成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '日本')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=日本" target="main">日本成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '韩国')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=韩国" target="main">韩国成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '法国')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=法国" target="main">法国成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '新加坡')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=新加坡" target="main">新加坡成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '爱尔兰')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=爱尔兰" target="main">爱尔兰成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '马来西来')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=马来西来" target="main">马来西来成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '俄罗斯')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=俄罗斯" target="main">俄罗斯成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '荷兰')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=荷兰" target="main">荷兰成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '西班牙')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=西班牙" target="main">西班牙成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '德国')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=德国" target="main">德国成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '挪威')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=挪威" target="main">挪威成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '瑞典')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=瑞典" target="main">瑞典成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '丹麦')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=丹麦" target="main">丹麦成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '芬兰')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=芬兰" target="main">芬兰成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '瑞士')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=瑞士" target="main">瑞士成功案例信息列表</a>
				</div>
			</c:if>
			<c:if test="${fn:contains(userInSession.employees.countries, '匈牙利')}">
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=匈牙利" target="main">匈牙利成功案例信息列表</a>
				</div>
			</c:if>
				<div style="padding-top:2px">
				    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
				    <a href="${ctx}/admin/successfulCase/listSuccessfulCase.do?model.toCountry=other" target="main">其他成功案例信息列表</a>
				</div>
         </div>
      </div>
      
      <div id="menu_yminfo">
         <div style="padding-left:5px;">
         <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_REC">
            <div style="padding-top:2px">
                <img src="${ctx}/images/exticons/add.gif" class="icon">
                <a href="${ctx}/admin/ym/newYmInfo.do" target="main">添加移民信息</a>
            </div>
         </stc:role>
         <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_SEARCH">
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/expand-all.gif" class="icon">
			    <a href="${ctx}/admin/ym/listYmInfo.do" target="main">客户信息总表</a>
			</div>
		 </stc:role>
		 <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_DOC,ROLE_AUDIT">
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/ym/listYmInfo.do?showType=0" target="main">客户信息列表</a>
			</div>
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/ym/listYmInfo.do?showType=1" target="main">签约客户列表</a>
			</div>
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/ym/listYmInfo.do?showType=2" target="main">沉默客户列表</a>
			</div>
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/ym/listYmInfo.do?showType=3" target="main">长期客户列表</a>
			</div>
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/ym/listYmInfo.do?showType=success" target="main">成功客户列表</a>
			</div>
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/ym/listYmInfo.do?showType=4" target="main">退费客户列表</a>
			</div>
		</stc:role>
         </div>
      </div>
      
	  <div id="menu_work">
         <div style="padding-left:5px;">
            <div style="padding-top:2px">
                <img src="${ctx}/images/exticons/add.gif" class="icon">
                <a href="${ctx}/admin/workplan/newWorkPlan.do" target="main">添加工作计划</a>
            </div>
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/workplan/listWorkPlan.do" target="main">工作计划列表</a>
			</div>
         </div>
      </div>
      <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_AUDIT">
      <div id="menu_tradetel">
         <div style="padding-left:5px;">
            <div style="padding-top:2px">
                <img src="${ctx}/images/exticons/add.gif" class="icon">
                <a href="${ctx}/admin/tradetel/newTradeTel.do" target="main">添加同行电话</a>
            </div>
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/tradetel/listTradeTel.do" target="main">同行电话列表</a>
			</div>
         </div>
      </div>
      </stc:role>
      <div id="menu_assess">
         <div style="padding-left:5px;">
         <stc:role ifAnyGranted="ROLE_ADMIN">    
            <div style="padding-top:2px">
                <img src="${ctx}/images/exticons/add.gif" class="icon">
                <a href="${ctx}/admin/assess/newAssess.do" target="main">添加考核表</a>
            </div>
         </stc:role>
			<div style="padding-top:2px">
			    <img src="${ctx}/images/exticons/collapse-all.gif" class="icon">
			    <a href="${ctx}/admin/assess/listAssess.do" target="main">员工考核表</a>
			</div>
         </div>
      </div>
      <stc:role ifAnyGranted="ROLE_ADMIN">  
       <div id="menu_sys">
         <div style="padding-left:5px;">
              <div style="padding-top:2px">
                  <img src="${ctx}/images/icons/user.jpg" class="icon">
                  <a href="${ctx}/admin/employee/listEmployees.do" target="main">用户管理</a>
              </div>         
              <div style="padding-top:2px">
                  <img src="${ctx}/images/icons/users_1.gif" class="icon">
                  <a href="${ctx}/admin/dept/list.do" target="main">部门管理</a>
              </div>
              <div style="padding-top:2px">
				 <img src="${ctx}/images/icons/role.gif" class="icon">
				 <a href="${ctx}/admin/security/role/listRoles.do" target="main">角色管理</a> 
			  </div>
         </div>       
      </div>
     </stc:role>

      <div id="menu_person">
         <div style="padding-left:5px;">	
              <div style="padding-top:2px">
                  <img src="${ctx}/images/exticons/square.gif" class="icon">
                  <a href="${ctx}/admin/security/user/newChange.do" target="main">密码管理</a>
              </div>	      
         </div>       
      </div>      
   </div>