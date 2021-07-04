package com.bili.dao;

import com.bili.bean.Video;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Ihlov
 */
public interface VideoDao {

    /**
     * 插入视频
     * @param video
     * @return
     */
    int insert(Video video);

    /**
     * 通过视频id查询视频
     * @param id
     * @return 返回video对象
     */
    Video selectVideoById(@Param("id") Integer id);

    /**
     * 返回所有视频的list
     * @return
     */
    List<Video> selectAll();

    /**
     * 通过作者id查询他的视频
     * @return
     * @param id
     */
    List<Video> selectByAuthor(@Param("id") Integer id);


    /**
     * 根据分区查找视频
     * @param zone
     * @return
     */
    List<Video> selectByZone(@Param("zone") String zone);

    /**
     * 根据用户id查询用户的名字
     * @param vAuthor
     * @return
     */
    String selectUNameByUId(@Param("vAuthor") Integer vAuthor);

    /**
     * 查询视频名字是否重复
     * @param vName
     * @return
     */
    Video selectByVName(@Param("vName") String vName);

    /**
     * 更新
     * @param id
     * @param vName
     * @param zone
     * @param introduction
     * @return
     */
    int update(@Param("id")Integer id,@Param("vName") String vName,@Param("zone") String zone,@Param("introduction") String introduction);

    /**
     * 通过id删除视频
     * @param id
     * @return
     */
    int deleteById(@Param("id") Integer id);
}
