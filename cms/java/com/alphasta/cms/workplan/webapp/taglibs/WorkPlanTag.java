

package com.alphasta.cms.workplan.webapp.taglibs;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alphasta.cms.model.WorkPlan;
import com.alphasta.common.core.service.BaseManager;

/**
 * 工作计划提醒
 * 
 * @author zp
 * 
 */
@SuppressWarnings("serial")
public class WorkPlanTag extends BodyTagSupport {

	/*
	 * @see BodyTagSupport#doEndTag()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int doEndTag() throws JspException {
		try {
			//HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			//User user = UserUtil.getPrincipal(request);
			BaseManager manager = (BaseManager) getBean("stuInfoManager");

			/*
			 * Calendar c = Calendar.getInstance(); c.setTime(new Date());
			 * c.set(Calendar.HOUR_OF_DAY, 0); c.set(Calendar.MINUTE, 0);
			 * c.set(Calendar.SECOND, 0); c.set(Calendar.MILLISECOND, 0);
			 */

			/*
			 * List<WorkPlan> list = manager .query( "from WorkPlan where
			 * (startDate <= ? and endDate >= ? or startDate<= ? and endDate is
			 * null or startDate is null and endDate >= ?) and employee.id = ?",
			 * new Object[] { c.getTime(), c.getTime(),c.getTime(), c.getTime(),
			 * user.getEmployees().getId() });
			 */
			List<WorkPlan> list = manager.query("from WorkPlan where isDone = '0' or isDone is null");

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");

			for (int i = 0; i < list.size(); i++) {
				pageContext.getOut().print(
						"<tr><td height='30' style='color:#5555ff;font-size:14px' colspan='2'><font color='#000000'>"
								+ list.get(i).getEmpName()+"</font>"+sdf.format(list.get(i).getStartDate())
								+ " 至 " + sdf.format(list.get(i).getEndDate())
								+ "工作计划：</td></tr>");
				String tmp = list.get(i).getContent();
				if(list.get(i).getContent().length() > 9) {
					tmp = list.get(i).getContent().substring(0, 9);
				}
				pageContext.getOut().print(
						"<tr><td style='padding-left:10px;width:80%;height:30px'><a href='../admin/workplan/listWorkPlan.do?model.id="+list.get(i).getId()+"'>"
								+ tmp + "</a></td><td><font color='red'>(未完成)</font></td></tr>");
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
