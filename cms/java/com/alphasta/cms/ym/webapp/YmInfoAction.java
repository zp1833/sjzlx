package com.alphasta.cms.ym.webapp;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.alphasta.cms.model.Employees;
import com.alphasta.cms.model.StuInfo;
import com.alphasta.cms.model.YmInfo;
import com.alphasta.cms.ym.service.YmInfoManager;
import com.alphasta.common.Constants;
import com.alphasta.common.core.webapp.struts2.BaseECLimitQueryAction;
import com.alphasta.common.security.user.model.Role;

/**
 * 学员信息管理action
 * 
 * @author zhaopeng
 * 
 */
@SuppressWarnings( { "serial", "unchecked" })
public class YmInfoAction extends BaseECLimitQueryAction<YmInfo, YmInfoManager> {

	private String name;

	private String country;

	private String type;

	private String currPlan;

	private String currGrade;

	private Date beginAdvDate;

	private Date endAdvDate;

	private Date beginSignDate;

	private Date endSignDate;

	private Date beginVisitDate;

	private Date endVisitDate;

	private Date visitDate;

	private int currentPageNo;

	private String modifyFlag;

	private String showType;

	/**
	 * 自定义显示的字段
	 */
	private String definedField;

	/**
	 * 自定义查询条件
	 */
	private String definedSearch;

	/**
	 * 手填的咨询国家
	 */
	private String otherCountry;

	public void setOtherCountry(String otherCountry) {
		this.otherCountry = otherCountry;
	}

	public String saveYmInfo() {

		if ("0".equals(model.getAdvCountry())) {
			model.setAdvCountry("#" + model.getOtherCountry());
		}

		save();

		if (this.isRec(this.getUser().getRoles())) {
			return null;
		}

		return SUCCESS;
	}

	@Override
	protected DetachedCriteria setupDetachedCriteria() {
		DetachedCriteria c = DetachedCriteria.forClass(model.getClass());

		if (StringUtils.isNotBlank(model.getStuName()))
			c.add(Restrictions.like("stuName", "%" + model.getStuName() + "%"));

		if (StringUtils.isNotBlank(model.getContact()))
			c.add(Restrictions.like("contact", "%" + model.getContact() + "%"));

		if (beginAdvDate != null)
			c.add(Restrictions.ge("advDate", beginAdvDate));

		if (endAdvDate != null)
			c.add(Restrictions.le("advDate", endAdvDate));

		if (beginSignDate != null)
			c.add(Restrictions.ge("signTime", beginSignDate));

		if (endSignDate != null)
			c.add(Restrictions.le("signTime", endSignDate));

		if (beginVisitDate != null)
			c.add(Restrictions.ge("nextVisitTime", beginVisitDate));

		if (endVisitDate != null)
			c.add(Restrictions.le("nextVisitTime", endVisitDate));

		if (StringUtils.isNotBlank(model.getCurrentPlan()))
			c.add(Restrictions.eq("currentPlan", model.getCurrentPlan()));

		if (StringUtils.isNotBlank(model.getStuType()))
			c.add(Restrictions.eq("stuType", model.getStuType()));

		if (StringUtils.isNotBlank(model.getYmType()))
			c.add(Restrictions.eq("ymType", model.getYmType()));

		if ("0".equals(showType)) {
			c.add(Restrictions.in("stuType", new String[] { "签约率90%以上", "签约率80%", "签约率50%", "签约率20%" }));
		} else if ("1".equals(showType)) {
			c.add(Restrictions.or(Restrictions.eq("stuType", "已签约"), Restrictions.eq("stuType", "交订金")));
			c.add(Restrictions.ne("currentPlan", "后期服务"));
		} else if ("2".equals(showType)) {
			c.add(Restrictions.eq("stuType", "沉默客户"));
		} else if ("3".equals(showType)) {
			c.add(Restrictions.eq("stuType", "长期客户"));
		} else if ("4".equals(showType)) {
			c.add(Restrictions.eq("stuType", "退费"));
			c.add(Restrictions.eq("currentPlan", "退费"));
		} else if ("success".equals(showType)) {
			c.add(Restrictions.eq("currentPlan", "后期服务"));
			c.add(Restrictions.eq("stuType", "已签约"));
		}

		if (StringUtils.isNotBlank(model.getAdvisor()))
			c.add(Restrictions.eq("advisor", model.getAdvisor()));

		if (isAdv(getUser().getRoles()) && !isAdmin(getUser().getRoles()) && !isAudit(getUser().getRoles())) {
			c.add(Restrictions.eq("advisor", getUser().getEmployees().getName()));
		}

		if (StringUtils.isNotBlank(this.definedSearch)) {
			String[] params = this.definedSearch.split("\\|\\$\\|");
			if (params.length >= 2) {
				c.add(Restrictions.like(params[0], "%" + params[1] + "%"));
			}
		}

		if (StringUtils.isNotBlank(model.getAdvCountry()))
			c.add(Restrictions.eq("advCountry", model.getAdvCountry()));

		// c.addOrder(Order.desc("id"));
		this.setupSort(c);
		return c;
	}

	/**
	 * 判断登录用户角色是否为顾问
	 * 
	 * @return
	 */
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

	private boolean isRec(Set<Role> roles) {
		boolean flag = false;
		for (Role role : roles) {
			if (role.getName().equals("ROLE_REC")) {
				flag = true;
				break;
			}
		}
		return flag;

	}

	private boolean isDoc(Set<Role> roles) {
		boolean flag = false;
		for (Role role : roles) {
			if (role.getName().equals(Constants.ROLE_DOC)) {
				flag = true;
				break;
			}
		}
		return flag;

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

	public String removeStuInfos(String[] stusArray) {
		try {
			for (int i = 0; i < stusArray.length; i++) {
				Integer stuId = Integer.parseInt(stusArray[i]);
				StuInfo stuInfo = (StuInfo) getManager().get(StuInfo.class, stuId);
				this.getManager().remove(stuInfo);
				this.getManager().addOperatorLog(Constants.OPERATION_DELETE, stuInfo);
			}
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}

	public List<Employees> getDeptAdvEmps() {
		return getManager().query("from Employees emp where emp.dept.id = ? and emp.user.status = '1'", new Object[] { getUser().getEmployees().getDept().getId() });
	}

	public List<Employees> getAdvEmps() {
		return getManager().query("from Employees emp where (emp.dept.id=? or emp.dept.parentDept.id=?) and emp.user.status = '1'", new Object[] { Constants.ADV_DEPT_ID, Constants.ADV_DEPT_ID });
	}

	public List<Employees> getDocEmps() {
		return getManager().query("from Employees emp where (emp.dept.id=? or emp.isDoDoc='1') and emp.user.status = '1'", Constants.DOC_DEPT_ID);
	}

	public List<Employees> getAllEmps() {
		return getManager().query("from Employees emp where emp.user.status = ?", "1");
	}

	public Date getBeginAdvDate() {
		return beginAdvDate;
	}

	public void setBeginAdvDate(Date beginAdvDate) {
		this.beginAdvDate = beginAdvDate;
	}

	public Date getEndAdvDate() {
		return endAdvDate;
	}

	public void setEndAdvDate(Date endAdvDate) {
		this.endAdvDate = endAdvDate;
	}

	public Date getBeginSignDate() {
		return beginSignDate;
	}

	public void setBeginSignDate(Date beginSignDate) {
		this.beginSignDate = beginSignDate;
	}

	public Date getEndSignDate() {
		return endSignDate;
	}

	public void setEndSignDate(Date endSignDate) {
		this.endSignDate = endSignDate;
	}

	public String getDefinedField() {
		return definedField;
	}

	public void setDefinedField(String definedField) {
		this.definedField = definedField;
	}

	public Date getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}

	public String getDefinedSearch() {
		return definedSearch;
	}

	public void setDefinedSearch(String definedSearch) {
		this.definedSearch = definedSearch;
	}

	public Date getBeginVisitDate() {
		return beginVisitDate;
	}

	public void setBeginVisitDate(Date beginVisitDate) {
		this.beginVisitDate = beginVisitDate;
	}

	public Date getEndVisitDate() {
		return endVisitDate;
	}

	public void setEndVisitDate(Date endVisitDate) {
		this.endVisitDate = endVisitDate;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCurrPlan() {
		return currPlan;
	}

	public void setCurrPlan(String currPlan) {
		this.currPlan = currPlan;
	}

	public String getModifyFlag() {
		return modifyFlag;
	}

	public void setModifyFlag(String modifyFlag) {
		this.modifyFlag = modifyFlag;
	}

	public String getCurrGrade() {
		return currGrade;
	}

	public void setCurrGrade(String currGrade) {
		this.currGrade = currGrade;
	}

	public String getShowType() {
		return showType;
	}

	public void setShowType(String showType) {
		this.showType = showType;
	}

}
