package com.bean;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Transient;

public class Suppliers implements Serializable {
	@Id
    private Integer supplierid;

    private String suppliername;

    private String supplierstel;

    private String address;

    private Integer bail;

    private String sign;

    private String suppliersemail;

    private String lianxirenname;

    private String lianxinrenemail;
   
    private String farename;
    private String farenid;
    private String supplierspwd;
    private String aptitudeimg;
    
	public String getAptitudeimg() {
		return aptitudeimg;
	}

	public void setAptitudeimg(String aptitudeimg) {
		this.aptitudeimg = aptitudeimg;
	}

	public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername == null ? null : suppliername.trim();
    }

    public String getSupplierstel() {
        return supplierstel;
    }

    public void setSupplierstel(String supplierstel) {
        this.supplierstel = supplierstel == null ? null : supplierstel.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }


    public Integer getBail() {
        return bail;
    }

    public void setBail(Integer bail) {
        this.bail = bail;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign == null ? null : sign.trim();
    }

    public String getSuppliersemail() {
        return suppliersemail;
    }

    public void setSuppliersemail(String suppliersemail) {
        this.suppliersemail = suppliersemail == null ? null : suppliersemail.trim();
    }

    public String getLianxirenname() {
        return lianxirenname;
    }

    public void setLianxirenname(String lianxirenname) {
        this.lianxirenname = lianxirenname == null ? null : lianxirenname.trim();
    }

    public String getLianxinrenemail() {
        return lianxinrenemail;
    }

    public void setLianxinrenemail(String lianxinrenemail) {
        this.lianxinrenemail = lianxinrenemail == null ? null : lianxinrenemail.trim();
    }

    public String getFarename() {
        return farename;
    }

    public void setFarename(String farename) {
        this.farename = farename == null ? null : farename.trim();
    }

    public String getFarenid() {
        return farenid;
    }

    public void setFarenid(String farenid) {
        this.farenid = farenid == null ? null : farenid.trim();
    }

    public String getSupplierspwd() {
        return supplierspwd;
    }

    public void setSupplierspwd(String supplierspwd) {
        this.supplierspwd = supplierspwd == null ? null : supplierspwd.trim();
    }

  
    
}