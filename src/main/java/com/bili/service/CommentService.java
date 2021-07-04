package com.bili.service;


import com.bili.bean.Comment;
import com.bili.bean.CommentExample;
import com.bili.dao.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Ihlov
 */
@Service
public class CommentService {

    @Autowired
    CommentMapper commentMapper;

    public int addComment(Comment comment) {

        if (commentMapper.insertSelective(comment)==1){
            return 1;
        }else {
            return 0;
        }
    }

    public List<Comment> getCommentsByvId(Integer vId) {
        if (commentMapper.selectByvId(vId)!=null){
            return commentMapper.selectByvId(vId);
        }
        return null;
    }
}
