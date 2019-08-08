package com.example.filter;

import com.example.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Create bySeptember
 * 2019/8/4
 * 11:14
 */
@WebFilter("/publish")
public class PublishFilter implements Filter {
    private FilterConfig  config;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse)servletResponse;
        //获取session
        User user_info = (User) req.getSession().getAttribute("user_info");
        //判断 user_info 是否为空
        if(user_info != null){
            //登录成功
            //放行
            filterChain.doFilter(req, resp);
        }else{
            //登录失败或者未登录
            //跳转到登录页面
            resp.sendRedirect("login.jsp");
        }

    }

    @Override
    public void destroy() {
        config = null;
    }
}
