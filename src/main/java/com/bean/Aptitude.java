package com.bean;

import java.io.Serializable;

public class Aptitude implements Serializable {
    private Integer aptitudesid;

    private Integer suppliersid;

    private String farenimg;

    private String aptitudeimg;

    private static final long serialVersionUID = 1L;

    public Integer getAptitudesid() {
        return aptitudesid;
    }

    public void setAptitudesid(Integer aptitudesid) {
        this.aptitudesid = aptitudesid;
    }

    public Integer getSuppliersid() {
        return suppliersid;
    }

    public void setSuppliersid(Integer suppliersid) {
        this.suppliersid = suppliersid;
    }

    public String getFarenimg() {
        return farenimg;
    }

    public void setFarenimg(String farenimg) {
        this.farenimg = farenimg == null ? null : farenimg.trim();
    }

    public String getAptitudeimg() {
        return aptitudeimg;
    }

    public void setAptitudeimg(String aptitudeimg) {
        this.aptitudeimg = aptitudeimg == null ? null : aptitudeimg.trim();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Aptitude other = (Aptitude) that;
        return (this.getAptitudesid() == null ? other.getAptitudesid() == null : this.getAptitudesid().equals(other.getAptitudesid()))
            && (this.getSuppliersid() == null ? other.getSuppliersid() == null : this.getSuppliersid().equals(other.getSuppliersid()))
            && (this.getFarenimg() == null ? other.getFarenimg() == null : this.getFarenimg().equals(other.getFarenimg()))
            && (this.getAptitudeimg() == null ? other.getAptitudeimg() == null : this.getAptitudeimg().equals(other.getAptitudeimg()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getAptitudesid() == null) ? 0 : getAptitudesid().hashCode());
        result = prime * result + ((getSuppliersid() == null) ? 0 : getSuppliersid().hashCode());
        result = prime * result + ((getFarenimg() == null) ? 0 : getFarenimg().hashCode());
        result = prime * result + ((getAptitudeimg() == null) ? 0 : getAptitudeimg().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", aptitudesid=").append(aptitudesid);
        sb.append(", suppliersid=").append(suppliersid);
        sb.append(", farenimg=").append(farenimg);
        sb.append(", aptitudeimg=").append(aptitudeimg);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}