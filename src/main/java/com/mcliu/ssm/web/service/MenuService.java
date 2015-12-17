package com.mcliu.ssm.web.service;

import java.util.List;

import com.mcliu.ssm.web.tree.MenuTreeNode;

public abstract interface MenuService {
    public abstract List<MenuTreeNode> buildMenuTree(String paramString1, String paramString2, String paramString3)
            throws Exception;
}
