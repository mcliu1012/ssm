package com.mcliu.ssm.web.service;

import java.util.List;

import com.mcliu.ssm.web.tree.MenuTreeNode;

public interface MenuAndAuthService {
    public List<MenuTreeNode> buildMenuTree(String paramString1, String paramString2, String paramString3)
            throws Exception;
    
    public void insertMenuAndAuth() throws Exception;
}
