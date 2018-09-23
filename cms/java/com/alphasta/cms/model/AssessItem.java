package com.alphasta.cms.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "ASSESSITEM")
public class AssessItem extends BaseModel {

	// Fields

	private Integer id;
	private String name;
	private String descn;
	private Assess assess;
	private Set<AssessCell> assessCells = new HashSet<AssessCell>(0);

	@OneToMany(mappedBy="assessItem",cascade=CascadeType.ALL)
	public Set<AssessCell> getAssessCells() {
		return assessCells;
	}

	public void setAssessCells(Set<AssessCell> assessCells) {
		this.assessCells = assessCells;
	}

	/** default constructor */
	public AssessItem() {
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

	public String getDescn() {
		return descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="assessid")
	public Assess getAssess() {
		return assess;
	}

	public void setAssess(Assess assess) {
		this.assess = assess;
	}

}