package com.alphasta.cms.brokerage.webapp.taglibs;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alphasta.cms.model.Brokerage;
import com.alphasta.common.core.service.BaseManager;
import com.alphasta.common.security.user.UserUtil;
import com.alphasta.common.security.user.model.User;

/**
 * 每日回访提醒
 * 
 * @author zp
 * 
 */
@SuppressWarnings("serial")
public class RemindTag extends BodyTagSupport {

	/*
	 * @see BodyTagSupport#doEndTag()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int doEndTag() throws JspException {
		try {
			BaseManager manager = (BaseManager) getBean("brokerageManager");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Calendar c = Calendar.getInstance();
			c.set(Calendar.HOUR_OF_DAY, 0);
			c.set(Calendar.MINUTE, 0);
			c.set(Calendar.SECOND, 0);
			c.set(Calendar.MILLISECOND, 0);
			c.add(Calendar.DAY_OF_MONTH, -30);

			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			User user = UserUtil.getPrincipal(request);
			user = manager.get(User.class, user.getId());
			String countries = "('" + user.getEmployees().getCountries().replaceAll(" ", "").replaceAll(",", "','")
					+ "')";

			List<Brokerage> list = manager.query("from Brokerage where isAllBrokerageArrived = ? and country in "
					+ countries + " order by createTime", "否");

			for (int i = 0; i < list.size(); i++) {
				Brokerage brokerage = list.get(i);
				String langBeginDate = brokerage.getLangBeginDate() != null ? sdf.format(brokerage.getLangBeginDate())
						: "未选择";
				String speBeginDate = brokerage.getSpeBeginDate() != null ? sdf.format(brokerage.getSpeBeginDate())
						: "未选择";
				String lastArriveDate = "";
				if(brokerage.getLastBrokerageArriveDate() != null) {
					lastArriveDate = sdf.format(brokerage.getLastBrokerageArriveDate());
					if("2000-01-01".equals(lastArriveDate))
						lastArriveDate = "N/A";
				}
				pageContext.getOut().write(
						"<tr><td class='tdborder STYLE10' height='25' width='150'>" + (i + 1)
								+ "、学生姓名：<a href='../admin/brokerage/editBrokerage.do?model.id=" + brokerage.getId()
								+ "'>" + brokerage.getStuName()
								+ "</a></td><td class='tdborder STYLE10' width='100'>所去国家：" + brokerage.getCountry()
								+ "</td><td class='tdborder STYLE10' width='170'>语言开课时间：" + langBeginDate
								+ "</td><td class='tdborder STYLE10' width='180'>专业课开课时间：" + speBeginDate
								+ "</td><td class='tdborder STYLE10' width='110'>全额佣金到账："
								+ brokerage.getIsAllBrokerageArrived()
								+ "</td><td class='tdborder STYLE10' width='170'>合作方预计返佣周期："
								+ brokerage.getPartnerPeriod()
								+ "</td><td class='tdborder STYLE10' width='160'>剩余佣金金额："
								+ brokerage.getLastBrokerageNum()
								+ "</td><td class='tdborder STYLE10' width='200'>剩余佣金预计返还时间：" + lastArriveDate
								+ "</td><td class='tdborder STYLE10'>&nbsp;</td></tr>");
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
