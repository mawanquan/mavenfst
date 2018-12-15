package com.bean;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Transient;

public class Answer implements Serializable {
	@Transient
	Admin admin;

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	@Transient
	Complain complain;

	public Complain getComplain() {
		return complain;
	}

	public void setComplain(Complain complain) {
		this.complain = complain;
	}

	@Id
	private Integer id;

	private String answertime;

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

	public String getAnswertime() {
		return answertime;
	}

	public void setAnswertime(String string) {
		this.answertime = string;
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