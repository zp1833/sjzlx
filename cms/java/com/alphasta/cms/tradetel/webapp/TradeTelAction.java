package com.alphasta.cms.tradetel.webapp;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.alphasta.cms.model.Employees;
import com.alphasta.cms.model.TradeTel;
import com.alphasta.cms.tradetel.service.TradeTelManager;
import com.alphasta.common.Constants;
import com.alphasta.common.core.webapp.struts2.BaseECLimitQueryAction;
import com.alphasta.common.security.user.model.Role;

/**
 * 同行电话管理action
 * 
 * @author zhaopeng
 * 
 */
@SuppressWarnings( { "serial", "unchecked" })
public class TradeTelAction extends
		BaseECLimitQueryAction<TradeTel, TradeTelManager> {

	private Date beginDate;

	private Date endDate;

	public String saveTradeTel() {
		if (model.getId() == null) {
			model.setEmployee(this.getUser().getEmployees());
		}
		if (model.getEmployee() != null && model.getEmployee().getId() != null) {
			model.setEmployee(this.getManager().get(Employees.class,
					model.getEmployee().getId()));
		}
		this.save();
		return SUCCESS;
	}

	@Override
	protected DetachedCriteria setupDetachedCriteria() {
		DetachedCriteria c = DetachedCriteria.forClass(TradeTel.class);

		if (beginDate != null)
			c.add(Restrictions.ge("createDate", beginDate));
		if (endDate != null)
			c.add(Restrictions.le("createDate", endDate));

		if (!isFinance(getUser().getRoles()) && !isAdmin(getUser().getRoles())
				&& !isOrAdmin(getUser().getRoles()))
			c.add(Restrictions.eq("employee", getUser().getEmployees()));
		
		if(isFinance(getUser().getRoles()) || isAdmin(getUser().getRoles()) || isOrAdmin(getUser().getRoles())) {
			if(model.getEmployee() != null && model.getEmployee().getId() != null) {
				c.add(Restrictions.eq("employee.id", model.getEmployee().getId()));
			}
		}
		
		this.setupSort(c);
		
		return c;
	}

	private boolean isAdmin(Set<Role> roles) {
		boolean flag = false;
		for (Role role : roles) {
			if (role.getName().equals("ROLE_ADMIN")) {
				flag = true;
				break;
			}
		}
		return flag;

	}

	private boolean isOrAdmin(Set<Role> roles) {
		boolean flag = false;
		for (Role role : roles) {
			if (role.getName().equals("ROLE_ORADMIN")) {
				flag = true;
				break;
			}
		}
		return flag;

	}
	
	private boolean isFinance(Set<Role> roles) {
		boolean flag = false;
		for (Role role : roles) {
			if (role.getName().equals("ROLE_FINANCE")) {
				flag = true;
				break;
			}
		}
		return flag;

	}

	public String removeTradeTel(String[] telArray) {
		try {
			for (int i = 0; i < telArray.length; i++) {
				Integer id = Integer.parseInt(telArray[i]);
				TradeTel tradeTel = (TradeTel) getManager().get(TradeTel.class,
						id);
				this.getManager().remove(tradeTel);
				this.getManager().addOperatorLog(Constants.OPERATION_DELETE,
						tradeTel);
			}
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}
	
	public List getAllEmps() {
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

}
