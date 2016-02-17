package com.mcliu.ssm.web.dao;

import com.aspire.webbas.core.pagination.mybatis.pager.Page;
import com.aspire.webbas.portal.common.entity.PendTaskSetting;
import java.util.List;

public abstract interface PendTaskSettingMapper {
    public abstract int deleteByPrimaryKey(String paramString);

    public abstract int insert(PendTaskSetting paramPendTaskSetting);

    public abstract int insertSelective(PendTaskSetting paramPendTaskSetting);

    public abstract List<PendTaskSetting> pageQuery(Page<PendTaskSetting> paramPage);

    public abstract PendTaskSetting selectByPrimaryKey(String paramString);

    public abstract int updateByPrimaryKeySelective(PendTaskSetting paramPendTaskSetting);

    public abstract int updateByPrimaryKey(PendTaskSetting paramPendTaskSetting);
}
