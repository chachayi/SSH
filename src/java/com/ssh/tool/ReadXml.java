package com.ssh.tool;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.InputStream;
import java.util.Iterator;

public class ReadXml {

    static  String content;

 public String readXml(int content_id, int newsCategory) throws DocumentException {

     String news_name;
        // 创建SAXReader的对象reader
        SAXReader reader = new SAXReader();
            // 通过reader对象的read方法加载books.xml文件,获取docuemnt对象。
     switch (newsCategory){
         case 1:
             news_name = "junshi_news";
             break;
         case 2:
             news_name = "caijing_news";
             break;
         case 3:
             news_name = "jiaoyu_news";
             break;
         case 4:
             news_name = "yule_news";
             break;
             default:
                 news_name = "keji_news";
                 break;
     }
     InputStream in = getClass().getClassLoader().getResourceAsStream("news_content/"+news_name+".xml");//读取文件流

     Document document = reader.read(in);
            // 通过document对象获取根节点
            Element newsRoot = document.getRootElement();
            // 通过element对象的elementIterator方法获取迭代器
            Iterator it = newsRoot.elementIterator();
            // 遍历迭代器，获取根节点中的信息
                System.out.println("=====开始遍历=====");
                while (it.hasNext()) {//遍历节点
                    Element newsChild = (Element) it.next();
                    if (newsChild.attributeValue("id").equals(content_id+"")) {
                        content = (newsChild.getStringValue());
                    }
                }
                System.out.println("=====结束遍历=====");
            return content;
    }
}