package com.example.servive;

import com.example.dto.ArchiveDTO;
import com.example.dto.PaginationDTO;
import com.example.model.Content;

import java.util.List;

/**
 * Create bySeptember
 * 2019/8/2
 * 11:43
 */
public interface ContentService {
    void insert(Content content);

    List<Content> list();

    PaginationDTO list(Integer page, Integer size);

    Content getArticleById(Integer id);

    Integer getArticleCount();

    PaginationDTO getArticleByPublishTime(String publishTime, Integer page, Integer size);

    List<ArchiveDTO> archiveArticle();
}
