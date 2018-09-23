package com.alphasta.cms.assess.webapp.taglibs;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alphasta.cms.model.AssessCell;
import com.alphasta.common.core.service.BaseManager;

/**
 * 公司考核提醒
 * 
 * @author zp
 * 
 */
@SuppressWarnings("serial")
public class RemindAuditTag extends BodyTagSupport {

	/*
	 * @see BodyTagSupport#doEndTag()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int doEndTag() throws JspException {
		try {
			BaseManager manager = (BaseManager) getBean("stuInfoManager");
			List<AssessCell> list = manager
					.query("from AssessCell where isPay = '0'");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd");
			for (int i = 0; i < list.size(); i++) {
				pageContext
						.getOut()
						.print(
								"<tr><td class='tdborder STYLE10' height='30px' align='left'><span style='float:left'>"
										+ (i + 1)
										+ "、<a href='#return' onclick='editAssessInfo("
										+ list.get(i).getAssessItem().getAssess().getId()
										+ ","+list.get(i).getId()+")'>"
										+ list.get(i).getEmployee().getName()
										+ "</td><td class='tdborder STYLE10' height='30px' align='left'>在"
										+ sdf.format(list.get(i).getAdate())
										+ "有未交罚款</a></span></td></tr>");
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
		ApplicationContext ctx = WebApplicationContextUtils
				.getWebApplicationContext(servletCtx);
		return ctx.getBean(beanName);
	}

}
