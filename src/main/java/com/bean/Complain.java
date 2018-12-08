package com.bean;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Transient;

public class Complain implements Serializable {
	@Transient
	Admin admin;

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	@Transient
	Answer answer;

	public Answer getAnswer() {
		return answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}

	@Id
	private Integer id;

	private String name;

	private String content;

	private String caption;

	private Integer suppliersid;

	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption == null ? null : caption.trim();
	}

	public Integer getSuppliersid() {
		return suppliersid;
	}

	public void setSuppliersid(Integer suppliersid) {
		this.suppliersid = suppliersid;
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
		Complain other = (Complain) that;
		return (this.getId() == null ? other.getId() == null : this.getId()
				.equals(other.getId()))
				&& (this.getName() == null ? other.getName() == null : this
						.getName().equals(other.getName()))
				&& (this.getContent() == null ? other.getContent() == null
						: this.getContent().equals(other.getContent()))
				&& (this.getCaption() == null ? other.getCaption() == null
						: this.getCaption().equals(other.getCaption()))
				&& (this.getSuppliersid() == null ? other.getSuppliersid() == null
						: this.getSuppliersid().equals(other.getSuppliersid()));
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
		result = prime * result
				+ ((getName() == null) ? 0 : getName().hashCode());
		result = prime * result
				+ ((getContent() == null) ? 0 : getContent().hashCode());
		result = prime * result
				+ ((getCaption() == null) ? 0 : getCaption().hashCode());
		result = prime
				* result
				+ ((getSuppliersid() == null) ? 0 : getSuppliersid().hashCode());
		return result;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", id=").append(id);
		sb.append(", name=").append(name);
		sb.append(", content=").append(content);
		sb.append(", caption=").append(caption);
		sb.append(", suppliersid=").append(suppliersid);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}

}