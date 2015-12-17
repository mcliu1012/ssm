package com.mcliu.ssm.web.dao;

import java.util.List;

import com.aspire.webbas.portal.common.entity.Menu;

public abstract interface MenuDao {
    public abstract List<Menu> listMenu(Menu paramMenu);
}
