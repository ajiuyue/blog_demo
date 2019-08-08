package com.example.dao.impl;

import com.example.dao.ContentDao;
import com.example.dto.ArchiveDTO;
import com.example.model.Content;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Create bySeptember
 * 2019/8/2
 * 11:44
 */
public class ContentDaoImpl implements ContentDao {

    ComboPooledDataSource dataSource = new ComboPooledDataSource();
    QueryRunner queryRunner = new QueryRunner(dataSource);

    @Override
    public void insert(Content content) {
        String sql = "insert into content(title,content,tag,gmtCreate,gmtModify) values(?,?,?,?,?)";
        try {
            queryRunner.update(sql,content.getTitle(),content.getContent(),content.getTag(),content.getGmtCreate(),content.getGmtModify());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Content> list() {
        String sql = "select * from content";
        BeanListHandler<Content> beanList = new BeanListHandler<>(Content.class);
        try {
            return queryRunner.query(sql,beanList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Content getArticleById(Integer id) {
        String sql = "select * from content where id =?";
        BeanHandler<Content> bean = new BeanHandler<>(Content.class);
        try {
            Content content = queryRunner.query(sql, bean, id);
            return content;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Integer getArticleCount() {
        String sql = "select count(id) from content";
        try {
            //scalarHandler：返回时第一行第一列的结果,默认返回的long类型
            ScalarHandler<Long> scalarHandler = new ScalarHandler<>();
            Integer count = queryRunner.query(sql,scalarHandler).intValue();
            return count;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Content> list(Integer page, Integer size) {
        String sql = "select * from content order by gmtCreate desc limit ?,?";
        BeanListHandler<Content> beanList = new BeanListHandler<>(Content.class);
        try {
            return queryRunner.query(sql,beanList,page,size);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Integer getArticleCountByPublishTime(String publishTime) {
        String sql = "select count(id) from content where gmtCreate like"+"'"+publishTime+"%'";
        try {
            //scalarHandler：返回时第一行第一列的结果,默认返回的long类型
            ScalarHandler<Long> scalarHandler = new ScalarHandler<>();
            Integer count = queryRunner.query(sql,scalarHandler).intValue();
            return count;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Content> listByArticle(String publishTime, Integer offset, Integer size) {
//        String sql = "select * from content where gmtCreate like"+"'"+publishTime+"%'"+"limit ?,?";
        String sql = "select * from content where gmtCreate like"+"'"+publishTime+"%'";
        BeanListHandler<Content> beanList = new BeanListHandler<>(Content.class);
        try {
            return queryRunner.query(sql,beanList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<ArchiveDTO> archiveArticle() {
        String sql = "SELECT year(gmtCreate) as year,month(gmtCreate) as month,COUNT(id) as count from content group by year ,month ";
        BeanListHandler<ArchiveDTO> beanList = new BeanListHandler<>(ArchiveDTO.class);
        try {
            return queryRunner.query(sql, beanList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
