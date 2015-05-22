package com.company.gap.pm.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.company.gap.base.model.GeneralModel;

@Entity(name="t_sale")
public class Sale extends GeneralModel {
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date saledate;
	
	@Column(name="product_id")
	private Integer productId;
	
	@Column(columnDefinition="int default 0")
	private Integer batch;
	
	@Column(columnDefinition="decimal(10, 2) default 0")
	private Double quantity;
	
	@Column(length = 100)
	private String spec;
	
	@Column(length = 100)
	private String level;
	
	@Column(length = 100)
	private String partner;
	
	@Column(length = 50)
	private String contact;
	
	public Date getSaledate() {
		return saledate;
	}

	public void setSaledate(Date saledate) {
		this.saledate = saledate;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getBatch() {
		return batch;
	}

	public void setBatch(Integer batch) {
		this.batch = batch;
	}

	public Double getQuantity() {
		return quantity;
	}

	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
}