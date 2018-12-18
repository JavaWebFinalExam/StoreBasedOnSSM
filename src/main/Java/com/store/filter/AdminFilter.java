package com.store.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AdminFilter")
public class AdminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request =  (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();

        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

        if (null != session.getAttribute("isManager")) {
            if ((Boolean) session.getAttribute("isManager")) {
                chain.doFilter(req, resp);
                return;
            } else {
                System.out.println("非管理员访问");
                response.sendRedirect("BookStoreBasedOnSSM" + "/views/404.jsp");
                return;
            }
        }
        response.sendRedirect("BookStoreBasedOnSSM" + "/");
        return;
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
