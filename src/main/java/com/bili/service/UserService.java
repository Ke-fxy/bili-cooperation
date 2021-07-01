package com.bili.service;

import com.bili.bean.User;
import com.bili.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserDao userDao;

    public User login(Integer id, String password){
        if(userDao.selectByIdAndName(id, password)!=null){
            return userDao.selectByIdAndName(id, password);
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
}
