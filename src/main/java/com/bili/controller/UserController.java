package com.bili.controller;

import com.bili.bean.User;
import com.bili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Ihlov
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 登录功能实现
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam("id")Integer id, @RequestParam("password") String password){
        if(userService.login(id,password)!=null){
            return "index";
        }
        return "login";
    }

    /**
     * 注册功能实现
     * @param id
     * @param username
     * @param password
     * @param phone
     * @return
     */
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(@RequestParam("id") Integer id,@RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("phone") String phone){
        if(userService.existsUsername(username)==1){
            return "register";
        }else{
            if (userService.register(new User(id,username,password,phone))==1){
                return "login";
            }
        }
        return "register";
    }

    @RequestMapping(value = "/checkUser",method = RequestMethod.POST)
    @ResponseBody
    public int existsUsername(@RequestParam("username") String username){
        if (userService.existsUsername(username)==1){
            return 1;
        }
        return 0;
    }
}
