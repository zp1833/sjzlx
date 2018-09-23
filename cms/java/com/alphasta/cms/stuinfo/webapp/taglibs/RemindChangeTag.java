package com.alphasta.cms.stuinfo.webapp.taglibs;

import java.text.SimpleDateFormat;
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
 * 顾问工作交接提醒
 * 
 * @author zp
 * 
 */
@SuppressWarnings("serial")
public class RemindChangeTag extends BodyTagSupport {

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

			String hql = null;

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (this.isAdv(user.getRoles())) {
				hql = "from StuInfo stu where stu.signStatus = 1 and stu.advisor='"
						+ user.getEmployees().getName()
						+ "' and (stu.doAuthTime is null or stu.doStayTime is null or stu.doLoanTime is null "
						+ "or stu.buyDraftTime is null or stu.bookTicketTime is null or stu.flyTime is null "
						+ "or stu.takeScoreTime is null or stu.pickUpPlanTime is null or stu.fallTime is null "
						+ "or stu.giveMoneyTime is null or stu.pickUpAskTime is null) order by signTime desc";
			} else {
				hql = "from StuInfo stu where stu.signStatus = 1 and "
						+ "(stu.doAuthTime is null or stu.doStayTime is null or stu.doLoanTime is null "
						+ "or stu.buyDraftTime is null or stu.bookTicketTime is null or stu.flyTime is null "
						+ "or stu.takeScoreTime is null or stu.pickUpPlanTime is null or stu.fallTime is null "
						+ "or stu.giveMoneyTime is null or stu.pickUpAskTime is null) order by signTime desc";
			}

			list = manager.query(hql);

			for (int i = 0; i < list.size(); i++) {
				print("<tr><td class='tdborder STYLE10' height='30px' align='left'><span style='float:left'>"
						+ (i + 1)
						+ "、<a href='../admin/stuinfo/editStuInfo.do?flag=service&model.id="
						+ list.get(i).getId()
						+ "'>"
						+ list.get(i).getStuName()
						+ "</a></span>");

				if (list.get(i).getSignTime() != null)
					print("<span style='float:right'>签约日期："
							+ sdf.format(list.get(i).getSignTime())
							+ "</span></td></tr>");
				else
					print("<span style='float:right'>签约日期：未填写</span></td></tr>");

				if (list.get(i).getDoAuthTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;做认证："
							+ sdf.format(list.get(i).getDoAuthTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;做认证</span>");
					print("<span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getDoStayTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;住宿安排："
							+ sdf.format(list.get(i).getDoStayTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;住宿安排");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getDoLoanTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;做贷款："
							+ sdf.format(list.get(i).getDoLoanTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;做贷款");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getBuyDraftTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;买汇票："
							+ sdf.format(list.get(i).getBuyDraftTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;买汇票");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getBookTicketTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;机票预订："
							+ sdf.format(list.get(i).getBookTicketTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;机票预订");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getFlyTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;起飞时间："
							+ sdf.format(list.get(i).getFlyTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;起飞时间");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getTakeScoreTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;调取高考成绩："
							+ sdf.format(list.get(i).getTakeScoreTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;调取高考成绩");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getPickUpPlanTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;接机安排："
							+ sdf.format(list.get(i).getPickUpPlanTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;接机安排");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getFallTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;落地时间："
							+ sdf.format(list.get(i).getFallTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;落地时间");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getGiveMoneyTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;电汇学费或押金："
							+ sdf.format(list.get(i).getGiveMoneyTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;电汇学费或押金");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getPickUpAskTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;接机问候："
							+ sdf.format(list.get(i).getPickUpAskTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;接机问候");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}

				if (list.get(i).getGiveMoneyTime() != null) {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;电汇学费或押金："
							+ sdf.format(list.get(i).getGiveMoneyTime()));
					print("</span><span style='float:right'><font color='green'>(已完成)</font></span></td></tr>");
				} else {
					print("<tr><td class='tdborder STYLE10' height='30px'><span style='float:left'>&nbsp;&nbsp;电汇学费或押金");
					print("</span><span style='float:right'><font color='red'>(未完成)</font></span></td></tr>");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public void print(String s) throws Exception {
		pageContext.getOut().print(s);
	}

	private boolean isAdv(Set<Role> roles) {
		boolean flag = false;
		for (Role role : roles) {
			if (role.getName().equals(Constants.ROLE_ADV)) {
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
