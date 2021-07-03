package com.bili.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Ihlov
 */
@Controller
public class MainController {

    @RequestMapping("/toMainPage")
    public String toMainPage(){
        return "mainPage";
    }
}
