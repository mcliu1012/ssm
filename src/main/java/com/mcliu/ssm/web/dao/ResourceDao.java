package com.mcliu.ssm.web.dao;

import com.aspire.webbas.portal.common.entity.Resource;
import java.util.List;
import java.util.Map;

public abstract interface ResourceDao {
    public abstract void insertResource(Resource paramResource);

    public abstract void deleteResourceByMetadataId(String paramString);

    public abstract void updateResource(Resource paramResource);

    public abstract Resource findResource(Long paramLong);

    public abstract Resource findResourceByKey(String paramString);

    public abstract List<Resource> listResource(Resource paramResource);

    public abstract List<Resource> listResourceByLoginName(String paramString);

    public abstract List<Resource> listResourceByRoleId(Long paramLong);

    public abstract List<Map<String, String>> listAllResourceAndOperation();

    public abstract List<Map<String, String>> listResourceOfStaff(Long paramLong);
}
