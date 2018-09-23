package com.alphasta.cms.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "ASSESSCELL")
public class AssessCell extends BaseModel {

	// Fields

	private Integer id;
	private Employees employee;
	private String descn;
	private Date adate;
	/** 是否交钱：0-未交，1-已交 */
	private String isPay;
	private AssessItem assessItem;

	/** default constructor */
	public AssessCell() {
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

	public String getDescn() {
		return descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="assessitemid")
	public AssessItem getAssessItem() {
		return assessItem;
	}

	public void setAssessItem(AssessItem assessItem) {
		this.assessItem = assessItem;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="employeeid")
	public Employees getEmployee() {
		return employee;
	}

	public void setEmployee(Employees employee) {
		this.employee = employee;
	}

	public Date getAdate() {
		return adate;
	}

	public void setAdate(Date adate) {
		this.adate = adate;
	}

	public String getIsPay() {
		return isPay;
	}

	public void setIsPay(String isPay) {
		this.isPay = isPay;
	}

}