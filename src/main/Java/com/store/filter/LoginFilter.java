package com.store.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
//登陆拦截器
@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request =  (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();

        String requestURL = request.getRequestURI();
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

        System.out.println(basePath);

        String finalRequestURL = requestURL.substring(path.length());
        System.out.println(finalRequestURL);

        if (null == session.getAttribute("id")){
            if(finalRequestURL.equals("/Admin/checkLogin") || finalRequestURL.equals("/") || finalRequestURL.equals("/Admin/register")){
                chain.doFilter(req, resp);
            }else {
                System.out.println("未登录访问" + basePath);
                System.out.println("拦截");
                response.sendRedirect( path + "/");
                return;
            }
        }else {
            chain.doFilter(req, resp);
        }
        return;
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
