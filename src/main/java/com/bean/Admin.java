package com.bean;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Transient;

public class Admin implements Serializable {
	@Id
    private Integer id; 

    private String adminname;

    private String adminpwd;

    private Integer adminstart;
 
    private String admindate;
  
    private Integer branchid;
    
    @Transient
    private Branch branch;

    private static final long serialVersionUID = 1L;
    

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname == null ? null : adminname.trim();
    }

    public String getAdminpwd() {
        return adminpwd;
    }

    public void setAdminpwd(String adminpwd) {
        this.adminpwd = adminpwd == null ? null : adminpwd.trim();
    }

    public Integer getAdminstart() {
        return adminstart;
    }

    public void setAdminstart(Integer adminstart) {
        this.adminstart = adminstart;
    }

    public String getAdmindate() {
        return admindate;
    }

    public void setAdmindate(String admindate) {
        this.admindate = admindate == null ? null : admindate.trim();
    }

    public Integer getBranchid() {
        return branchid;
    }

    public void setBranchid(Integer branchid) {
        this.branchid = branchid;
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
        Admin other = (Admin) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getAdminname() == null ? other.getAdminname() == null : this.getAdminname().equals(other.getAdminname()))
            && (this.getAdminpwd() == null ? other.getAdminpwd() == null : this.getAdminpwd().equals(other.getAdminpwd()))
            && (this.getAdminstart() == null ? other.getAdminstart() == null : this.getAdminstart().equals(other.getAdminstart()))
            && (this.getAdmindate() == null ? other.getAdmindate() == null : this.getAdmindate().equals(other.getAdmindate()))
            && (this.getBranchid() == null ? other.getBranchid() == null : this.getBranchid().equals(other.getBranchid()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getAdminname() == null) ? 0 : getAdminname().hashCode());
        result = prime * result + ((getAdminpwd() == null) ? 0 : getAdminpwd().hashCode());
        result = prime * result + ((getAdminstart() == null) ? 0 : getAdminstart().hashCode());
        result = prime * result + ((getAdmindate() == null) ? 0 : getAdmindate().hashCode());
        result = prime * result + ((getBranchid() == null) ? 0 : getBranchid().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", adminname=").append(adminname);
        sb.append(", adminpwd=").append(adminpwd);
        sb.append(", adminstart=").append(adminstart);
        sb.append(", admindate=").append(admindate);
        sb.append(", branchid=").append(branchid);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}