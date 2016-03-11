package com.mcliu.ssm.web.entity;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonDeserialize;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.mcliu.ssm.web.model.CustomDateTimeDeserializer;
import com.mcliu.ssm.web.model.CustomDateTimeSerializer;


public class BaseEntity {
	/**
	 * 创建者
	 */
	private String creator;

	/**
	 * 创建时间
	 */
	private Date createTime;

	/**
	 * 更新者
	 */
	private String updator;

	/**
	 * 更新时间
	 */
	private Date updateTime;
	
	private String createUser;
	
	private Date createDate;

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime;
	}

	@JsonDeserialize(using = CustomDateTimeDeserializer.class)
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUpdator() {
		return updator;
	}

	public void setUpdator(String updator) {
		this.updator = updator;
	}
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime;
	}

	@JsonDeserialize(using = CustomDateTimeDeserializer.class)
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    @JsonSerialize(using = CustomDateTimeSerializer.class)
    public Date getCreateDate() {
        return createDate;
    }

    @JsonDeserialize(using = CustomDateTimeDeserializer.class)
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
	
}
