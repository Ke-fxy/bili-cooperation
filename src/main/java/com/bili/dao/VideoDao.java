package com.bili.dao;

import com.bili.bean.Video;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Ihlov
 */
public interface VideoDao {

    /**
     * 插入视频
     * @param video
     * @return
     */
    int insert(Video video);

    /**
     * 通过视频id查询视频
     * @param id
     * @return 返回video对象
     */
    Video selectVideoById(@Param("id") Integer id);

    /**
     * 返回所有视频的list
     * @return
     */
    List<Video> selectAll();

    /**
     * 通过作者id查询他的视频
     * @return
     * @param id
     */
    List<Video> selectByAuthor(@Param("id") Integer id);
}
