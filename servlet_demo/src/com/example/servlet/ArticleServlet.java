package com.example.servlet;

import com.example.dto.ArchiveDTO;
import com.example.dto.PreviousAndNextDTO;
import com.example.model.Content;
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
 * 19:18
 * ArticleServlet
 */
@WebServlet("/article")
public class ArticleServlet extends HttpServlet {
    private ContentService contentService = new ContentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("articleId");
        Content content = contentService.getArticleById(Integer.parseInt(id));
        req.setAttribute("content",content);
        List<ArchiveDTO> archiveDTOList = contentService.archiveArticle();
        req.setAttribute("archiveDTOList",archiveDTOList);
        PreviousAndNextDTO pnDTO = contentService.getPreviousAndNext(content);
        req.setAttribute("pnDTO",pnDTO);
        req.getRequestDispatcher("article.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
