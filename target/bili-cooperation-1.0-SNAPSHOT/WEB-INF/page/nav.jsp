<%--
  Created by IntelliJ IDEA.
  User: 10047
  Date: 2021/7/1
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <meta charset="utf-8">
    <title>导航栏</title>
    <link rel="stylesheet" href="${APP_PATH}/static/static/bootstrap/css/bootstrap.min.css">
</head>

<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header col-sm-5 col-md-5 ">
            <ul class="nav nav-tabs">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">bilibili主站
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li role="presentation" class="dropdown-header">视频分区</li>
                        <li>
                            <a href="#">动画</a>
                        </li>
                        <li>
                            <a href="#">番剧</a>
                        </li>
                        <li>
                            <a href="#">国创</a>
                        </li>
                        <li>
                            <a href="#">音乐</a>
                        </li>
                        <li>
                            <a href="#">舞蹈</a>
                        </li>
                        <li>
                            <a href="#">游戏</a>
                        </li>
                        <li>
                            <a href="#">知识</a>
                        </li>
                        <li class="divider"></li>
                        <li role="presentation" class="dropdown-header">非视频</li>
                        <li>
                            <a href="#">活动</a>
                        </li>
                        <li>
                            <a href="#">小黑屋</a>
                        </li>
                        <li>
                            <a href="#">新歌热榜</a>
                        </li>
                        <li>
                            <a href="#">课堂</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">番剧</a>
                </li>
                <li>
                    <a href="#">游戏中心</a>
                </li>
                <li>
                    <a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal">直播</a>
                </li>
                <!-- 模态框 -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">热门直播</h4>
                            </div>
                            <div class="modal-body">
                                <h3>正在直播：</h3>
                                <hr>
                                <p>
                                    <a href="#">1.xxx-Live</a><br>
                                    <a href="#">2.xxx-Live</a><br>
                                    <a href="#">3.xxx-Live</a><br>
                                    <a href="#">4.xxx-Live</a>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <!-- <button type="button" class="btn btn-primary">提交更改</button> -->
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <li>
                    <a href="#">会员购</a>
                </li>
                <li>
                    <a href="#">漫画</a>
                </li>
                <li>
                    <a href="#">赛事</a>
                </li>
                <!-- <li>
                    <a href="#">BML</a>
                </li> -->
            </ul>

        </div>
        <div class="col-md-3 ">
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="奋斗百年路，启航新征程">
                </div>
                <button type="submit" class="btn btn-default"><span
                        class="glyphicon glyphicon-search"></span></button>
            </form>
        </div>
        <div class="navbar-header col-md-3 col-sm-3">
            <ul class="nav nav-tabs">
                <li>
                    <a href="#">大会员</a>
                </li>
                <!-- <li>
                    <a href="#">消息</a>
                </li>
                <li>
                    <a href="#">动态</a>
                </li> -->
                <li>
                    <a href="#">收藏</a>
                </li>
                <li>
                    <a href="#">历史记录</a>
                </li>
                <li>
                    <a href="#">创作中心</a>
                </li>
            </ul>
        </div>
        <div class="col-md-1 ">
            <button type="button" class="btn btn-default navbar-btn">
                投稿
            </button>
        </div>
    </div>
</nav>
<script src="${APP_PATH}/static/static/js/jquery-3.5.1.min.js"></script>
<script src="${APP_PATH}/static/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
