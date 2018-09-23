package com.alphasta.cms.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.alphasta.common.core.model.BaseModel;

/**
 * Operationlog entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "OPERATIONLOG")
public class Operationlog extends BaseModel {

	// Fields

	private Integer id;
	private String operation;
	private Date operatedate;
	private String ip;
	private Long ipnum;
	private Integer userid;
	private String username;
	private String deptName;
	private String mac;

	/** default constructor */
	public Operationlog() {
	}

	/** full constructor */
	public Operationlog(Integer id, String operation, Date operatedate, String ip,
			Long ipnum, Integer userid, String username) {
		this.id = id;
		this.operation = operation;
		this.operatedate = operatedate;
		this.ip = ip;
		this.ipnum = ipnum;
		this.userid = userid;
		this.username = username;
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

	@Column(name = "OPERATION", nullable = true, length = 1000)
	public String getOperation() {
		return this.operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "OPERATEDATE", nullable = true, length = 11)
	public Date getOperatedate() {
		return this.operatedate;
	}

	public void setOperatedate(Date operatedate) {
		this.operatedate = operatedate;
	}

	@Column(name = "IP", nullable = true, length = 15)
	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Column(name = "IPNUM", nullable = true, precision = 22, scale = 0)
	public Long getIpnum() {
		return this.ipnum;
	}

	public void setIpnum(Long ipnum) {
		this.ipnum = ipnum;
	}

	@Column(name = "USERID", nullable = true, precision = 22, scale = 0)
	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@Column(name = "USERNAME", nullable = true, length = 100)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "DEPTNAME", nullable = true, length = 100)
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Column(name ="MAC")
	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

}