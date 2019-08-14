package com.example.servlet;

import com.example.servive.ContentService;
import com.example.servive.impl.ContentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Create bySeptember
 * 2019/8/8
 * 20:46
 * LikeServlet
 */
@WebServlet("/like")
public class LikeServlet extends HttpServlet {
    private ContentService contentService = new ContentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        contentService.incLikeCountById(Integer.parseInt(id));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
