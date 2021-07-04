package com.bili.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 主要负责页面的一些简单跳转
 * @author Ihlov
 */
@Controller
public class MainController {

    @RequestMapping("/toMainPage")
    public String toMainPage(){
        return "mainPage";
    }

    @RequestMapping("/toMainPage2")
    public String toMainPage2(){
        return "mainPage2";
    }

    @RequestMapping("/toMainPage3")
    public String toMainPage3(){
        return "mainPage3";
    }

    @RequestMapping("/toMainPage4")
    public String toMainPage4(){
        return "mainPage4";
    }

    @RequestMapping("/toMainPage5")
    public String toMainPage5(){
        return "mainPage5";
    }

    @RequestMapping("/manage")
    public String toManagePage(){
        return "manage";
    }

    @RequestMapping("/login1")
    public String login1(){
        return "Login";
    }

    @RequestMapping("/register1")
    public String register(){
        return "Register";
    }

    @RequestMapping("/toPage2")
    public String toPage2(){
        return "personalPage2";
    }
}
