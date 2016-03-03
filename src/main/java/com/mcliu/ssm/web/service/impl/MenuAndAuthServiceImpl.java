package com.mcliu.ssm.web.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aspire.webbas.configuration.config.ConfigurationHelper;
import com.aspire.webbas.core.exception.MyException;
import com.aspire.webbas.portal.common.entity.Menu;
import com.aspire.webbas.portal.common.entity.Operation;
import com.aspire.webbas.portal.common.entity.OperationAddress;
import com.aspire.webbas.portal.common.entity.Resource;
import com.aspire.webbas.portal.common.entity.ResourceCategory;
import com.aspire.webbas.portal.common.entity.SubSystem;
import com.mcliu.ssm.util.Constant;
import com.mcliu.ssm.util.FileUtil;
import com.mcliu.ssm.web.dao.MenuDao;
import com.mcliu.ssm.web.dao.OperationAddressDao;
import com.mcliu.ssm.web.dao.OperationDao;
import com.mcliu.ssm.web.dao.ResourceCategoryDao;
import com.mcliu.ssm.web.dao.ResourceDao;
import com.mcliu.ssm.web.dao.SecRoleResourceOperationMapper;
import com.mcliu.ssm.web.entity.SecRoleResourceOperation;
import com.mcliu.ssm.web.service.MenuAndAuthService;
import com.mcliu.ssm.web.tree.MenuTreeNode;
import com.mcliu.ssm.web.tree.TreeNode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service("menuAndAuthService")
public class MenuAndAuthServiceImpl implements MenuAndAuthService {
    private static final Logger LOGGER = LoggerFactory.getLogger(MenuAndAuthServiceImpl.class);
    
    private static Map<String, SubSystem> subSystemMap = null;
    @Autowired
    private MenuDao menuDao;
//    @Autowired
//    private SubSystemDao subSystemDao;
//    @Autowired
//    private AuthService authService;
    @Autowired
    private ResourceCategoryDao resourceCategoryMapper;
    
    @Autowired
    private ResourceDao resourceMapper;
    
    @Autowired
    private OperationDao operationMapper;
    
    @Autowired
    private OperationAddressDao addressMapper;

    @Autowired
    private SecRoleResourceOperationMapper secRoleResourceOperationMapper;

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
    @Transactional(rollbackFor = Exception.class)
    public void insertMenuAndAuth() {
        // 1.生成菜单
        menuDao.deleteAll();
        // 1.1系统级别菜单
        insertMenuByPath("metadata_system_menu.json");
        // 1.2用户级别菜单
        insertMenuByPath("metadata_menu.json");
        
        // 2.生成权限
        // 2.1添加资源权限
        
        // 2.1.1 备份sec_role_resource_operation数据
        List<SecRoleResourceOperation> roleResourceOperations = secRoleResourceOperationMapper.selectAll();
        // 2.1.2 删除数据
        resourceCategoryMapper.deleteAll();
        // 2.1.3 插入权限数据
        insertAuth("metadata_auth_auth.xml");
        insertAuth("metadata_auth_exclude.xml");
        insertAuth("metadata_system_auth_auth.xml");
        // 2.1.4 恢复sec_role_resource_operation数据
        recoveryRoleResourceOperation(roleResourceOperations);
    }
    
    /**
     * 根据指定文件目录，生成菜单
     */
    @Transactional(rollbackFor = Exception.class)
    private void insertMenuByPath(String fileName) {
        String basePath = ConfigurationHelper.getBasePath();
        String path = basePath + "/metadata/menu/" + fileName;
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
    
    /**
     * 添加资源权限
     */
    @Transactional(rollbackFor = Exception.class)
    private void insertAuth(String fileName) {
        try {
            // 将src下面的xml转换为输入流
    //            InputStream inputStream = this.getClass().getResourceAsStream("/metadata_auth_auth.xml");
            // 创建SAXReader读取器，专门用于读取xml
            SAXReader saxReader = new SAXReader();
            // 根据saxReader的read重写方法可知，既可以通过inputStream输入流来读取，也可以通过file对象来读取
    
            // 方式一：通过inputStream输入流来读取
    //            Document document = saxReader.read(inputStream);
            
            // 方式二：通过file对象来读取（必须是绝对地址）
            String basePath = ConfigurationHelper.getBasePath();
            Document document = saxReader.read(new File(basePath + "/metadata/auth/" + fileName));
            // 取得根节点
            Element rootElement = document.getRootElement();
            if (null == rootElement) {
                return;
            }
            String domain = rootElement.attributeValue("id");
            String metadata_id = rootElement.attributeValue("subsystem");
            // 1.资源分类－第一级
            Element parentResourceCategory = rootElement.element("resource-category");
            if (null == parentResourceCategory) {
                return;
            }
            // 构造父ResourceCategory
            ResourceCategory parentCategory = new ResourceCategory();
            parentCategory.setCategoryKey(parentResourceCategory.attributeValue("key"));
            parentCategory.setCategoryName(parentResourceCategory.attributeValue("name"));
            parentCategory.setCategoryDesc(parentResourceCategory.attributeValue("desc"));
            parentCategory.setOrderKey(Integer.valueOf(parentResourceCategory.attributeValue("orderKey")));
            parentCategory.setMetadataId(metadata_id);
            parentCategory.setDomain(domain);
            // insert sec_resource_category 表
            resourceCategoryMapper.insertResourceCategory(parentCategory);
            
            // 2.第二级 <resource-category> 集合
            List<Element> childResourceCategoryList = parentResourceCategory.elements("resource-category");
            for (Element childResourceCategoryE : childResourceCategoryList) {
                ResourceCategory childCategory = new ResourceCategory();
                childCategory.setParentId(parentCategory.getCategoryId());
                childCategory.setCategoryKey(childResourceCategoryE.attributeValue("key"));
                childCategory.setCategoryName(childResourceCategoryE.attributeValue("name"));
                childCategory.setCategoryDesc(childResourceCategoryE.attributeValue("desc"));
                childCategory.setOrderKey(100);
                childCategory.setMetadataId(metadata_id);
                childCategory.setDomain(domain);
                // insert sec_resource_category 表
                resourceCategoryMapper.insertResourceCategory(childCategory);
                
                // 3.第三级 <resource> 集合
                List<Element> resourceList = childResourceCategoryE.elements("resource");
                for (Element resourceE : resourceList) {
                    Resource resource = new Resource();
                    resource.setResourceKey(resourceE.attributeValue("key"));
                    resource.setResourceName(resourceE.attributeValue("name"));
                    resource.setResourceDesc(resourceE.attributeValue("desc"));
                    resource.setCategoryId(childCategory.getCategoryId());
                    resource.setAuthType("AUTH");
                    resource.setMetadataId(metadata_id);
                    resource.setDomain(domain);
                    resource.setOrderKey(100);
                    // insert
                    resourceMapper.insertResource(resource);
                    
                    // 4.第四级 <operation> 集合
                    List<Element> operationList = resourceE.elements("operation");
                    for (Element operationE : operationList) {
                        Operation operation = new Operation();
                        operation.setResourceId(resource.getResourceId());
                        operation.setOperationKey(operationE.attributeValue("key"));
                        operation.setOperationName(operationE.attributeValue("name"));
                        operation.setOperationDesc(operationE.attributeValue("desc"));
                        operation.setMetadataId(metadata_id);
                        operation.setDomain(domain);
                        operation.setOrderKey(100);
                        // insert
                        operationMapper.insertOperation(operation);
                        
                        // 5.第五级 <address> 集合
                        List<Element> addressList = operationE.elements("address");
                        for (Element addressE : addressList) {
                            OperationAddress address = new OperationAddress();
                            address.setResourceId(operation.getResourceId());
                            address.setOperationKey(operation.getOperationKey());
                            address.setOperationAddressName(addressE.attributeValue("name"));
                            address.setOperationAddressUrl(addressE.attributeValue("url"));
                            address.setMetadataId(metadata_id);
                            address.setDomain(domain);
                            // insert
                            addressMapper.insertOperationAddress(address);
                        }
                    }
                }
            }
        } catch (Exception e) {
            LOGGER.error("导入菜单和权限时发生错误：{}", e.getMessage());
            throw new MyException("导入菜单和权限时发生错误：" + e.getMessage());
        }
    }
    
    /**
     * 恢复sec_role_resource_operation数据
     * 
     * @param roleResourceOperations 备份的sec_role_resource_operation数据
     */
    @Transactional(rollbackFor = Exception.class)
    private void recoveryRoleResourceOperation(List<SecRoleResourceOperation> roleResourceOperations) {
        for (SecRoleResourceOperation info : roleResourceOperations) {
            Resource resource = resourceMapper.findResourceByKey(info.getResourceKey());
            if (null != resource) {
                Operation paramOperation = new Operation();
                paramOperation.setResourceId(resource.getResourceId());
                paramOperation.setOperationKey(info.getOperationKey());
                Operation operation = operationMapper.findOperation(paramOperation);
                if (null != operation) {
                    SecRoleResourceOperation roleResourceOperation = new SecRoleResourceOperation();
                    roleResourceOperation.setRoleId(info.getRoleId());
                    roleResourceOperation.setResourceId(operation.getResourceId());
                    roleResourceOperation.setOperationKey(operation.getOperationKey());
                    secRoleResourceOperationMapper.insert(roleResourceOperation);
                }
            }
        }
    }
    
    /**
     * 取得更新用ResourceCategory对象
     */
    private ResourceCategory getResourceCategory(ResourceCategory categoryDB, ResourceCategory category) {
        categoryDB.setParentId(category.getParentId());
        categoryDB.setCategoryName(category.getCategoryName());
        categoryDB.setCategoryDesc(category.getCategoryDesc());
        categoryDB.setMetadataId(category.getMetadataId());
        categoryDB.setDomain(category.getDomain());
        categoryDB.setOrderKey(category.getOrderKey());
        return categoryDB;
    }

    /**
     * 取得更新用Resource对象
     */
    private Resource getResource(Resource resourceDB, Resource resource) {
        resourceDB.setResourceKey(resource.getResourceKey());
        resourceDB.setResourceName(resource.getResourceName());
        resourceDB.setResourceDesc(resource.getResourceDesc());
        resourceDB.setCategoryId(resource.getCategoryId());
        resourceDB.setAuthType(resource.getAuthType());
        resourceDB.setMetadataId(resource.getMetadataId());
        resourceDB.setDomain(resource.getDomain());
        resourceDB.setOrderKey(resource.getOrderKey());
        return resourceDB;
    }

    /**
     * 取得更新用Operation对象
     */
    private Operation getOperation(Operation operationDB, Operation operation) {
        operationDB.setResourceId(operation.getResourceId());
        operationDB.setOperationKey(operation.getOperationKey());
        operationDB.setOperationName(operation.getOperationName());
        operationDB.setOperationDesc(operation.getOperationDesc());
        operationDB.setDependKey(operation.getDependKey());
        operationDB.setDependByKey(operation.getDependByKey());
        operationDB.setMetadataId(operation.getMetadataId());
        operationDB.setDomain(operation.getDomain());
        operationDB.setOrderKey(operation.getOrderKey());
        return operationDB;
    }

    /**
     * 取得更新用OperationAddress对象
     */
    private OperationAddress getOperationAddress(OperationAddress operationAddressDB, OperationAddress operationAddress) {
        operationAddressDB.setResourceId(operationAddress.getResourceId());
        operationAddressDB.setOperationKey(operationAddress.getOperationKey());
        operationAddressDB.setOperationAddressName(operationAddress.getOperationAddressName());
        operationAddressDB.setOperationAddressUrl(operationAddress.getOperationAddressUrl());
        operationAddressDB.setMetadataId(operationAddress.getMetadataId());
        operationAddressDB.setDomain(operationAddress.getDomain());
        return operationAddressDB;
    }
}
