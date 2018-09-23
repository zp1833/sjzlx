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
 * Operationlog entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "YMINFO")
public class YmInfo extends BaseModel {

	// Fields

	private Integer id;

	private Date advDate;

	private String docId;

	private String stuName;

	private String advCountry;

	private String otherCountry;

	private String source;

	private String sourceFrom;

	private String advType;

	private String recEmp;

	private String advisor;

	private String currentPlan;

	private String stuType;

	private Date nextVisitTime;

	private Date statusDefineTime;

	private String contact;

	private String sex;

	private Date birthday;

	private String isMerried;

	private String education;

	private String speciality;

	private String finishSchool;

	private Date finishTime;

	private String currentSchool;

	private String currentGrade;

	private String collegeScore;

	private String isHasRefuser;

	private String enDegree;

	private String finances;

	private String infoDesc;

	private String traceDesc;

	private Date recentTraceTime;

	private String introToIELTS;

	private String signStatus;

	private Date signTime;

	private String serviceChargeDetails;

	private String signName;

	private String serviceCharge;

	private String downPayment;

	private String endPayment;

	private String signDesc;

	private String recommendation;

	private String schoolName;

	private String applySpeciality;

	private Date docSendTime;

	private Date noticeReceTime;

	private Date inSchoolTime;

	private String bursaryStatus;

	private String schoolApplyDesc;

	private String visaApplyDoc;

	private String passport;

	private String visaApplyTable;

	private String schoolNoticeBook;

	private String studyPlan;

	private String incomeProve;

	private String houseHoldBook;

	private String houseBook;

	private String carBook;

	private String relativeProve;

	private String uncrimeProve;

	private String parentsEduBack;

	private String applierBack;

	private String bankbook;

	private String birthProve;

	private String visaApplyPhoto;

	private String busLicense;

	private String taxList;

	private String idCard;

	private String relationIdCard;

	private String loanProve;

	private String loanAgreement;

	private String physicalExam;

	private String loanMoneyHardCopy;

	private String loanMoneyProve;

	private String otherApplyProveDoc;

	private Date sqTime;

	private String visaResult;

	private String refuserAnalysis;

	private String visaApplyDesc;

	private String bookAirTicket;

	private String pickUpPlan;

	private Date flyTime;

	private Date fallTime;

	private String isPickedUp;

	private String stayPlan;

	private String feedback;

	private Date feedTime;

	private Date visaRecDate;

	private String isSubMarket;

	/****************** 移民新增 *************************/
	private String ymType;

	private String buyHouse;

	private String abroadInvest;

	private String inspect;

	private String age;

	private String jobExp;

	private String busiExp;

	private Date sendTime;

	private Date meetTime;

	private String applyDesc;

	private String ymTypeName;

	private Date leaveTime;

	private String livePlan;

	private String otherRequest;

	public String getYmTypeName() {
		return ymTypeName;
	}

	public void setYmTypeName(String ymTypeName) {
		this.ymTypeName = ymTypeName;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Date getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(Date meetTime) {
		this.meetTime = meetTime;
	}

	public String getApplyDesc() {
		return applyDesc;
	}

	public void setApplyDesc(String applyDesc) {
		this.applyDesc = applyDesc;
	}

	public Date getLeaveTime() {
		return leaveTime;
	}

	public void setLeaveTime(Date leaveTime) {
		this.leaveTime = leaveTime;
	}

	public String getLivePlan() {
		return livePlan;
	}

	public void setLivePlan(String livePlan) {
		this.livePlan = livePlan;
	}

	public String getOtherRequest() {
		return otherRequest;
	}

	public void setOtherRequest(String otherRequest) {
		this.otherRequest = otherRequest;
	}

	public String getJobExp() {
		return jobExp;
	}

	public void setJobExp(String jobExp) {
		this.jobExp = jobExp;
	}

	public String getBusiExp() {
		return busiExp;
	}

	public void setBusiExp(String busiExp) {
		this.busiExp = busiExp;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getYmType() {
		return ymType;
	}

	public void setYmType(String ymType) {
		this.ymType = ymType;
	}

	public String getBuyHouse() {
		return buyHouse;
	}

	public void setBuyHouse(String buyHouse) {
		this.buyHouse = buyHouse;
	}

	public String getAbroadInvest() {
		return abroadInvest;
	}

	public void setAbroadInvest(String abroadInvest) {
		this.abroadInvest = abroadInvest;
	}

	public String getInspect() {
		return inspect;
	}

	public void setInspect(String inspect) {
		this.inspect = inspect;
	}

	@Column(name = "VISARECDATE")
	public Date getVisaRecDate() {
		return visaRecDate;
	}

	public void setVisaRecDate(Date visaRecDate) {
		this.visaRecDate = visaRecDate;
	}

	@Column(name = "ISSUBMARKET")
	public String getIsSubMarket() {
		return isSubMarket;
	}

	public void setIsSubMarket(String isSubMarket) {
		this.isSubMarket = isSubMarket;
	}

	public Date getAdvDate() {
		return advDate;
	}

	public void setAdvDate(Date advDate) {
		this.advDate = advDate;
	}

	public String getDocId() {
		return docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getServiceChargeDetails() {
		return serviceChargeDetails;
	}

	public void setServiceChargeDetails(String serviceChargeDetails) {
		this.serviceChargeDetails = serviceChargeDetails;
	}

	public String getAdvCountry() {
		return advCountry;
	}

	public void setAdvCountry(String advCountry) {
		this.advCountry = advCountry;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getSourceFrom() {
		return sourceFrom;
	}

	public void setSourceFrom(String sourceFrom) {
		this.sourceFrom = sourceFrom;
	}

	public String getAdvType() {
		return advType;
	}

	public void setAdvType(String advType) {
		this.advType = advType;
	}

	public String getRecEmp() {
		return recEmp;
	}

	public void setRecEmp(String recEmp) {
		this.recEmp = recEmp;
	}

	public String getAdvisor() {
		return advisor;
	}

	public void setAdvisor(String advisor) {
		this.advisor = advisor;
	}

	public String getCurrentPlan() {
		return currentPlan;
	}

	public void setCurrentPlan(String currentPlan) {
		this.currentPlan = currentPlan;
	}

	public String getStuType() {
		return stuType;
	}

	public void setStuType(String stuType) {
		this.stuType = stuType;
	}

	public Date getNextVisitTime() {
		return nextVisitTime;
	}

	public void setNextVisitTime(Date nextVisitTime) {
		this.nextVisitTime = nextVisitTime;
	}

	public Date getStatusDefineTime() {
		return statusDefineTime;
	}

	public void setStatusDefineTime(Date statusDefineTime) {
		this.statusDefineTime = statusDefineTime;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getIsMerried() {
		return isMerried;
	}

	public void setIsMerried(String isMerried) {
		this.isMerried = isMerried;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getFinishSchool() {
		return finishSchool;
	}

	public void setFinishSchool(String finishSchool) {
		this.finishSchool = finishSchool;
	}

	public Date getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}

	public String getCurrentSchool() {
		return currentSchool;
	}

	public void setCurrentSchool(String currentSchool) {
		this.currentSchool = currentSchool;
	}

	public String getCurrentGrade() {
		return currentGrade;
	}

	public void setCurrentGrade(String currentGrade) {
		this.currentGrade = currentGrade;
	}

	public String getCollegeScore() {
		return collegeScore;
	}

	public void setCollegeScore(String collegeScore) {
		this.collegeScore = collegeScore;
	}

	public String getIsHasRefuser() {
		return isHasRefuser;
	}

	public void setIsHasRefuser(String isHasRefuser) {
		this.isHasRefuser = isHasRefuser;
	}

	public String getEnDegree() {
		return enDegree;
	}

	public void setEnDegree(String enDegree) {
		this.enDegree = enDegree;
	}

	public String getFinances() {
		return finances;
	}

	public void setFinances(String finances) {
		this.finances = finances;
	}

	public String getInfoDesc() {
		return infoDesc;
	}

	public void setInfoDesc(String infoDesc) {
		this.infoDesc = infoDesc;
	}

	public String getTraceDesc() {
		return traceDesc;
	}

	public void setTraceDesc(String traceDesc) {
		this.traceDesc = traceDesc;
	}

	public Date getRecentTraceTime() {
		return recentTraceTime;
	}

	public void setRecentTraceTime(Date recentTraceTime) {
		this.recentTraceTime = recentTraceTime;
	}

	public String getIntroToIELTS() {
		return introToIELTS;
	}

	public void setIntroToIELTS(String introToIELTS) {
		this.introToIELTS = introToIELTS;
	}

	public String getSignStatus() {
		return signStatus;
	}

	public void setSignStatus(String signStatus) {
		this.signStatus = signStatus;
	}

	public Date getSignTime() {
		return signTime;
	}

	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}

	public String getSignName() {
		return signName;
	}

	public void setSignName(String signName) {
		this.signName = signName;
	}

	public String getServiceCharge() {
		return serviceCharge;
	}

	public void setServiceCharge(String serviceCharge) {
		this.serviceCharge = serviceCharge;
	}

	public String getDownPayment() {
		return downPayment;
	}

	public void setDownPayment(String downPayment) {
		this.downPayment = downPayment;
	}

	public String getEndPayment() {
		return endPayment;
	}

	public void setEndPayment(String endPayment) {
		this.endPayment = endPayment;
	}

	public String getSignDesc() {
		return signDesc;
	}

	public void setSignDesc(String signDesc) {
		this.signDesc = signDesc;
	}

	public String getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(String recommendation) {
		this.recommendation = recommendation;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getApplySpeciality() {
		return applySpeciality;
	}

	public void setApplySpeciality(String applySpeciality) {
		this.applySpeciality = applySpeciality;
	}

	public Date getDocSendTime() {
		return docSendTime;
	}

	public void setDocSendTime(Date docSendTime) {
		this.docSendTime = docSendTime;
	}

	public Date getNoticeReceTime() {
		return noticeReceTime;
	}

	public void setNoticeReceTime(Date noticeReceTime) {
		this.noticeReceTime = noticeReceTime;
	}

	public Date getInSchoolTime() {
		return inSchoolTime;
	}

	public void setInSchoolTime(Date inSchoolTime) {
		this.inSchoolTime = inSchoolTime;
	}

	public String getBursaryStatus() {
		return bursaryStatus;
	}

	public void setBursaryStatus(String bursaryStatus) {
		this.bursaryStatus = bursaryStatus;
	}

	public String getSchoolApplyDesc() {
		return schoolApplyDesc;
	}

	public void setSchoolApplyDesc(String schoolApplyDesc) {
		this.schoolApplyDesc = schoolApplyDesc;
	}

	public String getVisaApplyDoc() {
		return visaApplyDoc;
	}

	public void setVisaApplyDoc(String visaApplyDoc) {
		this.visaApplyDoc = visaApplyDoc;
	}

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public String getVisaApplyTable() {
		return visaApplyTable;
	}

	public void setVisaApplyTable(String visaApplyTable) {
		this.visaApplyTable = visaApplyTable;
	}

	public String getSchoolNoticeBook() {
		return schoolNoticeBook;
	}

	public void setSchoolNoticeBook(String schoolNoticeBook) {
		this.schoolNoticeBook = schoolNoticeBook;
	}

	public String getStudyPlan() {
		return studyPlan;
	}

	public void setStudyPlan(String studyPlan) {
		this.studyPlan = studyPlan;
	}

	public String getIncomeProve() {
		return incomeProve;
	}

	public void setIncomeProve(String incomeProve) {
		this.incomeProve = incomeProve;
	}

	public String getHouseHoldBook() {
		return houseHoldBook;
	}

	public void setHouseHoldBook(String houseHoldBook) {
		this.houseHoldBook = houseHoldBook;
	}

	public String getHouseBook() {
		return houseBook;
	}

	public void setHouseBook(String houseBook) {
		this.houseBook = houseBook;
	}

	public String getCarBook() {
		return carBook;
	}

	public void setCarBook(String carBook) {
		this.carBook = carBook;
	}

	public String getRelativeProve() {
		return relativeProve;
	}

	public void setRelativeProve(String relativeProve) {
		this.relativeProve = relativeProve;
	}

	public String getUncrimeProve() {
		return uncrimeProve;
	}

	public void setUncrimeProve(String uncrimeProve) {
		this.uncrimeProve = uncrimeProve;
	}

	public String getParentsEduBack() {
		return parentsEduBack;
	}

	public void setParentsEduBack(String parentsEduBack) {
		this.parentsEduBack = parentsEduBack;
	}

	public String getApplierBack() {
		return applierBack;
	}

	public void setApplierBack(String applierBack) {
		this.applierBack = applierBack;
	}

	public String getBankbook() {
		return bankbook;
	}

	public void setBankbook(String bankbook) {
		this.bankbook = bankbook;
	}

	public String getBirthProve() {
		return birthProve;
	}

	public void setBirthProve(String birthProve) {
		this.birthProve = birthProve;
	}

	public String getVisaApplyPhoto() {
		return visaApplyPhoto;
	}

	public void setVisaApplyPhoto(String visaApplyPhoto) {
		this.visaApplyPhoto = visaApplyPhoto;
	}

	public String getBusLicense() {
		return busLicense;
	}

	public void setBusLicense(String busLicense) {
		this.busLicense = busLicense;
	}

	public String getTaxList() {
		return taxList;
	}

	public void setTaxList(String taxList) {
		this.taxList = taxList;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getRelationIdCard() {
		return relationIdCard;
	}

	public void setRelationIdCard(String relationIdCard) {
		this.relationIdCard = relationIdCard;
	}

	public String getLoanProve() {
		return loanProve;
	}

	public void setLoanProve(String loanProve) {
		this.loanProve = loanProve;
	}

	public String getLoanAgreement() {
		return loanAgreement;
	}

	public void setLoanAgreement(String loanAgreement) {
		this.loanAgreement = loanAgreement;
	}

	public String getPhysicalExam() {
		return physicalExam;
	}

	public void setPhysicalExam(String physicalExam) {
		this.physicalExam = physicalExam;
	}

	public String getLoanMoneyHardCopy() {
		return loanMoneyHardCopy;
	}

	public void setLoanMoneyHardCopy(String loanMoneyHardCopy) {
		this.loanMoneyHardCopy = loanMoneyHardCopy;
	}

	public String getLoanMoneyProve() {
		return loanMoneyProve;
	}

	public void setLoanMoneyProve(String loanMoneyProve) {
		this.loanMoneyProve = loanMoneyProve;
	}

	public String getOtherApplyProveDoc() {
		return otherApplyProveDoc;
	}

	public void setOtherApplyProveDoc(String otherApplyProveDoc) {
		this.otherApplyProveDoc = otherApplyProveDoc;
	}

	public Date getSqTime() {
		return sqTime;
	}

	public void setSqTime(Date sqTime) {
		this.sqTime = sqTime;
	}

	public String getVisaResult() {
		return visaResult;
	}

	public void setVisaResult(String visaResult) {
		this.visaResult = visaResult;
	}

	public String getRefuserAnalysis() {
		return refuserAnalysis;
	}

	public void setRefuserAnalysis(String refuserAnalysis) {
		this.refuserAnalysis = refuserAnalysis;
	}

	public String getVisaApplyDesc() {
		return visaApplyDesc;
	}

	public void setVisaApplyDesc(String visaApplyDesc) {
		this.visaApplyDesc = visaApplyDesc;
	}

	public String getBookAirTicket() {
		return bookAirTicket;
	}

	public void setBookAirTicket(String bookAirTicket) {
		this.bookAirTicket = bookAirTicket;
	}

	public String getPickUpPlan() {
		return pickUpPlan;
	}

	public void setPickUpPlan(String pickUpPlan) {
		this.pickUpPlan = pickUpPlan;
	}

	public Date getFlyTime() {
		return flyTime;
	}

	public void setFlyTime(Date flyTime) {
		this.flyTime = flyTime;
	}

	public Date getFallTime() {
		return fallTime;
	}

	public void setFallTime(Date fallTime) {
		this.fallTime = fallTime;
	}

	public String getIsPickedUp() {
		return isPickedUp;
	}

	public void setIsPickedUp(String isPickedUp) {
		this.isPickedUp = isPickedUp;
	}

	public String getStayPlan() {
		return stayPlan;
	}

	public void setStayPlan(String stayPlan) {
		this.stayPlan = stayPlan;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public Date getFeedTime() {
		return feedTime;
	}

	public void setFeedTime(Date feedTime) {
		this.feedTime = feedTime;
	}

	public String getOtherCountry() {
		return otherCountry;
	}

	public void setOtherCountry(String otherCountry) {
		this.otherCountry = otherCountry;
	}

	/** default constructor */
	public YmInfo() {
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
}