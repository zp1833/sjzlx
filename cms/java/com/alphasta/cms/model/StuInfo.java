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
@Table(name = "STUINFO")
public class StuInfo extends BaseModel {

	// Fields

	private Integer id;

	private Date advDate;

	private String docId;

	private String stuName;

	private String advCountry;

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

	private String hopeDegree;

	private String enDegree;

	private String finances;

	private String infoDesc;

	private String traceDesc;

	private Date recentTraceTime;

	private String introToIELTS;

	private String signStatus;

	private Date signTime;

	private String signName;

	private String serviceCharge;

	private String downPayment;

	private String endPayment;

	private String signDesc;

	private String serviceChargeDetails;

	private String schoolApplyDoc;

	private String studyingCertificate_cn;

	private String studyingCertificate_en;

	private String reportCard_cn;

	private String reportCard_en;

	private String diploma_cn;

	private String diploma_en;

	private String letterPaper;

	private String envelope;

	private String schoolApplyPhoto;

	private String selfDesc;

	private String recommendation;

	private String foreignAchievement;

	private String degreeCard_cn;

	private String degreeCard_en;

	private String encourageCard;

	private String fundProve;

	private String otherApplySchoolDetails;

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

	private String isNoticeSubMarket;

	private Date doLoanTime;

	private Date doStayTime;

	private Date doAuthTime;

	private Date bookTicketTime;

	private Date buyDraftTime;

	private Date pickUpPlanTime;

	private Date takeScoreTime;

	private Date pickUpTime;

	private Date giveMoneyTime;

	private Date pickUpAskTime;
	
	private String qq;
	
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	@Column(name = "ISNOTICESUBMARKET")
	public String getIsNoticeSubMarket() {
		return isNoticeSubMarket;
	}

	public void setIsNoticeSubMarket(String isNoticeSubMarket) {
		this.isNoticeSubMarket = isNoticeSubMarket;
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

	public String getHopeDegree() {
		return hopeDegree;
	}

	public void setHopeDegree(String hopeDegree) {
		this.hopeDegree = hopeDegree;
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

	public String getServiceChargeDetails() {
		return serviceChargeDetails;
	}

	public void setServiceChargeDetails(String serviceChargeDetails) {
		this.serviceChargeDetails = serviceChargeDetails;
	}

	public String getSchoolApplyDoc() {
		return schoolApplyDoc;
	}

	public void setSchoolApplyDoc(String schoolApplyDoc) {
		this.schoolApplyDoc = schoolApplyDoc;
	}

	@Column(name = "STUDYINGCERTIFICATE_CN")
	public String getStudyingCertificate_cn() {
		return studyingCertificate_cn;
	}

	public void setStudyingCertificate_cn(String studyingCertificate_cn) {
		this.studyingCertificate_cn = studyingCertificate_cn;
	}

	@Column(name = "STUDYINGCERTIFICATE_EN")
	public String getStudyingCertificate_en() {
		return studyingCertificate_en;
	}

	public void setStudyingCertificate_en(String studyingCertificate_en) {
		this.studyingCertificate_en = studyingCertificate_en;
	}

	@Column(name = "REPORTCARD_CN")
	public String getReportCard_cn() {
		return reportCard_cn;
	}

	public void setReportCard_cn(String reportCard_cn) {
		this.reportCard_cn = reportCard_cn;
	}

	@Column(name = "REPORTCARD_EN")
	public String getReportCard_en() {
		return reportCard_en;
	}

	public void setReportCard_en(String reportCard_en) {
		this.reportCard_en = reportCard_en;
	}

	@Column(name = "DIPLOMA_CN")
	public String getDiploma_cn() {
		return diploma_cn;
	}

	public void setDiploma_cn(String diploma_cn) {
		this.diploma_cn = diploma_cn;
	}

	@Column(name = "DIPLOMA_EN")
	public String getDiploma_en() {
		return diploma_en;
	}

	public void setDiploma_en(String diploma_en) {
		this.diploma_en = diploma_en;
	}

	public String getLetterPaper() {
		return letterPaper;
	}

	public void setLetterPaper(String letterPaper) {
		this.letterPaper = letterPaper;
	}

	public String getEnvelope() {
		return envelope;
	}

	public void setEnvelope(String envelope) {
		this.envelope = envelope;
	}

	public String getSchoolApplyPhoto() {
		return schoolApplyPhoto;
	}

	public void setSchoolApplyPhoto(String schoolApplyPhoto) {
		this.schoolApplyPhoto = schoolApplyPhoto;
	}

	public String getSelfDesc() {
		return selfDesc;
	}

	public void setSelfDesc(String selfDesc) {
		this.selfDesc = selfDesc;
	}

	public String getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(String recommendation) {
		this.recommendation = recommendation;
	}

	public String getForeignAchievement() {
		return foreignAchievement;
	}

	public void setForeignAchievement(String foreignAchievement) {
		this.foreignAchievement = foreignAchievement;
	}

	public String getDegreeCard_cn() {
		return degreeCard_cn;
	}

	public void setDegreeCard_cn(String degreeCard_cn) {
		this.degreeCard_cn = degreeCard_cn;
	}

	public String getDegreeCard_en() {
		return degreeCard_en;
	}

	public void setDegreeCard_en(String degreeCard_en) {
		this.degreeCard_en = degreeCard_en;
	}

	public String getEncourageCard() {
		return encourageCard;
	}

	public void setEncourageCard(String encourageCard) {
		this.encourageCard = encourageCard;
	}

	public String getFundProve() {
		return fundProve;
	}

	public void setFundProve(String fundProve) {
		this.fundProve = fundProve;
	}

	public String getOtherApplySchoolDetails() {
		return otherApplySchoolDetails;
	}

	public void setOtherApplySchoolDetails(String otherApplySchoolDetails) {
		this.otherApplySchoolDetails = otherApplySchoolDetails;
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

	/** default constructor */
	public StuInfo() {
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

	public Date getDoLoanTime() {
		return doLoanTime;
	}

	public void setDoLoanTime(Date doLoanTime) {
		this.doLoanTime = doLoanTime;
	}

	public Date getDoStayTime() {
		return doStayTime;
	}

	public void setDoStayTime(Date doStayTime) {
		this.doStayTime = doStayTime;
	}

	public Date getDoAuthTime() {
		return doAuthTime;
	}

	public void setDoAuthTime(Date doAuthTime) {
		this.doAuthTime = doAuthTime;
	}

	public Date getBookTicketTime() {
		return bookTicketTime;
	}

	public void setBookTicketTime(Date bookTicketTime) {
		this.bookTicketTime = bookTicketTime;
	}

	public Date getBuyDraftTime() {
		return buyDraftTime;
	}

	public void setBuyDraftTime(Date buyDraftTime) {
		this.buyDraftTime = buyDraftTime;
	}

	public Date getPickUpPlanTime() {
		return pickUpPlanTime;
	}

	public void setPickUpPlanTime(Date pickUpPlanTime) {
		this.pickUpPlanTime = pickUpPlanTime;
	}

	public Date getTakeScoreTime() {
		return takeScoreTime;
	}

	public void setTakeScoreTime(Date takeScoreTime) {
		this.takeScoreTime = takeScoreTime;
	}

	public Date getPickUpTime() {
		return pickUpTime;
	}

	public void setPickUpTime(Date pickUpTime) {
		this.pickUpTime = pickUpTime;
	}

	public Date getGiveMoneyTime() {
		return giveMoneyTime;
	}

	public void setGiveMoneyTime(Date giveMoneyTime) {
		this.giveMoneyTime = giveMoneyTime;
	}

	public Date getPickUpAskTime() {
		return pickUpAskTime;
	}

	public void setPickUpAskTime(Date pickUpAskTime) {
		this.pickUpAskTime = pickUpAskTime;
	}

}