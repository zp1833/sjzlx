package com.alphasta.cms.stuinfo.webapp.taglibs;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alphasta.cms.model.StuInfo;
import com.alphasta.common.core.service.BaseManager;
import com.alphasta.common.security.user.UserUtil;
import com.alphasta.common.security.user.model.User;

/**
 * 会计提醒
 * 
 * @author zp
 * 
 */
@SuppressWarnings("serial")
public class RemindFinanceTag extends BodyTagSupport {

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
			Calendar c = Calendar.getInstance();
			c.set(Calendar.HOUR_OF_DAY, 0);
			c.set(Calendar.MINUTE, 0);
			c.set(Calendar.SECOND, 0);
			c.set(Calendar.DAY_OF_MONTH, 1);
			c.set(Calendar.MONTH, c.get(Calendar.MONTH)-1);

			Date beginDate = c.getTime();
			
			String hql = "from StuInfo stu where stu.signStatus = 1 and (stu.signTime >= ? and stu.signTime <= ?) order by stu.signTime desc";
			list = manager.query(hql, new Object[] { beginDate, new Date() });

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			for (int i = 0; i < list.size(); i++) {
				print("<tr><td class='tdborder STYLE10' height='30px' align='left'>"
						+ (i + 1) + "、" + list.get(i).getStuName() + "</td>");
				print("<td class='tdborder STYLE10' align='center'>"
						+ list.get(i).getSignName() + "</td>");
				
				if (list.get(i).getSignTime() != null)
					print("<td class='tdborder STYLE10' align='right'>"
							+ sdf.format(list.get(i).getSignTime()) + "</td></tr>");
				else
					print("<td class='tdborder STYLE10' align='right'>未填写</td></tr>");;
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public void print(String s) throws Exception {
		pageContext.getOut().print(s);
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
