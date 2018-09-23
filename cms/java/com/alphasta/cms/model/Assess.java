package com.alphasta.cms.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
@Table(name = "ASSESS")
public class Assess extends BaseModel {

	// Fields

	private Integer id;
	private String name;
	private Date adate;
	private Set<AssessItem> assessItems = new HashSet<AssessItem>(0);

	@OneToMany(mappedBy="assess",cascade=CascadeType.ALL)
	public Set<AssessItem> getAssessItems() {
		return assessItems;
	}

	public void setAssessItems(Set<AssessItem> assessItems) {
		this.assessItems = assessItems;
	}

	/** default constructor */
	public Assess() {
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getAdate() {
		return adate;
	}

	public void setAdate(Date adate) {
		this.adate = adate;
	}

}