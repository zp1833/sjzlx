package com.alphasta.cms.assess.webapp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;

import com.alphasta.cms.assess.service.AssessManager;
import com.alphasta.cms.model.Assess;
import com.alphasta.cms.model.AssessCell;
import com.alphasta.cms.model.AssessItem;
import com.alphasta.common.Constants;
import com.alphasta.common.core.webapp.struts2.BaseECLimitQueryAction;
import com.alphasta.common.security.user.model.Role;

/**
 * 员工考核管理action
 * 
 * @author zhaopeng
 * 
 */
@SuppressWarnings( { "serial", "unchecked" })
public class AssessAction extends BaseECLimitQueryAction<Assess, AssessManager> {

	private Date beginDate;

	private Date endDate;

	private String[] itemNames;

	private String[] descns;
	
	private Integer[] hasItemIds;
	
	private String[] hasItemNames;
	
	private String[] hasItemDescns;

	private AssessCell assessCell;

	private Date[] assessDates;

	public String saveAssess() {
		if (StringUtils.isBlank(model.getName())) {
			this.addActionError("请填写考核表名称！");
			return INPUT;
		}
		String assessDate = this.getRequest().getParameter("assessDate");
		if (StringUtils.isBlank(assessDate)) {
			this.addActionError("请选择考核月份！");
			return INPUT;
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		try {
			model.setAdate(sdf.parse(assessDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		this.getManager().save(model);
		
		if(hasItemIds != null) {
			for (int i = 0; i < hasItemIds.length; i++) {
				AssessItem ai = new AssessItem();
				ai.setId(hasItemIds[i]);
				ai.setName(hasItemNames[i]);
				ai.setDescn(hasItemDescns[i]);
				ai.setAssess(model);
				this.getManager().save(ai);
			}
		}
		
		if(!"".equals(this.getRequest().getParameter("assessId"))) {
			List<AssessItem> copyItems = this.getManager().query("from AssessItem where assess.id = ?", Integer.valueOf(getRequest().getParameter("assessId")));
			for(AssessItem ai : copyItems) {
				AssessItem assessItem = new AssessItem();
				assessItem.setName(ai.getName());
				assessItem.setDescn(ai.getDescn());
				assessItem.setAssess(model);
				this.getManager().save(assessItem);
			}
		}

		if (itemNames != null)
			for (int i = 0; i < itemNames.length; i++) {
				AssessItem ai = new AssessItem();
				ai.setName(itemNames[i]);
				ai.setDescn(descns[i]);
				ai.setAssess(model);
				this.getManager().save(ai);
			}

		return SUCCESS;

	}

	public String editAssessInfo() {

		if ("add".equals(this.getRequest().getParameter("action")))
			return "edit";

		if (!Integer.valueOf(0).equals(assessCell.getId()))
			assessCell = getManager().get(AssessCell.class, assessCell.getId());
		if (isAdmin(getUser().getRoles()) || isAudit(getUser().getRoles())) {
			return "edit";
		}
		return "look";
	}
	
	public List getCurrentTables() {
		if(model.getId() == null)
			model.setId(0);
		return this.getManager().query("from Assess where id != ? order by adate desc", model.getId());
	}

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

	public List getAssessItemsById() {
		return this.getManager().query(
				"from AssessItem where assess.id = ? order by id",
				model.getId());
	}

	@Override
	protected DetachedCriteria setupDetachedCriteria() {
		DetachedCriteria c = DetachedCriteria.forClass(Assess.class);
		this.setupSort(c);
		return c;
	}

	public List<Date> getDaysInCurrentMonth() {
		model = this.getManager().get(Assess.class, model.getId());
		Calendar c = Calendar.getInstance();
		c.setTime(model.getAdate());
		int num = c.getActualMaximum(Calendar.DATE);
		List list = new ArrayList();
		for (int i = 1; i <= num; i++) {
			c.set(Calendar.DATE, i);
			list.add(c.getTime());
		}
		return list;
	}

	public List getEmployees() {
		return this.getManager().query(
				"from Employees emp where emp.user.status = '1'");
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date[] getAssessDates() {
		return assessDates;
	}

	public void setAssessDates(Date[] assessDates) {
		this.assessDates = assessDates;
	}

	public String[] getItemNames() {
		return itemNames;
	}

	public void setItemNames(String[] itemNames) {
		this.itemNames = itemNames;
	}

	public String[] getDescns() {
		return descns;
	}

	public void setDescns(String[] descns) {
		this.descns = descns;
	}

	public AssessCell getAssessCell() {
		return assessCell;
	}

	public void setAssessCell(AssessCell assessCell) {
		this.assessCell = assessCell;
	}

	public Integer[] getHasItemIds() {
		return hasItemIds;
	}

	public void setHasItemIds(Integer[] hasItemIds) {
		this.hasItemIds = hasItemIds;
	}

	public String[] getHasItemNames() {
		return hasItemNames;
	}

	public void setHasItemNames(String[] hasItemNames) {
		this.hasItemNames = hasItemNames;
	}

	public String[] getHasItemDescns() {
		return hasItemDescns;
	}

	public void setHasItemDescns(String[] hasItemDescns) {
		this.hasItemDescns = hasItemDescns;
	}
}
