package com.mcliu.ssm.util;

import java.io.InputStream;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

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
            InputStream inputStream = this.getClass().getResourceAsStream("/metadata_auth_auth.xml");
            // 创建SAXReader读取器，专门用于读取xml
            SAXReader saxReader = new SAXReader();
            // 根据saxReader的read重写方法可知，既可以通过inputStream输入流来读取，也可以通过file对象来读取
            Document document = saxReader.read(inputStream);
            // 取得根节点
            Element rootElement = document.getRootElement();
            String domain = rootElement.attributeValue("id");
            String metadata_id = rootElement.attributeValue("subsystem");
            if (null != rootElement.elements("resource-category")) {
                // 资源分类－第一级
                List<Element> elementList = rootElement.elements("resource-category");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
