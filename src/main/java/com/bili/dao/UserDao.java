package com.bili.dao;


import com.bili.bean.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {

    /**
     * 通过id和name查询用户
     * @return
     * @param id
     * @param password
     */
    User selectByIdAndPassword(@Param("id") Integer id, @Param("password") String password);

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

    /**
     * 通过id查询用户并更改用户签名
     * @param id
     * @param tag
     * @return
     */
    int updateTagById(@Param("id") Object id, @Param("tag") String tag);

    /**
     * 通过id查询用户并更改用户给公告
     * @param id
     * @param notice
     * @return
     */
    int updateNoticeById(@Param("id") Object id, @Param("notice") String notice);
}
