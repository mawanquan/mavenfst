package com.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Transient;

public class Answer implements Serializable {
	@Transient
	List<Admin> admin;

	public List<Admin> getAdmin() {
		return admin;
	}

	public void setAdmin(List<Admin> admin) {
		this.admin = admin;
	}

	@Id
	private Integer id;

	private Date answertime;

	private String answercontent;

	private Integer adminid;

	private Integer complainid;

	public Integer getComplainid() {
		return complainid;
	}

	public void setComplainid(Integer complainid) {
		this.complainid = complainid;
	}

	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getAnswertime() {
		return answertime;
	}

	public void setAnswertime(Date answertime) {
		this.answertime = answertime;
	}

	public String getAnswercontent() {
		return answercontent;
	}

	public void setAnswercontent(String answercontent) {
		this.answercontent = answercontent == null ? null : answercontent
				.trim();
	}

	public Integer getAdminid() {
		return adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
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
		Answer other = (Answer) that;
		return (this.getId() == null ? other.getId() == null : this.getId()
				.equals(other.getId()))
				&& (this.getAnswertime() == null ? other.getAnswertime() == null
						: this.getAnswertime().equals(other.getAnswertime()))
				&& (this.getAnswercontent() == null ? other.getAnswercontent() == null
						: this.getAnswercontent().equals(
								other.getAnswercontent()))
				&& (this.getAdminid() == null ? other.getAdminid() == null
						: this.getAdminid().equals(other.getAdminid()));
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((getId() == null) ? 0 : getId().hashCode());

		result = prime * result
				+ ((getAnswertime() == null) ? 0 : getAnswertime().hashCode());
		result = prime
				* result
				+ ((getAnswercontent() == null) ? 0 : getAnswercontent()
						.hashCode());
		result = prime * result
				+ ((getAdminid() == null) ? 0 : getAdminid().hashCode());
		return result;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", id=").append(id);
		sb.append(", answertime=").append(answertime);
		sb.append(", answercontent=").append(answercontent);
		sb.append(", adminid=").append(adminid);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}
}