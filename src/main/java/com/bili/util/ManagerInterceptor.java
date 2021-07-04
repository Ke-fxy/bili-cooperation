package com.bili.util;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 实现管理员身份的拦截器
 * @author Ihlov
 */
public class ManagerInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        /*if((httpServletRequest.getSession().getAttribute("id") == null) || (httpServletRequest.getSession().getAttribute("id") != "1")){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath());
            System.out.println("成功拦截");*/
            return false;
        /*}
        return true;*/
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
