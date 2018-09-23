
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<%
  request.setAttribute("ctx", request.getContextPath());
%>
<html>
<head>
<title>石家庄立思辰留学360信息服务平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/common/extAll.jsp"%>
<LINK href="${ctx}/styles/style.css" type='text/css' rel='stylesheet'>
<LINK href="${ctx}/pages/layout.css" type='text/css' rel='stylesheet'>
</head>
<body>
<script type="text/javascript">
	
    Ext.onReady(function(){

       Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
       
       var viewport = new Ext.Viewport({
            layout:'border',
            items:[
                new Ext.BoxComponent({ // raw
                    region:'north',
                    el: 'north',
                    height:32                  
                }),{
                    region:'west',
                    id:'west-panel',
                    title:'信息平台系统菜单',
                    split:true,
                    width: 160,
                    minSize: 160,
                    maxSize: 400,
                    collapsible: true,
                    margins:'0 0 0 5',
                    layout:'accordion',
                    layoutConfig:{
                        animate:true
                    },
                    items: [
                    {
                        contentEl: 'west',
                        title:'学员信息管理',
                        html: document.getElementById('menu_stuinfo').innerHTML,
                        border:false,
                        iconCls:'catalog'
                    },
                    {
                        contentEl: 'west',
                        title:'现操作客户管理',
                        html: document.getElementById('menu_dealinginfo').innerHTML,
                        border:false,
                        iconCls:'catalog'
                    },
                    {
                        contentEl: 'west',
                        title:'学员佣金管理',
                        html: document.getElementById('menu_brokerage').innerHTML,
                        border:false,
                        iconCls:'catalog'
                    },
                     {
                        contentEl: 'west',
                        title:'学员成功案例管理',
                        html: document.getElementById('menu_successfulCase').innerHTML,
                        border:false,
                        iconCls:'catalog'
                    },
                    {
                        contentEl: 'west',
                        title:'移民信息管理',
                        html: document.getElementById('menu_yminfo').innerHTML,
                        border:false,
                        iconCls:'catalog'
                    },
                    {
                        contentEl: 'west',
                        title:'工作计划管理',
                        html: document.getElementById('menu_work').innerHTML,
                        border:false,
                        iconCls:'article'
                    },
                    <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_ADV,ROLE_ORADMIN,ROLE_AUDIT"> 
                    {
                        contentEl: 'west',
                        title:'同行电话管理',
                        html: document.getElementById('menu_tradetel').innerHTML,
                        border:false,
                        iconCls:'link'
                    },
                    </stc:role>
                    {
                        contentEl: 'west',
                        title:'员工考核管理',
                        html: document.getElementById('menu_assess').innerHTML,
                        border:false,
                        iconCls:'vote'
                    },
                    <stc:role ifAnyGranted="ROLE_ADMIN">
                    {                    
                        title:'系统管理',
                        html:document.getElementById('menu_sys').innerHTML,
                        border:false,
                        iconCls:'meet'
                    },
                    </stc:role>
                    
                    {                                     
                        title:'个人设置',
                        html:document.getElementById('menu_person').innerHTML,
                        border:false,
                        iconCls:'personSettings'
                    }]
                },
                
               {
                    region:'center',
                    contentEl: 'center',
                    split:true,
                    border:true,
                    margins:'0 5 0 0'
                }
             ]
        });
    });
	</script>
<%@include file="/pages/menu.jsp"%>
<div id="west"></div>
<div id="north" align="center" style="margin-top:4px;">
	<table width="99%">
	  <tr>
	    <td align="right" width="100%" style="color:#336699">
	      欢迎您：<stc:employeename/> 
	      |<a href="${ctx}/pages/index.jsp" target="_self" style="color:#336699">
	         后台管理
	      </a>
	      |<a href="${ctx}/j_acegi_logout" target="_self" style="color:#336699">
	         注销
	      </a>
	    </td>
	    
	  </tr>
	</table>
</div>
<div id="center"><iframe src="${ctx}/pages/welcome.jsp" id="main"
	name="main" style="width:100%; height:100%; border:0px;" frameborder="0" /></div>
</body>
</html>
