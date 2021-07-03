package com.bili.service;

import com.bili.bean.Video;
import com.bili.dao.VideoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public Video start(Integer id) {

        Video video = videoDao.selectVideoById(id);
        if (video!=null){
            return video;
        }else {
            return null;
        }
    }

    public List<Video> getAll() {
        List<Video> videoList = videoDao.selectAll();
        return videoList;
    }

    public List<Video> getVideosByAuthor(Integer id) {
        List<Video> videoList = videoDao.selectByAuthor(id);
        return videoList;
    }
}
