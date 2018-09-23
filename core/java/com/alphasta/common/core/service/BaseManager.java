package com.alphasta.common.core.service;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;

import com.alphasta.cms.model.Employees;
import com.alphasta.cms.model.Operationlog;
import com.alphasta.common.Constants;
import com.alphasta.common.core.annotation.LogAnnotation;
import com.alphasta.common.core.annotation.LogTargetAnnotation;
import com.alphasta.common.core.dao.hibernate.DAO;
import com.alphasta.common.core.dao.support.Page;
import com.alphasta.common.core.model.BaseModel;
import com.alphasta.common.core.model.CmsThreadBean;
import com.alphasta.common.core.util.DateUtil;
import com.alphasta.common.core.util.Ip2Long;
import com.alphasta.common.security.user.model.User;

/**
 * <code>Manager</code>接口的实现类。作为Service层的基类使用。 将<code>DAO</code>的实例注入，以实现基本的CRUD方法。
 * 
 * @author Sam Lee
 * 
 */
@SuppressWarnings("unchecked")
public class BaseManager implements Manager {
	/**
	 * Log,子类可以直接使用，不必重新声明
	 */
	protected Log log = LogFactory.getLog(getClass());
	/**
	 * Common Data Access Object
	 */
	private DAO dao;

	public void setDao(DAO dao) {
		this.dao = dao;
	}

	/**
	 * @see Manager#getDao()
	 */
	public DAO getDao() {
		return dao;
	}

	/**
	 * @see Manager#getDao()
	 */
	public List executeSql(String sql) {
		return this.getDao().executeSql(sql);
	}

	/**
	 * @see Manager#getDao()
	 */
	public Object executeUpdate(String sql) {
		return this.getDao().executeUpdate(sql);
	}

	/**
	 * @see Manager#exists(java.lang.Object, java.lang.String[])
	 */
	public boolean exists(Object entity, String... propertyNames) {
		return getDao().isAlreadyExists(entity, propertyNames);
	}

	/**
	 * @see Manager#get(java.lang.Class, java.io.Serializable)
	 */
	public <T> T get(Class<T> entityClass, Serializable id) {
		return getDao().getObject(entityClass, id);
	}

	/**
	 * @see Manager#get(java.lang.Class)
	 */
	public <T> List<T> get(Class<T> entityClass) {
		return getDao().getObjects(entityClass);
	}

	/**
	 * @see Manager#query(org.hibernate.criterion.DetachedCriteria, int, int)
	 */
	public Page query(DetachedCriteria criteria, int pageNo, int pageSize) {
		return getDao().pagedQuery(criteria, pageNo, pageSize);
	}

	/**
	 * @see Manager#query(org.hibernate.criterion.DetachedCriteria)
	 */
	public List query(DetachedCriteria criteria) {
		return getDao().getHibernateTemplate().findByCriteria(criteria);
	}

	/**
	 * @see Manager#query(java.lang.String, int, int, java.lang.Object[])
	 */
	public Page query(String hql, int pageNo, int pageSize, Object... objects) {
		return getDao().pagedQuery(hql, pageNo, pageSize, objects);
	}

	/**
	 * @see Manager#query(java.lang.String, java.lang.Object[])
	 */
	public List query(String hql, Object... objects) {
		return getDao().find(hql, objects);
	}

	/**
	 * @see Manager#remove(java.lang.Object)
	 */
	@LogAnnotation(operateDescribe = "删除")
	public void remove(Object object) {
		getDao().removeObject(object);
	}

	/**
	 * @see Manager#save(java.lang.Object)
	 */
	@LogAnnotation(operateDescribe = "编辑")
	public void save(Object object) {
		getDao().saveObject(object);
	}

	public void addOperatorLog(String operationType, BaseModel model) {
	
		addOperatorLog(operationType, model, "");
	}
	
	public void addOperatorLog(String operationType, BaseModel model,
			String customer) {
		try {
			HttpServletRequest request = CmsThreadBean.getContext();
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
			Employees employees = get(Employees.class, user.getEmployees().getId());
			if (request != null && user != null) {
				StringBuffer operateDescribe = new StringBuffer();
				String ip = request.getRemoteAddr();
				LogTargetAnnotation targer = (LogTargetAnnotation) model
						.getClass().getAnnotation(LogTargetAnnotation.class);
				operateDescribe.append(operationType);
				operateDescribe.append(targer.classDescribe());
				operateDescribe.append("  编号为:");
				operateDescribe.append(getId(model.toString()));
				operateDescribe.append(";内容为:");
				operateDescribe.append(model.getLogContent());
				if (!"".equals(customer))
					operateDescribe.append(customer);
				Operationlog log = new Operationlog();
				log.setOperatedate(DateUtil.getCurrentDate());
				log.setOperation(operateDescribe.toString());
				log.setUserid(user.getId());
				log.setUsername(user.getUsername());
				log.setDeptName(employees.getDept().getName());
				log.setIp(ip);
				log.setIpnum(Ip2Long.ipToLong(ip));
				save(log);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("日志出错。。。。。。");
		}
	}

	/**
	 * 通过Model对象，取得对象ID
	 * 
	 * @param objname
	 * @return
	 */
	private String getId(String objname) {
		int start = objname.indexOf("[id=") + 4;
		objname = objname.substring(start, objname.length() - 1);
		return objname;
	}

}
