package com.bili.controller;

import com.bili.bean.Msg;
import com.bili.bean.User;
import com.bili.service.UserService;
import com.bili.util.DegistUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

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
    public String login(Model model, HttpServletRequest httpServletRequest, @RequestParam("id")Integer id, @RequestParam("password") String password,@RequestParam("userCheck") String userCheck){

        String token = (String) httpServletRequest.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        httpServletRequest.getSession().removeAttribute(KAPTCHA_SESSION_KEY);

        if(userCheck != null&&token.equalsIgnoreCase(userCheck)){
            System.out.println("验证码正确");
            /**
             * 对密码进行加密
             */
            String md5digest = DegistUtils.MD5digest(password);
            if(userService.login(id,md5digest)!=null){
                HttpSession session = httpServletRequest.getSession();
                session.setAttribute("id",id);
                if(id==1){
                    return "manage";
                }else {
                    return "redirect:index.jsp";
                }
            }else {
                model.addAttribute("msg","用户名或密码错误");
                model.addAttribute("id",id);
                return "Login";
            }
        }else {
            model.addAttribute("msg","验证码错误");
            return "Login";
        }
    }

    /**
     * 注册
     * @param
     * @param username
     * @param password
     * @param email
     * @return
     */
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(Model model,HttpServletRequest httpServletRequest,@RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("email") String email){

            if(userService.existsUsername(username)==1){
                model.addAttribute("msg","用户名不可用");
                return "Register";
            }else{
                /**
                 * 对密码进行加密
                 */
                String md5digest = DegistUtils.MD5digest(password);
                if (userService.register(new User(null,username,md5digest,email,null,null,null))==1){
                    int id = userService.getUserIdByName(username);
                    model.addAttribute("id",id);
                    return "Login";
                }else {
                    model.addAttribute("username",username);
                    model.addAttribute("password",password);
                    model.addAttribute("email",email);
                    return "Register";
                }
            }
    }

    /**
     * 检查用户名是否可用
     * @param username
     * @return
     */
    @RequestMapping(value = "/checkUser",method = RequestMethod.POST)
    @ResponseBody
    public Msg existsUsername(@RequestParam("username") String username){
        if (userService.existsUsername(username)==1){
            return Msg.fail();
        }
        return Msg.success();
    }


    /**
     * 从首页点击个人主页,跳转到个人主页,request域中有user对象
     * @param id
     * @return
     */
    @RequestMapping(value = "/getInfo",method = RequestMethod.GET)
    public String getInfo(HttpServletRequest request,@RequestParam("id") Integer id){
        if (id!=null){
            User user = userService.getInfo(id);
            if (user!=null){
                request.getSession().setAttribute("user",user);
                return "personalPage1";
            }else {
                return "Login";
            }
        }else {
            return "Login";
        }
    }

    /**
     * 在登录状态下发送ajax请求,需要keyword
     * @param request
     * @param tag
     * @return msg对象
     */
    @RequestMapping("/changeTag")
    @ResponseBody
    public Msg changeTag(HttpServletRequest request,@RequestParam("keyWord") String tag){
        Object id = request.getSession().getAttribute("id");
        if (userService.changeTag(id,tag)!=0){
            return Msg.success();
        }
        return Msg.fail();
    }

    /**
     * 在登录状态下发送ajax请求,需要notice
     * @param request
     * @param notice
     * @return msg对象
     */
    @RequestMapping("/changeNotice")
    @ResponseBody
    public Msg changeNotice(HttpServletRequest request,@RequestParam("notice") String notice){
        Object id = request.getSession().getAttribute("id");
        if (userService.changeNotice(id,notice)!=0){
            return Msg.success();
        }
        return Msg.fail();
    }

    /**
     * 登出
     * @param request
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:index.jsp";
    }

}
