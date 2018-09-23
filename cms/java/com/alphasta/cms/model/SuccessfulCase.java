package com.alphasta.cms.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.alphasta.common.core.model.BaseModel;

@SuppressWarnings("serial")
@Entity
@Table(name = "SUCCESSFULCASE")
public class SuccessfulCase extends BaseModel {

	private String advantage;
	private String advisor;
	private Date applyTime;
	private String applyType;
	private String beforeMajor;
	private String beforeSchool;
	private String clientClass;
	private String clientType;
	private String copyWriter;
	private Integer dealingId;
	private Date enrollTime;
	private String GPA;
	private String GREORGMAT;
	private Integer id;
	private String interruptDate;
	private String interviewType;
	private String majorEN;
	private String majorZH;
	private String moneySituation;
	private String name;
	private String nationalAwards;
	private String otherEnrollSchool;
	private String partner;
	private String patentOrThesis;
	private String praticeExperience;
	private String readSchoolEN;
	private String readSchoolZH;
	private Date readTime;
	private String remark;
	private String SATORACT;
	private String SLEP;
	private String suretyMoney;
	private String toCountry;
	private String TOEFLORIELTS;
	private String visaSchool;
	private String visaSurety;
	private String workExperience;
	private Date zhengReadTime;
	private Date signTime;
	private Date transferTime;
	private Date signSendTime;
	private String isSigned;
	private Date visaTime;

	public Date getSignTime() {
		return signTime;
	}

	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}

	public Date getTransferTime() {
		return transferTime;
	}

	public void setTransferTime(Date transferTime) {
		this.transferTime = transferTime;
	}

	public String getAdvantage() {
		return advantage;
	}

	public String getAdvisor() {
		return advisor;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public String getApplyType() {
		return applyType;
	}

	public String getBeforeMajor() {
		return beforeMajor;
	}

	public String getBeforeSchool() {
		return beforeSchool;
	}

	public String getClientClass() {
		return clientClass;
	}

	public String getClientType() {
		return clientType;
	}

	public String getCopyWriter() {
		return copyWriter;
	}

	public Integer getDealingId() {
		return dealingId;
	}

	public Date getEnrollTime() {
		return enrollTime;
	}

	public String getGPA() {
		return GPA;
	}

	public String getGREORGMAT() {
		return GREORGMAT;
	}

	@Id
	@GeneratedValue(generator = "hibseq")
	@GenericGenerator(name = "hibseq", strategy = "hilo")
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public String getInterruptDate() {
		return interruptDate;
	}

	public String getInterviewType() {
		return interviewType;
	}

	public String getMajorEN() {
		return majorEN;
	}

	public String getMajorZH() {
		return majorZH;
	}

	public String getMoneySituation() {
		return moneySituation;
	}

	public String getName() {
		return name;
	}

	public String getNationalAwards() {
		return nationalAwards;
	}

	public String getOtherEnrollSchool() {
		return otherEnrollSchool;
	}

	public String getPartner() {
		return partner;
	}

	public String getPatentOrThesis() {
		return patentOrThesis;
	}

	public String getPraticeExperience() {
		return praticeExperience;
	}

	public String getReadSchoolEN() {
		return readSchoolEN;
	}

	public String getReadSchoolZH() {
		return readSchoolZH;
	}

	public Date getReadTime() {
		return readTime;
	}

	public String getRemark() {
		return remark;
	}

	public String getSATORACT() {
		return SATORACT;
	}

	public String getSLEP() {
		return SLEP;
	}

	public String getSuretyMoney() {
		return suretyMoney;
	}

	public String getToCountry() {
		return toCountry;
	}

	public String getTOEFLORIELTS() {
		return TOEFLORIELTS;
	}

	public String getVisaSchool() {
		return visaSchool;
	}

	public String getVisaSurety() {
		return visaSurety;
	}

	public String getWorkExperience() {
		return workExperience;
	}

	public Date getZhengReadTime() {
		return zhengReadTime;
	}

	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}

	public void setAdvisor(String advisor) {
		this.advisor = advisor;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	public void setBeforeMajor(String beforeMajor) {
		this.beforeMajor = beforeMajor;
	}

	public void setBeforeSchool(String beforeSchool) {
		this.beforeSchool = beforeSchool;
	}

	public void setClientClass(String clientClass) {
		this.clientClass = clientClass;
	}

	public void setClientType(String clientType) {
		this.clientType = clientType;
	}

	public void setCopyWriter(String copyWriter) {
		this.copyWriter = copyWriter;
	}

	public void setDealingId(Integer dealingId) {
		this.dealingId = dealingId;
	}

	public void setEnrollTime(Date enrollTime) {
		this.enrollTime = enrollTime;
	}

	public void setGPA(String gPA) {
		GPA = gPA;
	}

	public void setGREORGMAT(String gREORGMAT) {
		GREORGMAT = gREORGMAT;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setInterruptDate(String interruptDate) {
		this.interruptDate = interruptDate;
	}

	public void setInterviewType(String interviewType) {
		this.interviewType = interviewType;
	}

	public void setMajorEN(String majorEN) {
		this.majorEN = majorEN;
	}

	public void setMajorZH(String majorZH) {
		this.majorZH = majorZH;
	}

	public void setMoneySituation(String moneySituation) {
		this.moneySituation = moneySituation;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNationalAwards(String nationalAwards) {
		this.nationalAwards = nationalAwards;
	}

	public void setOtherEnrollSchool(String otherEnrollSchool) {
		this.otherEnrollSchool = otherEnrollSchool;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public void setPatentOrThesis(String patentOrThesis) {
		this.patentOrThesis = patentOrThesis;
	}

	public void setPraticeExperience(String praticeExperience) {
		this.praticeExperience = praticeExperience;
	}

	public void setReadSchoolEN(String readSchoolEN) {
		this.readSchoolEN = readSchoolEN;
	}

	public void setReadSchoolZH(String readSchoolZH) {
		this.readSchoolZH = readSchoolZH;
	}

	public void setReadTime(Date readTime) {
		this.readTime = readTime;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setSATORACT(String sATORACT) {
		SATORACT = sATORACT;
	}

	public void setSLEP(String sLEP) {
		SLEP = sLEP;
	}

	public void setSuretyMoney(String suretyMoney) {
		this.suretyMoney = suretyMoney;
	}

	public void setToCountry(String toCountry) {
		this.toCountry = toCountry;
	}

	public void setTOEFLORIELTS(String tOEFLORIELTS) {
		TOEFLORIELTS = tOEFLORIELTS;
	}

	public void setVisaSchool(String visaSchool) {
		this.visaSchool = visaSchool;
	}

	public void setVisaSurety(String visaSurety) {
		this.visaSurety = visaSurety;
	}

	public void setWorkExperience(String workExperience) {
		this.workExperience = workExperience;
	}

	public void setZhengReadTime(Date zhengReadTime) {
		this.zhengReadTime = zhengReadTime;
	}

	public Date getSignSendTime() {
		return signSendTime;
	}

	public void setSignSendTime(Date signSendTime) {
		this.signSendTime = signSendTime;
	}

	public String getIsSigned() {
		return isSigned;
	}

	public void setIsSigned(String isSigned) {
		this.isSigned = isSigned;
	}

	public Date getVisaTime() {
		return visaTime;
	}

	public void setVisaTime(Date visaTime) {
		this.visaTime = visaTime;
	}

}
