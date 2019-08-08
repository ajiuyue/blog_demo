package com.example.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * 项目默认打开index.jsp页面，
 * 所有使用拦截器拦截第一次打开是跳转到 IndexServlet 来获取数据
 */
@WebFilter(urlPatterns = "/index.jsp")
public class IndexFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.getRequestDispatcher("/index").forward(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
