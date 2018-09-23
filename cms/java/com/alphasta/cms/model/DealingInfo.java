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
@Table(name = "DEALINGINFO")
public class DealingInfo extends BaseModel {

	private Integer id;
	private String name;
	private String toCountry;
	private String clientType;
	private String clientClass;
	private String applyType;
	private String interviewType;
	private Date readTime;
	private Date zhengReadTime;
	private String readSchoolZH;
	private String readSchoolEN;
	private String majorZH;
	private String majorEN;
	private Date applyTime;
	private Date enrollTime;
	private String partner;
	private String beforeSchool;
	private String beforeMajor;
	private String GPA;
	private String TOEFLORIELTS;
	private String SATORACT;
	private String GREORGMAT;
	private String SLEP;
	private String interruptDate;
	private String praticeExperience;
	private String workExperience;
	private String nationalAwards;
	private String patentOrThesis;
	private String advantage;
	private String otherEnrollSchool;
	private String visaSchool;
	private String visaSurety;
	private String suretyMoney;
	private String moneySituation;
	private String advisor;
	private String copyWriter;
	private String remark;
	private String riskEval;
	private String riskDescn;
	private String processLog;
	private Date signTime;
	private Date transferTime;
	private Date signSendTime;
	private String isSigned;
	private Date visaTime;
	
	public String getIsSigned() {
		return isSigned;
	}

	public void setIsSigned(String isSigned) {
		this.isSigned = isSigned;
	}

	public Date getSignSendTime() {
		return signSendTime;
	}

	public void setSignSendTime(Date signSendTime) {
		this.signSendTime = signSendTime;
	}

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

	public String getRiskEval() {
		return riskEval;
	}

	public void setRiskEval(String riskEval) {
		this.riskEval = riskEval;
	}

	public String getRiskDescn() {
		return riskDescn;
	}

	public void setRiskDescn(String riskDescn) {
		this.riskDescn = riskDescn;
	}

	public String getProcessLog() {
		return processLog;
	}

	public void setProcessLog(String processLog) {
		this.processLog = processLog;
	}

	public String getName() {
		return name;
	}

	@Id
	@GeneratedValue(generator = "hibseq")
	@GenericGenerator(name = "hibseq", strategy = "hilo")
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getToCountry() {
		return toCountry;
	}

	public void setToCountry(String toCountry) {
		this.toCountry = toCountry;
	}

	public String getClientType() {
		return clientType;
	}

	public void setClientType(String clientType) {
		this.clientType = clientType;
	}

	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	public String getInterviewType() {
		return interviewType;
	}

	public void setInterviewType(String interviewType) {
		this.interviewType = interviewType;
	}

	public Date getReadTime() {
		return readTime;
	}

	public void setReadTime(Date readTime) {
		this.readTime = readTime;
	}

	public String getReadSchoolZH() {
		return readSchoolZH;
	}

	public void setReadSchoolZH(String readSchoolZH) {
		this.readSchoolZH = readSchoolZH;
	}

	public String getReadSchoolEN() {
		return readSchoolEN;
	}

	public void setReadSchoolEN(String readSchoolEN) {
		this.readSchoolEN = readSchoolEN;
	}

	public String getMajorZH() {
		return majorZH;
	}

	public void setMajorZH(String majorZH) {
		this.majorZH = majorZH;
	}

	public String getMajorEN() {
		return majorEN;
	}

	public void setMajorEN(String majorEN) {
		this.majorEN = majorEN;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public Date getEnrollTime() {
		return enrollTime;
	}

	public void setEnrollTime(Date enrollTime) {
		this.enrollTime = enrollTime;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public String getBeforeSchool() {
		return beforeSchool;
	}

	public void setBeforeSchool(String beforeSchool) {
		this.beforeSchool = beforeSchool;
	}

	public String getBeforeMajor() {
		return beforeMajor;
	}

	public void setBeforeMajor(String beforeMajor) {
		this.beforeMajor = beforeMajor;
	}

	public String getGPA() {
		return GPA;
	}

	public void setGPA(String gPA) {
		GPA = gPA;
	}

	public String getTOEFLORIELTS() {
		return TOEFLORIELTS;
	}

	public void setTOEFLORIELTS(String tOEFLORIELTS) {
		TOEFLORIELTS = tOEFLORIELTS;
	}

	public String getSATORACT() {
		return SATORACT;
	}

	public void setSATORACT(String sATORACT) {
		SATORACT = sATORACT;
	}

	public String getGREORGMAT() {
		return GREORGMAT;
	}

	public void setGREORGMAT(String gREORGMAT) {
		GREORGMAT = gREORGMAT;
	}

	public String getSLEP() {
		return SLEP;
	}

	public void setSLEP(String sLEP) {
		SLEP = sLEP;
	}

	public String getInterruptDate() {
		return interruptDate;
	}

	public void setInterruptDate(String interruptDate) {
		this.interruptDate = interruptDate;
	}

	public String getPraticeExperience() {
		return praticeExperience;
	}

	public void setPraticeExperience(String praticeExperience) {
		this.praticeExperience = praticeExperience;
	}

	public String getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(String workExperience) {
		this.workExperience = workExperience;
	}

	public String getNationalAwards() {
		return nationalAwards;
	}

	public void setNationalAwards(String nationalAwards) {
		this.nationalAwards = nationalAwards;
	}

	public String getPatentOrThesis() {
		return patentOrThesis;
	}

	public void setPatentOrThesis(String patentOrThesis) {
		this.patentOrThesis = patentOrThesis;
	}

	public String getAdvantage() {
		return advantage;
	}

	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}

	public String getOtherEnrollSchool() {
		return otherEnrollSchool;
	}

	public void setOtherEnrollSchool(String otherEnrollSchool) {
		this.otherEnrollSchool = otherEnrollSchool;
	}

	public String getVisaSchool() {
		return visaSchool;
	}

	public void setVisaSchool(String visaSchool) {
		this.visaSchool = visaSchool;
	}

	public String getVisaSurety() {
		return visaSurety;
	}

	public void setVisaSurety(String visaSurety) {
		this.visaSurety = visaSurety;
	}

	public String getSuretyMoney() {
		return suretyMoney;
	}

	public void setSuretyMoney(String suretyMoney) {
		this.suretyMoney = suretyMoney;
	}

	public String getMoneySituation() {
		return moneySituation;
	}

	public void setMoneySituation(String moneySituation) {
		this.moneySituation = moneySituation;
	}

	public String getAdvisor() {
		return advisor;
	}

	public void setAdvisor(String advisor) {
		this.advisor = advisor;
	}

	public String getCopyWriter() {
		return copyWriter;
	}

	public void setCopyWriter(String copyWriter) {
		this.copyWriter = copyWriter;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getZhengReadTime() {
		return zhengReadTime;
	}

	public void setZhengReadTime(Date zhengReadTime) {
		this.zhengReadTime = zhengReadTime;
	}

	public String getClientClass() {
		return clientClass;
	}

	public void setClientClass(String clientClass) {
		this.clientClass = clientClass;
	}

	public Date getVisaTime() {
		return visaTime;
	}

	public void setVisaTime(Date visaTime) {
		this.visaTime = visaTime;
	}

}
