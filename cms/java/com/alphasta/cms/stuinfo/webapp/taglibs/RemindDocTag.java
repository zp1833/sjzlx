package com.alphasta.cms.stuinfo.webapp.taglibs;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alphasta.cms.model.StuInfo;
import com.alphasta.common.Constants;
import com.alphasta.common.core.service.BaseManager;
import com.alphasta.common.security.user.UserUtil;
import com.alphasta.common.security.user.model.Role;
import com.alphasta.common.security.user.model.User;

/**
 * 文案提醒
 * 
 * @author zp
 * 
 */
@SuppressWarnings("serial")
public class RemindDocTag extends BodyTagSupport {

	/*
	 * @see BodyTagSupport#doEndTag()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int doEndTag() throws JspException {
		try {
			HttpServletRequest request = (HttpServletRequest) pageContext
					.getRequest();
			User user = UserUtil.getPrincipal(request);
			BaseManager manager = (BaseManager) getBean("stuInfoManager");

			user = manager.get(User.class, user.getId());

			List<StuInfo> list = null;

			if (this.isAdmin(user.getRoles()) || this.isAudit(user.getRoles())
					|| this.isOrAdmin(user.getRoles())) {
				
				Calendar c = Calendar.getInstance();
				c.set(Calendar.HOUR_OF_DAY, 0);
				c.set(Calendar.MINUTE, 0);
				c.set(Calendar.SECOND, 0);
				c.set(Calendar.DAY_OF_MONTH,1);
				
				Date beginDate = c.getTime();
				
				c.add(Calendar.MONTH, 1);
				c.set(Calendar.DAY_OF_MONTH, 0);
				
				Date endDate  = c.getTime();
				
				String hql = "from StuInfo stu where stu.signStatus = ? ";
				hql += "and ((stu.signTime >= ? and stu.signTime <= ?) ";
				hql += "or ((stu.isSubMarket != ? or stu.isSubMarket is null) or (stu.isNoticeSubMarket != ? or stu.isNoticeSubMarket is null))) ";
				hql += "and stu.advCountry in (";
				String[] countries = Constants.DOC_SHOW_COUNTRY.split(",");
				for(int i=0; i<countries.length; i++) {
					hql += "'"+countries[i]+"'";
					if(i<countries.length-1)
						hql += ",";
				}
				hql += ") order by stu.signTime desc";
				list = manager.query(hql, new Object[] { "1", beginDate, endDate, "1", "1" });

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				for (int i = 0; i < list.size(); i++) {
					pageContext.getOut().print(
							"<tr><td class='tdborder STYLE10' height='30px' align='left'><span style='float:left'>"
									+ (i + 1) + "、<a href='../admin/stuinfo/editStuInfo.do?flag=sign&model.id="+list.get(i).getId()+"'>" + list.get(i).getStuName()
									+ "</a></span>");
					if(list.get(i).getSignTime() != null) {
						pageContext.getOut().print("<span style='float:right'>签约日期："+sdf.format(list.get(i).getSignTime())+"</span></td></tr>");
					} else {
						pageContext.getOut().print("</td></tr>");
					}
					
					if(list.get(i).getNoticeReceTime() != null) {
						pageContext.getOut().print("<tr><td class='tdborder STYLE10' height='30px'>&nbsp;&nbsp;&nbsp;&nbsp;通知书收到时间："+sdf.format(list.get(i).getNoticeReceTime()));
						pageContext.getOut().print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='green'>(已完成)</font></td></tr>");
					} else {
						pageContext.getOut().print("<tr><td class='tdborder STYLE10' height='30px'>&nbsp;&nbsp;&nbsp;&nbsp;通知书收到时间");
						pageContext.getOut().print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='red'>(未完成)</font></td></tr>");
					}
					
					if(list.get(i).getVisaRecDate() != null) {
						pageContext.getOut().print("<tr><td class='tdborder STYLE10' height='30px'>&nbsp;&nbsp;&nbsp;&nbsp;签证收到时间："+sdf.format(list.get(i).getVisaRecDate()));
						pageContext.getOut().print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='green'>(已完成)</font></td></tr>");
					} else {
						pageContext.getOut().print("<tr><td class='tdborder STYLE10' height='30px'>&nbsp;&nbsp;&nbsp;&nbsp;签证收到时间");
						pageContext.getOut().print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='red'>(未完成)</font></td></tr>");
					}
				}
			} else {
				String hql = "from StuInfo stu where stu.signStatus = ? and (stu.docSendTime is null or stu.noticeReceTime is null or stu.sqTime is null or stu.visaRecDate is null) and stu.advCountry in (";
				String[] countries = Constants.DOC_SHOW_COUNTRY.split(",");
				for(int i=0; i<countries.length; i++) {
					hql += "'"+countries[i]+"'";
					if(i<countries.length-1)
						hql += ",";
				}
				hql += ")";
				list = manager.query(hql, "1");

				for (int i = 0; i < list.size(); i++) {
					pageContext
							.getOut()
							.print(
									"<tr><td class='tdborder' height='30px' align='left' colspan='2' style='font-size:14px;color:#4444AA;font-weight: bold'>"
											+ "<span style='float:left;width:100px'>"+(i + 1)
											+ "、"
											+ list.get(i).getStuName()+"</span>"+list.get(i).getAdvCountry()
											+ "</td></tr>");

					pageContext
							.getOut()
							.print(
									"<tr><td class='tdborder' height='30px' style='padding-left:15px;padding-right:10px'><span style='float:left' class='STYLE10'>");
					pageContext.getOut()
							.print(
									"<a href='../admin/stuinfo/editStuInfo.do?flag=school&model.id="
											+ list.get(i).getId()
											+ "'>学校申请</a></span>");

					if (list.get(i).getDocSendTime() == null) {
						pageContext
								.getOut()
								.print(
										"<span style='float:right' class='STYLE10'><font color='red'>(未完成)</font></span></td>");
					} else {
						pageContext
								.getOut()
								.print(
										"<span style='float:right' class='STYLE10'><font color='green'>(已完成)</font></span></td>");
					}

					pageContext
							.getOut()
							.print(
									"<td class='tdborder' height='30px' style='padding-left:15px;padding-right:10px'><span style='float:left' class='STYLE10'>");
					pageContext.getOut().print(
							"<a href='../admin/stuinfo/editStuInfo.do?flag=school&model.id="
									+ list.get(i).getId()
									+ "'>通知书收到</a></span>");

					if (list.get(i).getNoticeReceTime() == null) {
						pageContext
								.getOut()
								.print(
										"<span style='float:right' class='STYLE10'><font color='red'>(未完成)</font></span></td>");
					} else {
						pageContext
								.getOut()
								.print(
										"<span style='float:right' class='STYLE10'><font color='green'>(已完成)</font></span></td></tr>");
					}

					pageContext
							.getOut()
							.print(
									"<tr><td class='tdborder' height='30px' align='left' style='padding-left:15px;padding-right:10px'><span style='float:left' class='STYLE10'>");
					pageContext.getOut().print(
							"<a href='../admin/stuinfo/editStuInfo.do?flag=sign&model.id="
									+ list.get(i).getId() + "'>送签</a></span>");

					if (list.get(i).getSqTime() == null) {
						pageContext
								.getOut()
								.print(
										"<span style='float:right' class='STYLE10'><font color='red'>(未完成)</font></span></td>");
					} else {
						pageContext
								.getOut()
								.print(
										"<span style='float:right' class='STYLE10'><font color='green'>(已完成)</font></span></td>");
					}

					pageContext
							.getOut()
							.print(
									"<td class='tdborder' height='30px' align='left' style='padding-left:15px;padding-right:10px'><span style='float:left' class='STYLE10'>");
					pageContext.getOut()
							.print(
									"<a href='../admin/stuinfo/editStuInfo.do?flag=sign&model.id="
											+ list.get(i).getId()
											+ "'>签证收到</a></span>");

					if (list.get(i).getVisaRecDate() == null) {
						pageContext
								.getOut()
								.print(
										"<span style='float:right' class='STYLE10'><font color='red'>(未完成)</font></span></td>");
					} else {
						pageContext
								.getOut()
								.print(
										"<span style='float:right' class='STYLE10'><font color='green'>(已完成)</font></span></td></tr>");
					}

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	/**
	 * 判断登录用户角色是否为管理员
	 * 
	 * @return
	 */
	private boolean isAdmin(Set<Role> roles) {
		boolean flag = false;
		for (Role role : roles) {
			if (role.getName().equals(Constants.ROLE_ADMIN)) {
				flag = true;
				break;
			}
		}
		return flag;

	}
	
	/**
	 * 判断是否具有考核员角色
	 * @param roles
	 * @return
	 */
	private boolean isAudit(Set<Role> roles) {
		boolean flag = false;
		for (Role role : roles) {
			if (role.getName().equals("ROLE_AUDIT")) {
				flag = true;
				break;
			}
		}
		return flag;

	}

	private boolean isOrAdmin(Set<Role> roles) {
		boolean flag = false;
		for (Role role : roles) {
			if (role.getName().equals(Constants.ROLE_ORADMIN)) {
				flag = true;
				break;
			}
		}
		return flag;

	}

	/**
	 * 从spring中获取一个bean.
	 */
	public Object getBean(String beanName) {
		ServletContext servletCtx = pageContext.getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils
				.getWebApplicationContext(servletCtx);
		return ctx.getBean(beanName);
	}

}
