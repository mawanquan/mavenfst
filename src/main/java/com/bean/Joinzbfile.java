package com.bean;

import java.io.Serializable;

import javax.persistence.Id;

public class Joinzbfile implements Serializable {
	@Id
	private Integer id;

	private Integer zbxxid;

	private String filepath;
	private String filename;

	private static final long serialVersionUID = 1L;

	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getZbxxid() {
		return zbxxid;
	}

	public void setZbxxid(Integer zbxxid) {
		this.zbxxid = zbxxid;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath == null ? null : filepath.trim();
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
		Joinzbfile other = (Joinzbfile) that;
		return (this.getId() == null ? other.getId() == null : this.getId()
				.equals(other.getId()))
				&& (this.getZbxxid() == null ? other.getZbxxid() == null : this
						.getZbxxid().equals(other.getZbxxid()))
				&& (this.getFilepath() == null ? other.getFilepath() == null
						: this.getFilepath().equals(other.getFilepath()));
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
		result = prime * result
				+ ((getZbxxid() == null) ? 0 : getZbxxid().hashCode());
		result = prime * result
				+ ((getFilepath() == null) ? 0 : getFilepath().hashCode());
		return result;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", id=").append(id);
		sb.append(", zbxxid=").append(zbxxid);
		sb.append(", filepath=").append(filepath);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}
}