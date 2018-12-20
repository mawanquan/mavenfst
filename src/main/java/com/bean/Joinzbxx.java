package com.bean;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Transient;

public class Joinzbxx implements Serializable {
	@Id
    private Integer id;

    private Integer declareid;

    private Integer supplierid;

    private Double zbbj;

    private String zbfile;

    private Integer start;
    @Transient
    private List<Joinzbfile> lisjoinzbfile;
    @Transient
    private Declareform decl;
    
    

    public Declareform getDecl() {
		return decl;
	}

	public void setDecl(Declareform decl) {
		this.decl = decl;
	}

	public List<Joinzbfile> getLisjoinzbfile() {
		return lisjoinzbfile;
	}

	public void setLisjoinzbfile(List<Joinzbfile> lisjoinzbfile) {
		this.lisjoinzbfile = lisjoinzbfile;
	}

	private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDeclareid() {
        return declareid;
    }

    public void setDeclareid(Integer declareid) {
        this.declareid = declareid;
    }

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public Double getZbbj() {
        return zbbj;
    }

    public void setZbbj(Double zbbj) {
        this.zbbj = zbbj;
    }

    public String getZbfile() {
        return zbfile;
    }

    public void setZbfile(String zbfile) {
        this.zbfile = zbfile == null ? null : zbfile.trim();
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
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
        Joinzbxx other = (Joinzbxx) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getDeclareid() == null ? other.getDeclareid() == null : this.getDeclareid().equals(other.getDeclareid()))
            && (this.getSupplierid() == null ? other.getSupplierid() == null : this.getSupplierid().equals(other.getSupplierid()))
            && (this.getZbbj() == null ? other.getZbbj() == null : this.getZbbj().equals(other.getZbbj()))
            && (this.getZbfile() == null ? other.getZbfile() == null : this.getZbfile().equals(other.getZbfile()))
            && (this.getStart() == null ? other.getStart() == null : this.getStart().equals(other.getStart()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getDeclareid() == null) ? 0 : getDeclareid().hashCode());
        result = prime * result + ((getSupplierid() == null) ? 0 : getSupplierid().hashCode());
        result = prime * result + ((getZbbj() == null) ? 0 : getZbbj().hashCode());
        result = prime * result + ((getZbfile() == null) ? 0 : getZbfile().hashCode());
        result = prime * result + ((getStart() == null) ? 0 : getStart().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", declareid=").append(declareid);
        sb.append(", supplierid=").append(supplierid);
        sb.append(", zbbj=").append(zbbj);
        sb.append(", zbfile=").append(zbfile);
        sb.append(", start=").append(start);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}