package com.mcliu.ssm.web.dao;

import java.util.List;

import com.aspire.webbas.portal.common.entity.Menu;

public abstract interface MenuDao {
    public abstract List<Menu> listMenu(Menu paramMenu);
    
    public abstract int insert(Menu menu);
    
    /**
     * 批量插入
     */
    public abstract int insertBatch(List<Menu> list);
}
