package com.alphasta.cms.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.alphasta.common.core.model.BaseModel;

/**
 * 佣金管理 entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "BROKERAGE")
public class Brokerage extends BaseModel {

	// Fields

	private Integer id;
	private String stuName;
	private Date birthday;
	private String sex;
	private String stuId;
	private String country;
	private String applyType;
	private Date joinDate;
	private Date zhengJoinDate;
	private String schoolEnName;// 学校英文名
	private String specialityEnName;// 专业英文名
	private String school;// 学校中文名
	private String speciality;// 专业中文名

	private String otherPartner;// 手动填写的合作方当partner=0时生效

	private String partner;
	private String partnerPeriod;
	private Date langBeginDate;
	private String langTuition;
	private String langProportion;
	private String langBrokerage;
	private Date speBeginDate;
	private String speTuition;
	private String speProportion;
	private String speBrokerage;
	private String brokerageArriveNum;
	private String brokerageArriveNum2;
	private String brokerageRate;
	private String brokerageRate2;
	private String brokerageToRmb;
	private String brokerageToRmb2;
	private Date brokerageArriveDate;
	private Date brokerageArriveDate2;
	private String isAllBrokerageArrived;
	private String lastBrokerageNum;
	private Date lastBrokerageArriveDate;
	private String descn;
	private String source;
	private String otherSource;

	private String advisor;
	private String otherAdvisor;// 手动填写的顾问 当advisor=0时生效

	private String docEmp;
	private String otherDocEmp;// 手动填写的文档 当docEmp=0时生效

	private String planEmp;
	private Date createTime;

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/** default constructor */
	public Brokerage() {
	}

	// Property accessors
	@Id
	@GeneratedValue(generator = "hibseq")
	@GenericGenerator(name = "hibseq", strategy = "hilo")
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getSchoolEnName() {
		return schoolEnName;
	}

	public void setSchoolEnName(String schoolEnName) {
		this.schoolEnName = schoolEnName;
	}

	public String getSpecialityEnName() {
		return specialityEnName;
	}

	public void setSpecialityEnName(String specialityEnName) {
		this.specialityEnName = specialityEnName;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String schoolZhName) {
		this.school = schoolZhName;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String specialityZhName) {
		this.speciality = specialityZhName;
	}

	public String getOtherPartner() {
		return otherPartner;
	}

	public void setOtherPartner(String otherPartner) {
		this.otherPartner = otherPartner;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public Date getLangBeginDate() {
		return langBeginDate;
	}

	public void setLangBeginDate(Date langBeginDate) {
		this.langBeginDate = langBeginDate;
	}

	public String getLangTuition() {
		return langTuition;
	}

	public void setLangTuition(String langTuition) {
		this.langTuition = langTuition;
	}

	public String getLangProportion() {
		return langProportion;
	}

	public void setLangProportion(String langProportion) {
		this.langProportion = langProportion;
	}

	public String getLangBrokerage() {
		return langBrokerage;
	}

	public void setLangBrokerage(String langBrokerage) {
		this.langBrokerage = langBrokerage;
	}

	public Date getSpeBeginDate() {
		return speBeginDate;
	}

	public void setSpeBeginDate(Date speBeginDate) {
		this.speBeginDate = speBeginDate;
	}

	public String getSpeTuition() {
		return speTuition;
	}

	public void setSpeTuition(String speTuition) {
		this.speTuition = speTuition;
	}

	public String getSpeProportion() {
		return speProportion;
	}

	public void setSpeProportion(String speProportion) {
		this.speProportion = speProportion;
	}

	public String getSpeBrokerage() {
		return speBrokerage;
	}

	public void setSpeBrokerage(String speBrokerage) {
		this.speBrokerage = speBrokerage;
	}

	public String getBrokerageArriveNum() {
		return brokerageArriveNum;
	}

	public void setBrokerageArriveNum(String brokerageArriveNum) {
		this.brokerageArriveNum = brokerageArriveNum;
	}

	public Date getBrokerageArriveDate() {
		return brokerageArriveDate;
	}

	public void setBrokerageArriveDate(Date brokerageArriveDate) {
		this.brokerageArriveDate = brokerageArriveDate;
	}

	public String getIsAllBrokerageArrived() {
		return isAllBrokerageArrived;
	}

	public void setIsAllBrokerageArrived(String isAllBrokerageArrived) {
		this.isAllBrokerageArrived = isAllBrokerageArrived;
	}

	public String getLastBrokerageNum() {
		return lastBrokerageNum;
	}

	public void setLastBrokerageNum(String lastBrokerageNum) {
		this.lastBrokerageNum = lastBrokerageNum;
	}

	public Date getLastBrokerageArriveDate() {
		return lastBrokerageArriveDate;
	}

	public void setLastBrokerageArriveDate(Date lastBrokerageArriveDate) {
		this.lastBrokerageArriveDate = lastBrokerageArriveDate;
	}

	public String getDescn() {
		return descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getOtherAdvisor() {
		return otherAdvisor;
	}

	public void setOtherAdvisor(String otherAdvisor) {
		this.otherAdvisor = otherAdvisor;
	}

	public String getOtherDocEmp() {
		return otherDocEmp;
	}

	public void setOtherDocEmp(String otherDocEmp) {
		this.otherDocEmp = otherDocEmp;
	}

	public String getAdvisor() {
		return advisor;
	}

	public void setAdvisor(String advisor) {
		this.advisor = advisor;
	}

	public String getDocEmp() {
		return docEmp;
	}

	public void setDocEmp(String docEmp) {
		this.docEmp = docEmp;
	}

	public String getPlanEmp() {
		return planEmp;
	}

	public void setPlanEmp(String planEmp) {
		this.planEmp = planEmp;
	}

	public String getOtherSource() {
		return otherSource;
	}

	public void setOtherSource(String otherSource) {
		this.otherSource = otherSource;
	}

	public String getBrokerageArriveNum2() {
		return brokerageArriveNum2;
	}

	public void setBrokerageArriveNum2(String brokerageArriveNum2) {
		this.brokerageArriveNum2 = brokerageArriveNum2;
	}

	public Date getBrokerageArriveDate2() {
		return brokerageArriveDate2;
	}

	public void setBrokerageArriveDate2(Date brokerageArriveDate2) {
		this.brokerageArriveDate2 = brokerageArriveDate2;
	}

	public String getBrokerageRate() {
		return brokerageRate;
	}

	public void setBrokerageRate(String brokerageRate) {
		this.brokerageRate = brokerageRate;
	}

	public String getBrokerageRate2() {
		return brokerageRate2;
	}

	public void setBrokerageRate2(String brokerageRate2) {
		this.brokerageRate2 = brokerageRate2;
	}

	public String getBrokerageToRmb() {
		return brokerageToRmb;
	}

	public void setBrokerageToRmb(String brokerageToRmb) {
		this.brokerageToRmb = brokerageToRmb;
	}

	public String getBrokerageToRmb2() {
		return brokerageToRmb2;
	}

	public void setBrokerageToRmb2(String brokerageToRmb2) {
		this.brokerageToRmb2 = brokerageToRmb2;
	}

	public String getPartnerPeriod() {
		return partnerPeriod;
	}

	public void setPartnerPeriod(String partnerPeriod) {
		this.partnerPeriod = partnerPeriod;
	}

	public Date getZhengJoinDate() {
		return zhengJoinDate;
	}

	public void setZhengJoinDate(Date zhengJoinDate) {
		this.zhengJoinDate = zhengJoinDate;
	}
}