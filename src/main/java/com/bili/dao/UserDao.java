package com.bili.dao;


import com.bili.bean.Concern;
import com.bili.bean.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

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

    /**
     * 根据用户名返回id
     * @param username
     * @return
     */
    int selectIdByName(@Param("username") String username);

    /**
     * 通过id查询用户名
     * @param id
     * @return
     */
    String selectUsernameById(Integer id);

    /**
     * 添加关注
     * @param concern
     * @return
     */
    @Insert("insert into concern values(#{id},#{concernId},#{concernedId},#{concernTime})")
    int insertConcern(Concern concern);

    /**
     * 删除关注
     * @param concernId
     * @param concernedId
     * @return
     */
    @Delete("delete from concern where concerner_id=#{concernId} and concerned_id=#{concernedId}")
    int cancelConcern(@Param("concernId") int concernId, @Param("concernedId") int concernedId);

    /**
     * 查看是否已关注
     * @param id
     * @param concernedId
     * @return
     */
    @Select("select * from concern where concerner_id=#{id} and concerned_id=#{concernedId}")
    Concern checkConcern(@Param("id") int id,
                         @Param("concernedId") Integer concernedId);

    @Select("select * from\n" +
            "        user u\n" +
            "        where u.id in (\n" +
            "            select concerner_id\n" +
            "            from concern\n" +
            "            where concerner_id=#{concernerId}\n" +
            "            )")
    public List<User> selectConcerns(int concernerId);

    @Select("select * from\n" +
            "            user u\n" +
            "        where u.id=(\n" +
            "            select concerned_id\n" +
            "            from concern\n" +
            "            where concerned_id=#{concernedId}\n" +
            "        )")
    public List<User> selectConcerneds(int concernedId);
}
