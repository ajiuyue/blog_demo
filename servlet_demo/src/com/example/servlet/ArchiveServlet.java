package com.example.servlet;

import com.example.dto.ArchiveDTO;
import com.example.dto.PaginationDTO;
import com.example.servive.ContentService;
import com.example.servive.impl.ContentServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Create bySeptember
 * 2019/8/3
 * 15:24
 * ArchiveServlet
 */
@WebServlet("/archive")
public class ArchiveServlet extends HttpServlet {
    private ContentService contentService = new ContentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String page = req.getParameter("page");
        if (page == null){
            page = "0";
        }
        Integer size = 2;
        //获取归档时间
        String publishTime;
        String year = req.getParameter("year");
        String month = req.getParameter("month");
        if (Integer.parseInt(month)<10){
            month = "0"+month;
        }
        publishTime = year+"-"+month;
        PaginationDTO paginationDTOList = contentService.getArticleByPublishTime(publishTime,Integer.parseInt(page),size);
        req.setAttribute("paginationDTOList",paginationDTOList);

        List<ArchiveDTO> archiveDTOList = contentService.archiveArticle();
        req.setAttribute("archiveDTOList",archiveDTOList);
        req.getRequestDispatcher("archive.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
