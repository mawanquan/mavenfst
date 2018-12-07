package com.bean;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Transient;

public class Branch implements Serializable {
	@Id
    private Integer id;

    private String branchname;

    private Integer branchnameid;
    @Transient
    private List<Branch> lisbranch;
    
    private  Integer start;
    
	private static final long serialVersionUID = 1L;
    public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public List<Branch> getLisbranch() {
		return lisbranch;
	}

	public void setLisbranch(List<Branch> lisbranch) {
		this.lisbranch = lisbranch;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBranchname() {
        return branchname;
    }

    public void setBranchname(String branchname) {
        this.branchname = branchname == null ? null : branchname.trim();
    }

    public Integer getBranchnameid() {
        return branchnameid;
    }

    public void setBranchnameid(Integer branchnameid) {
        this.branchnameid = branchnameid;
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
        Branch other = (Branch) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getBranchname() == null ? other.getBranchname() == null : this.getBranchname().equals(other.getBranchname()))
            && (this.getBranchnameid() == null ? other.getBranchnameid() == null : this.getBranchnameid().equals(other.getBranchnameid()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getBranchname() == null) ? 0 : getBranchname().hashCode());
        result = prime * result + ((getBranchnameid() == null) ? 0 : getBranchnameid().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", branchname=").append(branchname);
        sb.append(", branchnameid=").append(branchnameid);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}