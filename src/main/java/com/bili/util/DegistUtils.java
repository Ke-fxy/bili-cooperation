package com.bili.util;

import org.springframework.util.DigestUtils;

import java.nio.charset.StandardCharsets;

/**
 * 对数据进行MD5加密的工作类
 * @author Ihlov
 */
public class DegistUtils {

    public static String MD5digest(String password){
        String digest = DigestUtils.md5DigestAsHex(password.getBytes(StandardCharsets.UTF_8));
        return digest;
    }


    public static void main(String[] args){
        String password = "admin";
        String digest = MD5digest(password);
        System.out.println(digest);
    }
}
