package com.mcliu.ssm.util;

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

}
