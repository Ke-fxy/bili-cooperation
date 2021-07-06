package com.bili.controller;

import com.bili.bean.Comment;
import com.bili.bean.Msg;
import com.bili.service.CommentService;
import com.bili.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

/**
 * @author Ihlov
 */
@Controller
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @RequestMapping("/addComment")
    public String addComment(HttpServletRequest request,Model model, @RequestParam("vId") Integer vId, @RequestParam("uId") Integer uId, @RequestParam("content") String content){
        if(request.getSession().getAttribute("id")!=null){
            Comment comment = new Comment(null,content,vId,uId,new Timestamp(System.currentTimeMillis()), userService.getUsernameById(uId));
            System.out.println(comment);
            int addComment = commentService.addComment(comment);
            if(addComment==1){
                model.addAttribute("msg","评论发送成功");
                return "redirect:/start?id=" + vId;
            }else {
                model.addAttribute("msg","评论发送失败");
                return "redirect:/start?id=" + vId;
            }
        }else {
            return "Login";
        }
    }

    @RequestMapping("/getComments")
    @ResponseBody
    public Msg getComments(@RequestParam(value = "pn",defaultValue ="1") Integer pn,@RequestParam("vId") Integer vId){
        List<Comment> comments = commentService.getCommentsByvId(vId);

        if (comments!=null){
            PageHelper.startPage(pn,4);
            PageInfo pageInfo = new PageInfo(comments,5);
            return Msg.success().add("pageInfo",pageInfo);
        }
        return Msg.fail();
    }
}
