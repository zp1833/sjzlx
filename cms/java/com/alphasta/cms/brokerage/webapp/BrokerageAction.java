package com.alphasta.cms.brokerage.webapp;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.alphasta.cms.brokerage.service.BrokerageManager;
import com.alphasta.cms.model.Brokerage;
import com.alphasta.cms.model.Employees;
import com.alphasta.cms.model.SuccessfulCase;
import com.alphasta.common.Constants;
import com.alphasta.common.core.webapp.struts2.BaseECLimitQueryAction;
import com.alphasta.common.security.user.model.Role;

/**
 * 佣金管理action
 * 
 * @author zhaopeng
 * 
 */
@SuppressWarnings( { "serial" })
public class BrokerageAction extends BaseECLimitQueryAction<Brokerage, BrokerageManager> {

	private Date beginDate;

	private Date endDate;

	/**
	 * 自定义显示的字段
	 */
	private String definedField;

	/**
	 * 自定义查询条件
	 */
	private String definedSearch;

	private String langTuition_m;

	private String langBrokerage_m;

	private String speTuition_m;

	private String speBrokerage_m;

	private String brokerageArriveNum_m;

	private String brokerageArriveNum2_m;

	private String lastBrokerageNum_m;

	private String matchName;

	private String isAll;
	
	private String countries = "美国,加拿大,澳大利亚,新西兰,香港,英国,日本,韩国,法国,新加坡,爱尔兰,马来西亚,俄罗斯,荷兰,西班牙,德国,挪威,瑞典,丹麦,芬兰,瑞士,匈牙利";

	private HashMap<String, Object> stuInfo;

	@SuppressWarnings("unchecked")
	public String getMoreInfoFromSuccessfulCase() {

		List<SuccessfulCase> match = getManager().query("from SuccessfulCase suc where suc.name = ? ", matchName);
		stuInfo = new HashMap<String, Object>();
		if (match.size() > 0) {
			stuInfo.put("stuInfos", match.get(0));
			stuInfo.put("msg", "success");
		} else {
			stuInfo.put("msg", "fail");
		}

		return SUCCESS;
	}

	public String saveBrokerage() {
		try {
			model.setLangTuition(langTuition_m + model.getLangTuition());
			model.setLangBrokerage(langBrokerage_m + model.getLangBrokerage());
			model.setSpeTuition(speTuition_m + model.getSpeTuition());
			model.setSpeBrokerage(speBrokerage_m + model.getSpeBrokerage());
			if (StringUtils.isNotBlank(model.getBrokerageArriveNum()))
				model.setBrokerageArriveNum(brokerageArriveNum_m + model.getBrokerageArriveNum());
			if (StringUtils.isNotBlank(model.getBrokerageArriveNum2()))
				model.setBrokerageArriveNum2(brokerageArriveNum2_m + model.getBrokerageArriveNum2());
			if (StringUtils.isNotBlank(model.getLastBrokerageNum()))
				model.setLastBrokerageNum(lastBrokerageNum_m + model.getLastBrokerageNum());

			if (model.getId() == null)
				model.setCreateTime(new Date());

			this.save();
			model.setCountry(URLEncoder.encode(model.getCountry(), "UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	protected DetachedCriteria setupDetachedCriteria() {
		DetachedCriteria c = DetachedCriteria.forClass(Brokerage.class);

		c.addOrder(Order.desc("joinDate"));
		c.addOrder(Order.desc("id"));

		if (StringUtils.isNotBlank(model.getStuId()))
			c.add(Restrictions.like("stuId", "%" + model.getStuId() + "%"));

		if (StringUtils.isNotBlank(model.getStuName()))
			c.add(Restrictions.like("stuName", "%" + model.getStuName() + "%"));

		if (StringUtils.isNotBlank(model.getApplyType()))
			c.add(Restrictions.like("applyType", "%" + model.getApplyType() + "%"));

		if (beginDate != null)
			c.add(Restrictions.ge("joinDate", beginDate));

		if (endDate != null)
			c.add(Restrictions.le("joinDate", endDate));

		if (StringUtils.isNotBlank(model.getSchool()))
			c.add(Restrictions.like("school", "%" + model.getSchool() + "%"));

		if (StringUtils.isNotBlank(model.getSpeciality()))
			c.add(Restrictions.like("speciality", "%" + model.getSpeciality() + "%"));

		if (StringUtils.isNotBlank(model.getSchoolEnName()))
			c.add(Restrictions.like("schoolEnName", "%" + model.getSchoolEnName() + "%"));

		if (StringUtils.isNotBlank(model.getSpecialityEnName()))
			c.add(Restrictions.like("specialityEnName", "%" + model.getSpecialityEnName() + "%"));

		if (StringUtils.isNotBlank(model.getPartner()))
			c.add(Restrictions.like("partner", "%" + model.getPartner() + "%"));

		if (StringUtils.isNotBlank(model.getAdvisor()))
			c.add(Restrictions.like("advisor", "%" + model.getAdvisor() + "%"));

		if (StringUtils.isNotBlank(model.getDocEmp()))
			c.add(Restrictions.like("docEmp", "%" + model.getDocEmp() + "%"));

		if (StringUtils.isNotBlank(model.getIsAllBrokerageArrived()))
			c.add(Restrictions.eq("isAllBrokerageArrived", model.getIsAllBrokerageArrived()));

		if (StringUtils.isNotBlank(model.getCountry())) {
			try {
				if (countries.indexOf(model.getCountry()) == -1)
					model.setCountry(new String(model.getCountry().getBytes("ISO8859-1"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			c.add(Restrictions.eq("country", model.getCountry()));
		}
		
		if (!this.isAdmin(this.getUser().getRoles()) && !this.isAudit(this.getUser().getRoles())) {
			if ("1".equals(getUser().getEmployees().getIsDeptAdmin())) {

				List<Employees> deptEmps = this.getManager().query("from Employees where dept.id = ?", getUser().getEmployees().getDept().getId());
				List deptEmpNames = new ArrayList();
				for (Employees emp : deptEmps) {
					deptEmpNames.add(emp.getName());
				}
				c.add(Restrictions.or(Restrictions.in("docEmp", deptEmpNames), Restrictions.in("advisor", deptEmpNames)));
			} else {
				String empName = this.getUser().getEmployees().getName();
				c.add(Restrictions.or(Restrictions.eq("docEmp", empName), Restrictions.eq("otherDocEmp", empName)));
			}
		}

		return c;
	}

	public List getAdvEmps() {
		return getManager().query("from Employees emp where (emp.dept.id=? or emp.dept.parentDept.id=?) and emp.user.status = '1'", new Object[] { Constants.ADV_DEPT_ID, Constants.ADV_DEPT_ID });
	}

	public List getDocEmps() {
		return getManager().query("from Employees emp where (emp.dept.id=? or emp.isDoDoc='1') and emp.user.status = '1'", Constants.DOC_DEPT_ID);
	}

	@SuppressWarnings("unused")
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

	@SuppressWarnings("unused")
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

	public String getMatchName() {
		return matchName;
	}

	public void setMatchName(String matchName) {
		this.matchName = matchName;
	}

	public HashMap<String, Object> getStuInfo() {
		return stuInfo;
	}

	public void setStuInfo(HashMap<String, Object> stuInfo) {
		this.stuInfo = stuInfo;
	}

	public String getDefinedField() {
		return definedField;
	}

	public void setDefinedField(String definedField) {
		this.definedField = definedField;
	}

	public String getDefinedSearch() {
		return definedSearch;
	}

	public void setDefinedSearch(String definedSearch) {
		this.definedSearch = definedSearch;
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

	public String getLangTuition_m() {
		return langTuition_m;
	}

	public void setLangTuition_m(String langTuition_m) {
		this.langTuition_m = langTuition_m;
	}

	public String getLangBrokerage_m() {
		return langBrokerage_m;
	}

	public void setLangBrokerage_m(String langBrokerage_m) {
		this.langBrokerage_m = langBrokerage_m;
	}

	public String getSpeTuition_m() {
		return speTuition_m;
	}

	public void setSpeTuition_m(String speTuition_m) {
		this.speTuition_m = speTuition_m;
	}

	public String getSpeBrokerage_m() {
		return speBrokerage_m;
	}

	public void setSpeBrokerage_m(String speBrokerage_m) {
		this.speBrokerage_m = speBrokerage_m;
	}

	public String getBrokerageArriveNum_m() {
		return brokerageArriveNum_m;
	}

	public void setBrokerageArriveNum_m(String brokerageArriveNum_m) {
		this.brokerageArriveNum_m = brokerageArriveNum_m;
	}

	public String getBrokerageArriveNum2_m() {
		return brokerageArriveNum2_m;
	}

	public void setBrokerageArriveNum2_m(String brokerageArriveNum2_m) {
		this.brokerageArriveNum2_m = brokerageArriveNum2_m;
	}

	public String getLastBrokerageNum_m() {
		return lastBrokerageNum_m;
	}

	public void setLastBrokerageNum_m(String lastBrokerageNum_m) {
		this.lastBrokerageNum_m = lastBrokerageNum_m;
	}

	public String getIsAll() {
		return isAll;
	}

	public void setIsAll(String isAll) {
		this.isAll = isAll;
	}

}
