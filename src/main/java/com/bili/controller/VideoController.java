package com.bili.controller;

import com.bili.bean.Video;
import com.bili.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * @author Ihlov
 */
@Controller
public class VideoController {

    @Autowired
    VideoService videoService;

    @RequestMapping("/upload")
    public void upload(@RequestParam("video") MultipartFile file){

        try {
            file.transferTo(new File("E:\\bili-cooperation\\download\\" + file.getOriginalFilename()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        videoService.save(new Video(null,file.getOriginalFilename(),"E:\\bili_cooperation\\download\\" + file.getOriginalFilename(),1,null));
    }
}
