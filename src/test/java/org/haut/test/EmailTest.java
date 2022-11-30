package org.haut.test;

import org.haut.util.Email.EmailUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class EmailTest {
    String str = "LiYH_0703@outlook.com";
    @Before
    public void init() throws Exception {
        System.out.println("开始测试");
    }
    @Test
    public void EmailTest() throws Exception {
        EmailUtil.instance.sendEmail(str);
    }
    @After
    public void destory() throws Exception {
        System.out.println("测试结束");
    }
}