package com.example.servlet;
import com.example.model.User;
import com.example.servive.UserService;
import com.example.servive.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * Create bySeptember
 * 2019/7/29
 * 11:51
 */
@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)  {
        Map map = req.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user,map);
            System.out.println(user);
//            User dbUser = userService.selectByUsernameAndPassword(user);
//            if (dbUser != null){
//                System.out.println(dbUser.getUsername());
//            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        req.setAttribute("msg","hello");
        try {
            req.getRequestDispatcher("regist.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("Test");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
