package com.bili.dao;

import com.bili.bean.Video;

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
}
