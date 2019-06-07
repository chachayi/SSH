package com.ssh.tool;

import org.dom4j.DocumentException;

import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        int a = 0;
        for(int i = 0;i<10;i++) {
            try {
                a = a + 1;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
     System.out.println(a);
    }
}

