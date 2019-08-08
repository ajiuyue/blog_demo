package com.example.servlet;

import com.example.model.Content;
import com.example.servive.ContentService;
import com.example.servive.impl.ContentServiceImpl;
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
 * 2019/8/2
 * 10:45
 * PublishServlet
 */
@WebServlet("/publish")
public class PublishServlet extends HttpServlet {
    ContentService contentService = new ContentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.getRequestDispatcher("publish.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Map map = req.getParameterMap();
        Content content = new Content();
        try {
            BeanUtils.populate(content,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        contentService.insert(content);
        req.getRequestDispatcher("index").forward(req,resp);
    }
}
