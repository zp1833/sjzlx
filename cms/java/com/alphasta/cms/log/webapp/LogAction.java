package com.alphasta.cms.log.webapp;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.alphasta.cms.log.service.LogManager;
import com.alphasta.cms.model.Operationlog;
import com.alphasta.common.core.util.Ip2Long;
import com.alphasta.common.core.webapp.struts2.BaseECLimitQueryAction;

/**
 * 日志管理action
 * 
 * @author zhaopeng
 * 
 */
@SuppressWarnings( { "serial", "unchecked" })
public class LogAction extends BaseECLimitQueryAction<Operationlog, LogManager> {

	private String operateUser;

	private Date beginDate;

	private Date endDate;

	private String beginIp;

	private String endIp;

	@Override
	protected DetachedCriteria setupDetachedCriteria() {
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Operationlog.class);
		
		if(StringUtils.isNotBlank(operateUser)) {
			criteria.add(Restrictions.eq("username", operateUser));
		}
		
		if(beginDate != null) {
			criteria.add(Restrictions.ge("operatedate", beginDate));
		}
		
		if(endDate != null) {
			criteria.add(Restrictions.le("operatedate", endDate));
		}
		
		if(StringUtils.isNotBlank(beginIp)) {
			criteria.add(Restrictions.ge("ipnum", Ip2Long.ipToLong(beginIp)));
		}
		
		if(StringUtils.isNotBlank(endIp)) {
			criteria.add(Restrictions.le("ipnum", Ip2Long.ipToLong(endIp)));
		}
		
		criteria.addOrder(Order.desc("operatedate"));
		
		return criteria;
	}
	

	public String getOperateUser() {
		return operateUser;
	}


	public void setOperateUser(String operateUser) {
		this.operateUser = operateUser;
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

	public String getBeginIp() {
		return beginIp;
	}

	public void setBeginIp(String beginIp) {
		this.beginIp = beginIp;
	}

	public String getEndIp() {
		return endIp;
	}

	public void setEndIp(String endIp) {
		this.endIp = endIp;
	}

}
