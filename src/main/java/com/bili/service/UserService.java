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
}
