package com.example.servive.impl;

import com.example.dao.ContentDao;
import com.example.dao.impl.ContentDaoImpl;
import com.example.dto.ArchiveDTO;
import com.example.dto.PaginationDTO;
import com.example.dto.PreviousAndNextDTO;
import com.example.model.Content;
import com.example.servive.ContentService;
import com.example.utils.RemoveHtmlUtil;

import java.sql.Timestamp;
import java.util.List;

/**
 * Create bySeptember
 * 2019/8/2
 * 11:43
 */
public class ContentServiceImpl implements ContentService {
    private ContentDao contentDao = new ContentDaoImpl();
    @Override
    public void insert(Content content) {
        content.setGmtCreate(new Timestamp(System.currentTimeMillis()));
        content.setGmtModify(content.getGmtCreate());
        contentDao.insert(content);
    }

    @Override
    public List<Content> list() {
        return contentDao.list();
    }

    @Override
    public PaginationDTO list(Integer page, Integer size) {
        PaginationDTO paginationDTO = new PaginationDTO();
        //查询博客总量
        Integer totalCount = contentDao.getArticleCount();
        if (totalCount == 0){
            return paginationDTO;
        }
        //总页数
        Integer totalPage;
        if (totalCount % size == 0){
            totalPage = totalCount / size;
        } else{
            totalPage = totalCount / size + 1;
        }

        //解决前端页数为负数及大于总页数问题
        if (page<1){
            page = 1;
        }
        if (page>totalPage){
            page = totalPage;
        }
        //size*(page-1)
        Integer offset = size*(page-1);
        List<Content> contents = contentDao.list(offset,size);
        //消除MD的HTML和限制文章长度
        for (Content content : contents){
            content.setContent(RemoveHtmlUtil.removeHTML(content.getContent())
                    .length()>100?content.getContent()
                    .substring(0,100)+"...":content.getContent());
        }
        paginationDTO.setData(contents);
        paginationDTO.setPagination(totalPage,page);

        return paginationDTO;
    }

    @Override
    public Content getArticleById(Integer id) {
        Content article = contentDao.getArticleById(id);
        if (article != null) {
            contentDao.IncViewCountById(id,article);
        }
        return article;
    }

    @Override
    public Integer getArticleCount() {
        return contentDao.getArticleCount();
    }

    @Override
    public PaginationDTO getArticleByPublishTime(String publishTime, Integer page, Integer size) {
        PaginationDTO paginationDTO = new PaginationDTO();
        //查询博客总量
        Integer totalCount = contentDao.getArticleCountByPublishTime(publishTime);
        if (totalCount == 0){
            return paginationDTO;
        }
        //总页数
        Integer totalPage;
        if (totalCount % size == 0){
            totalPage = totalCount / size;
        } else{
            totalPage = totalCount / size + 1;
        }

        //解决前端页数为负数及大于总页数问题
        if (page<1){
            page = 1;
        }
        if (page>totalPage){
            page = totalPage;
        }
        //size*(page-1)
        Integer offset = size*(page-1);
        List<Content> contents = contentDao.listByArticle(publishTime,offset,size);
        //消除MD的HTML和限制文章长度
        for (Content content : contents){
            content.setContent(RemoveHtmlUtil.removeHTML(content.getContent())
                    .length()>100?content.getContent()
                    .substring(0,100):content.getContent());
        }
        paginationDTO.setData(contents);
        paginationDTO.setPagination(totalPage,page);

        return paginationDTO;
    }

    @Override
    public List<ArchiveDTO> archiveArticle() {

        return contentDao.archiveArticle();
    }

    @Override
    public void incLikeCountById(int id) {
        Content article = contentDao.getArticleById(id);
        if (article != null) {
            contentDao.incLikeCountById(id, article);
        }
    }

    @Override
    public PreviousAndNextDTO getPreviousAndNext(Content content) {
         PreviousAndNextDTO pnDTO = new PreviousAndNextDTO();
        List<Content> contentList = contentDao.getPreviousAndNext(content);
        if (contentList.size()==2){
            pnDTO.setPrevious(contentList.get(1));

        }
        pnDTO.setNext(contentList.get(0));
        return pnDTO;
    }
}
