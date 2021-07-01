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

    /**
     * 注册用户
     * @param user
     * @return
     */
    int register(User user);

    /**
     * 查询用户名是否相同
     * @param username
     * @return
     */
    User selectByName(@Param("username") String username);

    /**
     * 通过id查询用户
     * @param id
     * @return
     */
    User selectById(@Param("id") Integer id);
}
