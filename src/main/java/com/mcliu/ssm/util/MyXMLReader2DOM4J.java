package com.mcliu.ssm.util;

import java.io.File;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class MyXMLReader2DOM4J {

    public static void main(String arge[]) {
        long lasting = System.currentTimeMillis();
        try {
            File f = new File("src/main/resources/test.xml");
            SAXReader reader = new SAXReader();
            Document doc = reader.read(f);
            Element root = doc.getRootElement();
            Element foo;
            for (Iterator i = root.elementIterator("VALUE"); i.hasNext();) {
                foo = (Element)i.next();
                System.out.print("车牌号码：" + foo.elementText("NO"));
                System.out.println("车主地址：" + foo.elementText("ADDR"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
