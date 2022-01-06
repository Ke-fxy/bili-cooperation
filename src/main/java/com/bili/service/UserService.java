package com.bili.service;

import com.bili.bean.Concern;
import com.bili.bean.User;
import com.bili.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service
public class UserService {

    @Autowired
    UserDao userDao;

    public User login(Integer id, String password){
        if(userDao.selectByIdAndPassword(id, password)!=null){
            return userDao.selectByIdAndPassword(id, password);
        }
        return null;
    }

    public int register(User user) {
        if(userDao.register(user)!=0){
            return 1;
        }
        return 0;
    }

    /**
     *
     * @param username
     * @return 用户名存在返回1，不存在返回0
     */
    public int existsUsername(String username){
        if(userDao.selectByName(username)!=null){
            return 1;
        }
        return 0;
    }

    public User existsUser(Integer id){
        if(userDao.selectById(id)!=null){
            return userDao.selectById(id);
        }
        return null;
    }

    public User getInfo(Integer id) {
        if (userDao.selectById(id)!=null){
            return userDao.selectById(id);
        }
        return null;
    }

    public int changeTag(Object id, String tag) {
        return userDao.updateTagById(id,tag);
    }

    public int changeNotice(Object id, String notice) {
        return userDao.updateNoticeById(id,notice);
    }

    public int getUserIdByName(String username) {
        return userDao.selectIdByName(username);
    }

    public String getUsernameById(Integer id){
        return userDao.selectUsernameById(id);
    }

    public int addConcern(int id, Integer concernedId) {
        Date date = new Date();
        int i = userDao.insertConcern(new Concern(null, id, concernedId, new Timestamp(date.getTime())));
        return i;
    }

    public int checkConcern(int id, Integer concernedId) {
        Concern concern = userDao.checkConcern(id, concernedId);
        if (concern!=null){
            return 1;
        }else {
            return 0;
        }
    }

    public int deleteConcern(int id, Integer concernedId) {
        int i = userDao.cancelConcern(id, concernedId);
        if (i!=0){
            return 1;
        }else {
            return 0;
        }
    }

    public List<User> getConcerners(Integer id) {
        List<User> users = userDao.selectConcerns(id);
        return users;
    }

    public List<User> getConcerneds(Integer id) {
        List<User> users = userDao.selectConcerneds(id);
        return users;
    }
}
