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
     * @return 返回0表示失败，返回1表示成功
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    @ResponseBody
    public User login(@RequestParam("id")Integer id, @RequestParam("password") String password){
        if(userService.login(id,password)!=null){
            return userService.login(id, password);
        }
        return null;
    }
}
