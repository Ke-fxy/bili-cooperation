package com.bili.service;

import com.bili.bean.Video;
import com.bili.dao.VideoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Ihlov
 */
@Service
public class VideoService {

    @Autowired
    VideoDao videoDao;

    public int save(Video video){
        if(videoDao.insert(video)==0){
            return 0;
        }
        return 1;
    }
}
