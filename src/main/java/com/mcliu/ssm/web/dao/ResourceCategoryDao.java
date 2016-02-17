package com.mcliu.ssm.web.dao;

import com.aspire.webbas.portal.common.entity.ResourceCategory;
import java.util.List;

public abstract interface ResourceCategoryDao {
    public abstract void insertResourceCategory(ResourceCategory paramResourceCategory);

    public abstract void deleteResourceCategoryById(Long paramLong);

    public abstract void deleteResourceCategoryByMetadataId(String paramString);
    
    public abstract void deleteAll();

    public abstract void updateResourceCategory(ResourceCategory paramResourceCategory);

    public abstract ResourceCategory findResourceCategory(Long paramLong);

    public abstract ResourceCategory findResourceCategoryByKey(String paramString);

    public abstract List<ResourceCategory> listResourceCategory(ResourceCategory paramResourceCategory);

    public abstract List<ResourceCategory> listRootResourceCategory(ResourceCategory paramResourceCategory);

    public abstract List<ResourceCategory> listResourceCategoryByParentId(Long paramLong);
}
