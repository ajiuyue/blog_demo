package com.example.servlet;

import com.example.dto.ArchiveDTO;
import com.example.dto.PaginationDTO;
import com.example.model.Content;
import com.example.model.User;
import com.example.servive.ContentService;
import com.example.servive.impl.ContentServiceImpl;
import com.example.utils.RemoveHtmlUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Create bySeptember
 * 2019/8/2
 * 14:38
 * IndexServlet
 */
@WebServlet("/index")
public class IndexServlet extends HttpServlet {
    private ContentService contentService = new ContentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String page = req.getParameter("page");
        if (page == null){
            page = "0";
        }
        Integer size = 5;
        PaginationDTO paginationDTOList =  contentService.list(Integer.parseInt(page),size);
        req.setAttribute("paginationDTOList",paginationDTOList);
        List<ArchiveDTO> archiveDTOList = contentService.archiveArticle();
        req.setAttribute("archiveDTOList",archiveDTOList);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
