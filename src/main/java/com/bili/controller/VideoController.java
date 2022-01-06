package com.bili.controller;

import com.bili.bean.Msg;
import com.bili.bean.Video;
import com.bili.service.VideoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author Ihlov
 */
@Controller
public class VideoController {

    @Autowired
    VideoService videoService;

    /**
     * 上传功能的实现，确定上传格式为mp4和jpeg
     * @param request
     * @param model
     * @param vName
     * @param video
     * @param vImg
     * @param zone
     * @param introduction
     * @return
     */
    @RequestMapping("/upload1")
    public String upload(HttpServletRequest request,Model model,@RequestParam(value = "vName",required = false) String vName,@RequestParam(value = "video",required = false) MultipartFile video,@RequestParam(value = "vImg",required = false) MultipartFile vImg,@RequestParam(value = "zone",required = false) String zone,@RequestParam(value = "introduction",required = false) String introduction){

        int id = (int) request.getSession().getAttribute("id");
        if(video==null||vImg==null){
            model.addAttribute("msg","上传失败，请检查格式");
            return "personalPage1";
        }else{
            if((video.getOriginalFilename().substring(video.getOriginalFilename().lastIndexOf(".")).equalsIgnoreCase(".mp4"))&&(vImg.getOriginalFilename().substring(vImg.getOriginalFilename().lastIndexOf(".")).equalsIgnoreCase(".jpeg"))){
                try {
                    video.transferTo(new File("C:\\Users\\Administrator\\IdeaProjects\\bili-cooperation\\src\\main\\webapp\\static\\upload\\video" + video.getOriginalFilename()));
                    vImg.transferTo(new File("C:\\Users\\Administrator\\IdeaProjects\\bili-cooperation\\src\\main\\webapp\\static\\upload\\pic" + vImg.getOriginalFilename()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                videoService.save(new Video(null,vName,"upload/video/" + video.getOriginalFilename(),id,"upload/pic/" + vImg.getOriginalFilename(),zone,introduction,0));
                model.addAttribute("msg","上传成功");
                return "personalPage1";
            }else {
                model.addAttribute("msg","上传失败，请检查格式");
                return "personalPage1";
            }
        }
    }

    /**
     * 播放功能
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/start")
    public String start(Model model, @RequestParam("id") Integer id){

        Video video = videoService.start(id);

        if (video!=null){
            model.addAttribute("video",video);
            String authorId = videoService.getVAuthorNameByvAuthorId(video.getvAuthor());
            model.addAttribute("authorId",authorId);
            return "display";
        }

        return "forward:index.jsp";
    }

    /**
     * 查询所有视频
     * @param pn
     * @return
     */
    @RequestMapping("/getAllList")
    @ResponseBody
    public Msg getAllVideoList(@RequestParam(value = "pn",defaultValue = "1") Integer pn){

        PageHelper.startPage(pn,8);
        List<Video> videoList = videoService.getAll();
        PageInfo pageInfo = new PageInfo(videoList,5);

        return Msg.success().add("pageInfo",pageInfo);
    }


    /**
     * 通过作者id查询视频列表
     * @param request
     * @param pn
     * @return
     */
    @RequestMapping("/getVideosByAuthor")
    @ResponseBody
    public Msg getVideosByvAuthor(HttpServletRequest request, @RequestParam(value = "pn",defaultValue = "1") Integer pn){

        Integer id;
        id = (Integer) request.getSession().getAttribute("id");

        PageHelper.startPage(pn,4);
        List<Video> videoList = videoService.getVideosByAuthor(id);
        PageInfo pageInfo = new PageInfo(videoList,5);

        return Msg.success().add("pageInfo",pageInfo);
    }

    /**
     * 通过分区查询视频列表
     * @param pn
     * @param zone
     * @return
     */
    @RequestMapping("/getVideosByZone")
    @ResponseBody
    public Msg getVideosByZone(@RequestParam(value = "pn",defaultValue = "1") Integer pn,@RequestParam("zone") String zone){

        PageHelper.startPage(pn,4);
        List<Video> videoList = videoService.getVideosByZone(zone);
        PageInfo pageInfo = new PageInfo(videoList,5);

        return Msg.success().add("pageInfo",pageInfo).add("zone",zone);
    }

    /**
     * 查询视频名字是否重复
     * @param vName
     * @return
     */
    @RequestMapping(value = "/checkVName",method = RequestMethod.POST)
    @ResponseBody
    public Msg checkVName(@RequestParam("vName") String vName){

        int i = videoService.checkVName(vName);

        if (i==0){
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }

    /**
     * 更新视频信息
     * @param id
     * @param vName
     * @param zone
     * @param introduction
     * @param vAuthor
     * @return
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Msg update(@RequestParam("id") Integer id,@RequestParam("vName") String vName,@RequestParam("zone") String zone,@RequestParam("introduction") String introduction,@RequestParam("vAuthor") Integer vAuthor){

        int update = videoService.update(id,vName,zone,introduction);

        return Msg.success();
    }

    /**
     * 删除视频
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Integer id){
        videoService.delete(id);
        return "manage";

    }

    /**
     * 点击播放后将视频的播放量增加一个随机数
     * @return
     */
    @GetMapping("/addClickNum")
    @ResponseBody
    public Msg addClickNum(@RequestParam("vId") Integer vId){
        int i = videoService.addClickNum(vId);
        if (i!=0){
            return Msg.success().add("clickNum",i);
        }else {
            return Msg.fail();
        }
    }


    @GetMapping("/getRank1")
    @ResponseBody
    public Msg getRankWithZone(String zone){
        List<Video> videoList = videoService.getRankByZone(zone);
        return Msg.success().add("videoList",videoList);
    }

    @GetMapping("/getRank")
    @ResponseBody
    public Msg getRankWith(String zone){
        List<Video> videoList = videoService.getRank();
        return Msg.success().add("videoList",videoList);
    }

}
