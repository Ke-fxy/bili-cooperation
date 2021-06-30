package com.bili.dao;


import com.bili.bean.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {

    /**
     * 通过id和name查询用户
     * @return
     * @param id
     * @param username
     */
    User selectByIdAndName(@Param("id") Integer id, @Param("username") String username);
}
