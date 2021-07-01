package com.bili.controller;

import com.bili.bean.Msg;
import com.bili.bean.User;
import com.bili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
    public String login(Model model, HttpServletRequest httpServletRequest, @RequestParam("id")Integer id, @RequestParam("password") String password){
        if(userService.login(id,password)!=null){
            HttpSession session = httpServletRequest.getSession();
            session.setAttribute("id",id);
            return "forward:index.jsp";
        }
        model.addAttribute("msg","用户名或密码错误");
        model.addAttribute("id","id");
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
    public Msg existsUsername(@RequestParam("username") String username){
        if (userService.existsUsername(username)==1){
            return Msg.fail();
        }
        return Msg.success();
    }

    @RequestMapping("/login1")
    public String login1(){
        return "Login";
    }

    @RequestMapping("/register1")
    public String register(){
        return "Register";
    }
}
