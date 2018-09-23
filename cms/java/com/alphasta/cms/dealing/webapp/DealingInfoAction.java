package com.alphasta.cms.dealing.webapp;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.alphasta.cms.dealing.service.DealingInfoManager;
import com.alphasta.cms.model.Brokerage;
import com.alphasta.cms.model.DealingInfo;
import com.alphasta.cms.model.Employees;
import com.alphasta.common.Constants;
import com.alphasta.common.core.webapp.struts2.BaseECLimitQueryAction;
import com.alphasta.common.security.user.model.Role;

/**
 * 现操作客户管理action
 * 
 * @author zhaopeng
 * 
 */
@SuppressWarnings( { "serial" })
public class DealingInfoAction extends BaseECLimitQueryAction<DealingInfo, DealingInfoManager> {

	private Map<String, Object> stuInfo;

	private String matchName;

	private Date beginDate;

	private Date endDate;

	private Date beginDate1;

	private Date endDate1;

	private String countries = "美国,加拿大,澳大利亚,新西兰,香港,英国,日本,韩国,法国,新加坡,爱尔兰,马来西亚,俄罗斯,荷兰,西班牙,德国,挪威,瑞典,丹麦,芬兰,瑞士,匈牙利";

	/**
	 * 自定义显示的字段
	 */
	private String definedField;

	private String isAll;

	/**
	 * 自定义查询条件
	 */
	private String definedSearch;
	private String o_applySchool;
	private String o_applySpecial;
	private String o_isGetOffer;
	private String o_isNeedLang;
	private String o_offerEndTime;
	private String o_isAcceptOffer;
	private String o_visaSendTime;
	private String o_isBeSigned;

	public String saveDealingInfo() {
		try {
			getManager().saveDealingInfo(model);
			model.setToCountry(URLEncoder.encode(model.getToCountry(), "UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	protected DetachedCriteria setupDetachedCriteria() {
		DetachedCriteria c = DetachedCriteria.forClass(DealingInfo.class);

		c.addOrder(Order.asc("readTime"));
		c.addOrder(Order.asc("zhengReadTime"));
		c.addOrder(Order.desc("id"));

		if (StringUtils.isNotBlank(model.getName()))
			c.add(Restrictions.like("name", "%" + model.getName() + "%"));

		if (StringUtils.isNotBlank(model.getClientType()))
			c.add(Restrictions.eq("clientType", model.getClientType()));

		if (StringUtils.isNotBlank(model.getApplyType()))
			c.add(Restrictions.like("applyType", "%" + model.getApplyType() + "%"));

		if (StringUtils.isNotBlank(model.getInterviewType()))
			c.add(Restrictions.like("interviewType", "%" + model.getInterviewType() + "%"));

		if (beginDate != null)
			c.add(Restrictions.ge("readTime", beginDate));

		if (endDate != null)
			c.add(Restrictions.le("readTime", endDate));

		if (StringUtils.isNotBlank(model.getAdvisor()))
			c.add(Restrictions.like("advisor", "%" + model.getAdvisor() + "%"));

		if (StringUtils.isNotBlank(model.getCopyWriter()))
			c.add(Restrictions.like("copyWriter", "%" + model.getCopyWriter() + "%"));

		if (StringUtils.isNotBlank(model.getReadSchoolZH()))
			c.add(Restrictions.like("readSchoolZH", "%" + model.getReadSchoolZH() + "%"));

		if (StringUtils.isNotBlank(model.getReadSchoolEN()))
			c.add(Restrictions.like("readSchoolEN", "%" + model.getReadSchoolEN() + "%"));

		if (StringUtils.isNotBlank(model.getMajorZH()))
			c.add(Restrictions.like("majorZH", "%" + model.getMajorZH() + "%"));

		if (StringUtils.isNotBlank(model.getMajorEN()))
			c.add(Restrictions.like("majorEN", "%" + model.getMajorEN() + "%"));

		if (StringUtils.isNotBlank(model.getPartner()))
			c.add(Restrictions.or(Restrictions.like("partner", "%" + model.getPartner() + "%"), Restrictions.like("otherEnrollSchool", "%\"o_applySchool\":%" + model.getPartner() + "%")));

		if (StringUtils.isNotBlank(model.getBeforeSchool()))
			c.add(Restrictions.like("beforeSchool", "%" + model.getBeforeSchool() + "%"));

		if (StringUtils.isNotBlank(model.getBeforeMajor()))
			c.add(Restrictions.like("beforeMajor", "%" + model.getBeforeMajor() + "%"));

		if (StringUtils.isNotBlank(o_applySchool))
			c.add(Restrictions.like("otherEnrollSchool", "%\"o_applySchool\":%" + o_applySchool + "%"));

		if (StringUtils.isNotBlank(o_applySpecial))
			c.add(Restrictions.like("otherEnrollSchool", "%\"o_applySpecial\":%" + o_applySpecial + "%"));

		if (StringUtils.isNotBlank(o_isGetOffer))
			c.add(Restrictions.like("otherEnrollSchool", "%\"o_isGetOffer\":\"" + o_isGetOffer + "\"%"));

		if (StringUtils.isNotBlank(o_isNeedLang))
			c.add(Restrictions.like("otherEnrollSchool", "%\"o_isNeedLang\":\"" + o_isNeedLang + "\"%"));

		if (StringUtils.isNotBlank(o_offerEndTime))
			c.add(Restrictions.like("otherEnrollSchool", "%\"o_offerEndTime\":\"" + o_offerEndTime + "\"%"));

		if (StringUtils.isNotBlank(o_isAcceptOffer))
			c.add(Restrictions.like("otherEnrollSchool", "%\"o_isAcceptOffer\":\"" + o_isAcceptOffer + "\"%"));

		if (StringUtils.isNotBlank(o_visaSendTime))
			c.add(Restrictions.like("otherEnrollSchool", "%\"o_visaSendTime\":\"" + o_visaSendTime + "\"%"));

		if (StringUtils.isNotBlank(o_isBeSigned))
			c.add(Restrictions.like("otherEnrollSchool", "%\"o_isBeSigned\":\"" + o_isBeSigned + "\"%"));

		if (StringUtils.isNotBlank(model.getVisaSchool()))
			c.add(Restrictions.like("visaSchool", "%" + model.getVisaSchool() + "%"));

		if (StringUtils.isNotBlank(model.getToCountry())) {
			
			if("other".equals(model.getToCountry())) {
				c.add(Restrictions.not(Restrictions.in("toCountry", countries.split(","))));
			} else {
				try {
					if (countries.indexOf(model.getToCountry()) == -1)
						model.setToCountry(new String(model.getToCountry().getBytes("ISO8859-1"), "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				c.add(Restrictions.eq("toCountry", model.getToCountry()));
			}
		}

		if (!this.isAdmin(this.getUser().getRoles()) && !this.isAudit(this.getUser().getRoles())) {
			if ("1".equals(getUser().getEmployees().getIsDeptAdmin())) {

				List<Employees> deptEmps = this.getManager().query("from Employees where dept.id = ?", getUser().getEmployees().getDept().getId());
				List deptEmpNames = new ArrayList();
				for (Employees emp : deptEmps) {
					deptEmpNames.add(emp.getName());
				}
				c.add(Restrictions.or(Restrictions.in("advisor", deptEmpNames), Restrictions.in("copyWriter", deptEmpNames)));
			} else {
				c.add(Restrictions.or(Restrictions.eq("advisor", this.getUser().getEmployees().getName()), Restrictions.eq("copyWriter", this.getUser().getEmployees().getName())));
			}
		}

		return c;
	}

	public String getMoreInfoFromBrokerage() {
		List<Brokerage> match = this.getManager().query("from Brokerage bro where bro.stuName = ? ", matchName);
		stuInfo = new HashMap<String, Object>();
		if (match.size() > 0) {
			stuInfo.put("stuInfos", match.get(0));
			stuInfo.put("msg", "success");
		} else {
			stuInfo.put("msg", "fail");
		}

		return SUCCESS;

	}

	public String getAdvEmps() {
		List<Employees> emps = this.getManager().query("from Employees emp where (emp.dept.id=? or emp.dept.parentDept.id=?) and emp.user.status = '1'",
				new Object[] { Constants.ADV_DEPT_ID, Constants.ADV_DEPT_ID });

		String resultStr = "";
		for (int i = 0; i < emps.size(); i++) {
			resultStr += emps.get(i).getName();
			if (i < emps.size() - 1) {
				resultStr += ",";
			}

		}
		return resultStr;
	}

	public String getDocEmps() {

		List<Employees> emps = this.getManager().query("from Employees emp where (emp.dept.id=? or emp.isDoDoc='1') and emp.user.status = '1'", Constants.DOC_DEPT_ID);
		String resultStr = "";
		for (int i = 0; i < emps.size(); i++) {
			resultStr += emps.get(i).getName();
			if (i < emps.size() - 1) {
				resultStr += ",";
			}

		}
		return resultStr;

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

	public String getO_applySchool() {
		return o_applySchool;
	}

	public void setO_applySchool(String school) {
		o_applySchool = school;
	}

	public String getO_applySpecial() {
		return o_applySpecial;
	}

	public void setO_applySpecial(String special) {
		o_applySpecial = special;
	}

	public String getMatchName() {
		return matchName;
	}

	public void setMatchName(String matchName) {
		this.matchName = matchName;
	}

	public Map<String, Object> getStuInfo() {
		return stuInfo;
	}

	public void setStuInfo(Map<String, Object> stuInfo) {
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

	public Date getBeginDate1() {
		return beginDate1;
	}

	public void setBeginDate1(Date beginDate1) {
		this.beginDate1 = beginDate1;
	}

	public Date getEndDate1() {
		return endDate1;
	}

	public void setEndDate1(Date endDate1) {
		this.endDate1 = endDate1;
	}

	public String getO_isGetOffer() {
		return o_isGetOffer;
	}

	public void setO_isGetOffer(String getOffer) {
		o_isGetOffer = getOffer;
	}

	public String getO_isNeedLang() {
		return o_isNeedLang;
	}

	public void setO_isNeedLang(String needLang) {
		o_isNeedLang = needLang;
	}

	public String getO_offerEndTime() {
		return o_offerEndTime;
	}

	public void setO_offerEndTime(String endTime) {
		o_offerEndTime = endTime;
	}

	public String getO_isAcceptOffer() {
		return o_isAcceptOffer;
	}

	public void setO_isAcceptOffer(String acceptOffer) {
		o_isAcceptOffer = acceptOffer;
	}

	public String getO_visaSendTime() {
		return o_visaSendTime;
	}

	public void setO_visaSendTime(String sendTime) {
		o_visaSendTime = sendTime;
	}

	public String getO_isBeSigned() {
		return o_isBeSigned;
	}

	public void setO_isBeSigned(String beSigned) {
		o_isBeSigned = beSigned;
	}

	public String getIsAll() {
		return isAll;
	}

	public void setIsAll(String isAll) {
		this.isAll = isAll;
	}
}
