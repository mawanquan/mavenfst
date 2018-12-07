package com.bean;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Transient;

public class Premeau implements Serializable {
	@Id
    private Integer id;

    private String pre;

    private Integer prestart;

    private String url;
    private Integer start;
    
    @Transient
    List<Premeau> listpremeau;

    private static final long serialVersionUID = 1L;
    
   

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public List<Premeau> getListpremeau() {
		return listpremeau;
	}

	public void setListpremeau(List<Premeau> listpremeau) {
		this.listpremeau = listpremeau;
	}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPre() {
        return pre;
    }

    public void setPre(String pre) {
        this.pre = pre == null ? null : pre.trim();
    }

  

    public Integer getPrestart() {
		return prestart;
	}

	public void setPrestart(Integer prestart) {
		this.prestart = prestart;
	}

	public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
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
        Premeau other = (Premeau) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
        	&& (getStart() == null ? other.getStart() == null : this.getStart().equals(other.getStart()))
            && (this.getPre() == null ? other.getPre() == null : this.getPre().equals(other.getPre()))
            && (this.getPrestart() == null ? other.getPrestart() == null : this.getPrestart().equals(other.getPrestart()))
            && (this.getUrl() == null ? other.getUrl() == null : this.getUrl().equals(other.getUrl()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getStart() == null) ? 0 : getStart().hashCode());
        result = prime * result + ((getPre() == null) ? 0 : getPre().hashCode());
        result = prime * result + ((getPrestart() == null) ? 0 : getPrestart().hashCode());
        result = prime * result + ((getUrl() == null) ? 0 : getUrl().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", pre=").append(pre);
        sb.append(", prestart=").append(prestart);
        sb.append(", url=").append(url);
        sb.append(", start=").append(start);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}