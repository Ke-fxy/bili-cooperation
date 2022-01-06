package com.bili.service;

import com.bili.bean.Video;
import com.bili.dao.VideoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

/**
 * @author Ihlov
 */
@Service
public class VideoService {

    @Autowired
    VideoDao videoDao;

    public int save(Video video) {
        if (videoDao.insert(video) == 0) {
            return 0;
        }
        return 1;
    }

    public Video start(Integer id) {

        Video video = videoDao.selectVideoById(id);
        if (video != null) {
            return video;
        } else {
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

    public List<Video> getVideosByZone(String zone) {
        List<Video> videoList = videoDao.selectByZone(zone);
        return videoList;
    }

    public String getVAuthorNameByvAuthorId(Integer vAuthor) {
        String i = videoDao.selectUNameByUId(vAuthor);
        return i;
    }

    public int checkVName(String vName) {
        if (videoDao.selectByVName(vName) != null) {
            return 1;
        }
        return 0;
    }

    public int update(Integer id, String vName, String zone, String introduction) {
        return videoDao.update(id, vName, zone, introduction);
    }

    public int delete(Integer id) {
        return videoDao.deleteById(id);
    }

    public int addClickNum(Integer vId) {

        int oldClickNum = videoDao.selectClickNumByvId(vId);
        Random random = new Random();
        int add = random.nextInt(100);
        int i = videoDao.updateClickNum(vId, oldClickNum + add);
        if (i != 0) {
            int newClickNum = videoDao.selectClickNumByvId(vId);
            return newClickNum;
        } else {
            return 0;
        }
    }

    public List<Video> getRankByZone(String zone) {
        List<Video> videoList = videoDao.selectBiggestClickNumByZone(zone);
        return videoList;
    }

    public List<Video> getRank() {
        List<Video> videos = videoDao.selectBiggestClickNum();
        return videos;
    }
}
