package com.alphasta.cms.dealing.webapp.taglibs;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alphasta.cms.model.DealingInfo;
import com.alphasta.common.core.service.BaseManager;
import com.alphasta.common.security.user.UserUtil;
import com.alphasta.common.security.user.model.User;

/**
 * 现操作客户提醒
 * 
 * @author zp
 * 
 */
@SuppressWarnings("serial")
public class DealingTag extends BodyTagSupport {

	/*
	 * @see BodyTagSupport#doEndTag()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int doEndTag() throws JspException {
		try {
			BaseManager manager = (BaseManager) getBean("dealingInfoManager");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Calendar c = Calendar.getInstance();
			c.set(Calendar.HOUR_OF_DAY, 0);
			c.set(Calendar.MINUTE, 0);
			c.set(Calendar.SECOND, 0);
			c.set(Calendar.MILLISECOND, 0);
			c.add(Calendar.DAY_OF_MONTH, 7);

			String dateStr1 = sdf.format(c.getTime());
			c.add(Calendar.DAY_OF_MONTH, 7);
			String dateStr2 = sdf.format(c.getTime());

			String params1 = "\"o_offerEndTime\":\"" + dateStr1 + "\",\"o_isAcceptOffer\":\"否\"";
			String params2 = "\"o_offerEndTime\":\"" + dateStr2 + "\",\"o_isAcceptOffer\":\"否\"";

			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			User user = UserUtil.getPrincipal(request);
			user = manager.get(User.class, user.getId());
			String countries = "('" + user.getEmployees().getCountries().replaceAll(" ", "").replaceAll(",", "','") + "')";

			List<DealingInfo> list1 = manager.query("from DealingInfo where otherEnrollSchool like ? and toCountry in " + countries, "%" + params1 + "%");
			List<DealingInfo> list2 = manager.query("from DealingInfo where otherEnrollSchool like ? and toCountry in " + countries, "%" + params2 + "%");

			for (int i = 0; i < list1.size(); i++) {
				DealingInfo dealing = list1.get(i);
				pageContext.getOut().write(
						"<tr><td class='tdborder STYLE10' height='25' width='150'>" + (i + 1) + "、学生姓名：<a href='../admin/dealinginfo/editDealingInfo.do?model.id=" + dealing.getId() + "'>"
								+ dealing.getName() + "</a></td><td class='tdborder STYLE10' style='text-align:right'>" + dateStr1 + "</td></tr>");
			}
			for (int i = 0; i < list2.size(); i++) {
				DealingInfo dealing = list2.get(i);
				pageContext.getOut().write(
						"<tr><td class='tdborder STYLE10' height='25' width='150'>" + (list1.size() + i + 1) + "、学生姓名：<a href='../admin/dealinginfo/editDealingInfo.do?model.id=" + dealing.getId() + "'>"
								+ dealing.getName() + "</a></td><td class='tdborder STYLE10' style='text-align:right'>" + dateStr2 + "</td></tr>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	/**
	 * 从spring中获取一个bean.
	 */
	public Object getBean(String beanName) {
		ServletContext servletCtx = pageContext.getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletCtx);
		return ctx.getBean(beanName);
	}

}
