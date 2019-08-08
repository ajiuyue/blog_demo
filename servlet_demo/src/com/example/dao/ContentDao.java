package com.example.dao;

import com.example.dto.ArchiveDTO;
import com.example.model.Content;

import java.util.List;

/**
 * Create bySeptember
 * 2019/8/2
 * 11:43
 */
public interface ContentDao {
    void insert(Content content);

    List<Content> list();

    Content getArticleById(Integer id);

    Integer getArticleCount();

    List<Content> list(Integer page, Integer size);

    Integer getArticleCountByPublishTime(String publishTime);

    List<Content> listByArticle(String publishTime, Integer offset, Integer size);

    List<ArchiveDTO> archiveArticle();
}
