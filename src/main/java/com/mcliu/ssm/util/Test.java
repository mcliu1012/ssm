package com.mcliu.ssm.util;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.aspire.webbas.configuration.config.ConfigurationHelper;
import com.aspire.webbas.portal.common.entity.ResourceCategory;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Test {

    @org.junit.Test
    public void test() {
//        String path = getClass().getResource("/").getPath() + java.io.File.separator + "metadata_menu.json";
        String path = getClass().getResource("/metadata_menu.json").getPath();

        System.out.println(FileUtil.readFile(path));
        
        
        String JsonContext = FileUtil.readFile(path);
        JSONObject jsonObject = JSONObject.fromObject(JsonContext);
        
        String domain = jsonObject.getString("domain");
        String subsystem = jsonObject.getString("subsystem");
        JSONArray jsonArray = (JSONArray)jsonObject.get("data");
//        int size = jsonArray.size();
//        System.out.println("Size: " + size);
//        for (int i = 0; i < size; i++) {
//            JSONObject jsonObject = jsonArray.getJSONObject(i);
//            System.out.println("[" + i + "]name=" + jsonObject.get("name"));
//            System.out.println("[" + i + "]package_name=" + jsonObject.get("package_name"));
//            System.out.println("[" + i + "]check_version=" + jsonObject.get("check_version"));
//        }
    }
    
    @org.junit.Test
    public void test2() {
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
            Document document = saxReader.read(new File("D:\\gitRepository\\ssm\\src\\main\\assembly\\config\\metadata\\auth\\metadata_auth_auth.xml"));
            // 取得根节点
            Element rootElement = document.getRootElement();
            if (null == rootElement) {
                return;
            }
            String domain = rootElement.attributeValue("id");
            String metadata_id = rootElement.attributeValue("subsystem");
            System.out.println("domain:" + domain);
            System.out.println("metadata_id:" + metadata_id);
            // 资源分类－第一级
            Element parentResourceCategory = rootElement.element("resource-category");
            if (null == parentResourceCategory) {
                return;
            }
            System.out.println("key:" + parentResourceCategory.attributeValue("key"));
            System.out.println("name:" + parentResourceCategory.attributeValue("name"));
            System.out.println("desc:" + parentResourceCategory.attributeValue("desc"));
            System.out.println("orderKey:" + parentResourceCategory.attributeValue("orderKey"));
            // 构造父ResourceCategory
            ResourceCategory parentCategory = new ResourceCategory();
            parentCategory.setCategoryKey(parentResourceCategory.attributeValue("key"));
            parentCategory.setCategoryName(parentResourceCategory.attributeValue("name"));
            parentCategory.setCategoryDesc(parentResourceCategory.attributeValue("desc"));
            parentCategory.setOrderKey(Integer.valueOf(parentResourceCategory.attributeValue("orderKey")));
            parentCategory.setMetadataId(metadata_id);
            parentCategory.setDomain(domain);
            // insert sec_resource_category 表
            
            // 第二级 <resource-category> 集合
            List<Element> childResourceCategoryList = parentResourceCategory.elements("resource-category");
            for (Element e : childResourceCategoryList) {
                System.out.println("key:" + e.attributeValue("key"));
                System.out.println("name:" + e.attributeValue("name"));
                System.out.println("desc:" + e.attributeValue("desc"));
                ResourceCategory childCategory = new ResourceCategory();
                childCategory.setParentId(parentCategory.getParentId());
                childCategory.setCategoryKey(e.attributeValue("key"));
                childCategory.setCategoryName(e.attributeValue("name"));
                childCategory.setCategoryDesc(e.attributeValue("desc"));
                childCategory.setOrderKey(100);
                childCategory.setMetadataId(metadata_id);
                childCategory.setDomain(domain);
                // insert sec_resource_category 表
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
