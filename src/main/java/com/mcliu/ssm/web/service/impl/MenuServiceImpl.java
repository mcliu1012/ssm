package com.mcliu.ssm.web.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aspire.webbas.portal.common.entity.Menu;
import com.aspire.webbas.portal.common.entity.SubSystem;
import com.mcliu.ssm.util.Constant;
import com.mcliu.ssm.util.FileUtil;
import com.mcliu.ssm.web.dao.MenuDao;
import com.mcliu.ssm.web.service.MenuService;
import com.mcliu.ssm.web.tree.MenuTreeNode;
import com.mcliu.ssm.web.tree.TreeNode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
    private static Map<String, SubSystem> subSystemMap = null;
    @Autowired
    private MenuDao menuDao;
//    @Autowired
//    private SubSystemDao subSystemDao;
//    @Autowired
//    private AuthService authService;

    public List<MenuTreeNode> buildMenuTree(String loginName, String ticket, String defaultPath)
            throws Exception {
        List<Menu> menus = this.menuDao.listMenu(new Menu());

        List<Menu> targetMenus = new ArrayList<Menu>();

//        Map<String, String> urlMap = this.authService.listAddressUrlByLoginName(loginName);
        for (Menu m : menus) {
            targetMenus.add(m);
//            if (StringUtils.isEmpty(m.getUrl())) {
//                targetMenus.add(m);
//            } else if (this.authService.authorizeSuccess(m.getUrl(), urlMap)) {
//                targetMenus.add(m);
//            }
        }
        List<MenuTreeNode> list = new ArrayList<MenuTreeNode>();

        Map<String, MenuTreeNode> map = new LinkedHashMap<String, MenuTreeNode>();

        List<MenuTreeNode> roots = new ArrayList<MenuTreeNode>();
        for (Menu m : targetMenus) {
            MenuTreeNode node = toMenuNode(m, ticket, defaultPath);

            list.add(node);
            map.put(node.getId(), node);
        }
        for (MenuTreeNode node : list) {
            MenuTreeNode parent = map.get(node.getParentId());
            if (parent != null) {
                parent.addChild(node);
            }
        }
        for (MenuTreeNode node : list) {
            if ((node.isLeaf()) && (node.getUrl() == null)) {
                removeNode(map, node);
            }
        }
        for (MenuTreeNode node : map.values()) {
            if ("0".equals(node.getParentId())) {
                roots.add(node);
            }
        }
        return roots;
    }

    private Map<String, SubSystem> getSubSystem() {
        if (subSystemMap == null) {
            subSystemMap = loadSubSystem();
        }
        return subSystemMap;
    }

    private Map<String, SubSystem> loadSubSystem() {
        Map<String, SubSystem> map = new HashMap<String, SubSystem>();

//        List<SubSystem> list = this.subSystemDao.listSubSystem();
//        for (SubSystem sys : list) {
//            map.put(sys.getSubSystemId(), sys);
//        }
        return map;
    }

    private void removeNode(Map<String, MenuTreeNode> treeNodes, TreeNode node) {
        treeNodes.remove(node.getId());
        if (treeNodes.containsKey(node.getParentId())) {
            TreeNode parent = (TreeNode)treeNodes.get(node.getParentId());
            parent.removeChild(node);
            if (parent.isLeaf()) {
                removeNode(treeNodes, parent);
            }
        }
    }

    private MenuTreeNode toMenuNode(Menu m, String ticket, String defaultPath) {
        MenuTreeNode node = new MenuTreeNode();
        node.setId(m.getMenuId().toString());
        node.setParentId(m.getParentId().toString());
        node.setText(m.getMenuName());
        node.setMenuKey(m.getMenuKey());
        node.setIcon(m.getImageUrl());
        if ((m.getUrl() != null) && (!"".equals(m.getUrl()))) {
//            String contextPath = getSubSystemContext(m.getSubsystem());
//            if ((contextPath == null) || ("".equals(contextPath))) {
//                contextPath = defaultPath;
//            }
            String contextPath = defaultPath;
            node.setUrl(contextPath + m.getUrl() + "?ticket=" + ticket);
        }
        return node;
    }

    private String getSubSystemContext(String subSystemId) {
        Map<String, SubSystem> subSystems = getSubSystem();
        if (subSystems.containsKey(subSystemId)) {
            return ((SubSystem)subSystems.get(subSystemId)).getHopDomain();
        }
        return "";
    }
    
    /**
     * 生成菜单和权限
     */
    public void insertMenuAndAuth() {
        // 1.生成菜单
        // 1.1系统级别菜单
        String systemPath = getClass().getResource("/").getPath() + File.separator + "metadata_system_menu.json";
        insertMenuByPath(systemPath);
        // 1.2用户级别菜单
        String userPath = getClass().getResource("/").getPath() + File.separator + "metadata_menu.json";
        insertMenuByPath(userPath);
        
        // 2.生成权限
    }
    
    /**
     * 根据指定文件目录，生成菜单
     */
    @Transactional(rollbackFor = Exception.class)
    private void insertMenuByPath(String path) {
        String JsonContext = FileUtil.readFile(path);
        // 获取原始文件的JSON对象
        JSONObject jsonObjectOrigin = JSONObject.fromObject(JsonContext);
        String domain = jsonObjectOrigin.getString("domain");
        String subsystem = jsonObjectOrigin.getString("subsystem");
        JSONArray dataJsonArray = (JSONArray)jsonObjectOrigin.get("data");
        for (int i = 0; i < dataJsonArray.size(); i++) {
            // 构造父菜单
            JSONObject parentJsonObject = (JSONObject)dataJsonArray.get(i);
            Menu parentMenu = insertParentMenu(parentJsonObject, subsystem, domain);
            // 构造子菜单
            insertBatchChildMenu(parentJsonObject, parentMenu);
        }
    }
    
    /**
     * 生成父菜单
     */
    private Menu insertParentMenu(JSONObject parentJsonObject, String subsystem, String domain) {
        Menu parentMenu = new Menu();
        parentMenu.setMenuName(parentJsonObject.getString("text"));
        parentMenu.setMenuKey(parentJsonObject.getString("menuKey"));
        parentMenu.setParentId(Constant.PARENT_NODE_ID);
        parentMenu.setImageUrl(parentJsonObject.getString("icon"));
        parentMenu.setMenuOrder(parentJsonObject.getString("menuOrder"));
        parentMenu.setSubsystem(subsystem);
        parentMenu.setDomain(domain);
        menuDao.insert(parentMenu);
        return parentMenu;
    }
    
    /**
     * 生成子菜单
     */
    private void insertBatchChildMenu(JSONObject parentJsonObject, Menu parentMenu) {
        // 判断是否是叶子节点：false的话，构造子菜单
        boolean isLeaf = (boolean)parentJsonObject.get("leaf");
        if (!isLeaf) {
            List<Menu> childMenuList = new ArrayList<Menu>();
            JSONArray childJsonArray = (JSONArray)parentJsonObject.get("children");
            for (int j = 0; j < childJsonArray.size(); j++) {
                JSONObject childJsonObject = (JSONObject)childJsonArray.get(j);
                Menu childMenu = new Menu();
                childMenu.setMenuName(childJsonObject.getString("text"));
                childMenu.setMenuKey(childJsonObject.getString("menuKey"));
                childMenu.setParentId(parentMenu.getMenuId());
                childMenu.setImageUrl(childJsonObject.getString("icon"));
                childMenu.setUrl(childJsonObject.getString("url"));
                childMenu.setMenuOrder(childJsonObject.getString("menuOrder"));
                childMenu.setSubsystem(parentMenu.getSubsystem());
                childMenu.setDomain(parentMenu.getDomain());
                childMenuList.add(childMenu);
            }
            // 批量插入子菜单
            menuDao.insertBatch(childMenuList);
        }
    }
}
