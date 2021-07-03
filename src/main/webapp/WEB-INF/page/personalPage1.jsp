<%--
  Created by IntelliJ IDEA.
  User: 10047
  Date: 2021/7/2
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <%--    <meta charset="utf-8">--%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>personalPage</title>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
    <!--font-awesome 核心我CSS 文件-->
    <%--    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">--%>
    <script src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.validate.min.js"></script>

</head>
<style type="text/css">

    input[type="text"],
    input[type="password"],
    input[type="email"] {
        padding-left: 26px;
    }

    .checkbox {
        padding-left: 21px;
    }

    li {
        padding-top: 10px;
    }

    li>a {
        padding-right: 30px;
    }

    a {
        text-decoration: none;
    }

    #touxiang {
        width: 120px;
        height: 120px;
    }

    #name {
        font-size: 22px;
        color: #fff;
    }

    #keyWord {
        color: black;
        font-size: 13px;
    }
</style>

<body style="background-color: #f4f5f7;">
<!-- 导航栏 -->
<%@ include file="nav.jsp"%>
<!-- 个人主页图片 -->
<div class="container" style="background: url(${APP_PATH}/static/img/personal.png); height: 320px;">
    <div style="height: 200px;"></div>
    <div class="row">
        <div class="col-md-1" id="touxiang">
            <img src="${APP_PATH}/static/img/touxiang.jpg" alt="233" class="img-circle" style="width: 100%;">
        </div>
        <div class="col-md-4">
            <!-- 文字下移 -->
            <div class="row" style="height: 15px;"></div>
            <span id="name">${user.username}</span> <br>
            <div class="row" style="height: 7px;"></div>
            <div class="input-group input-group-sm">
                <span class="input-group-addon">个人签名</span>
                <input type="text" class="form-control" id="keyWord" value=${user.tag}>
            </div>
            <!-- <span id="keyWord">各自努力，最高处见。</span> -->
        </div>
    </div>
</div>
<!-- 主页导航栏 -->

<nav class="navbar navbar-default container" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header col-md-8 ">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#" id="pZhuye" ><span class="glyphicon glyphicon-home"></span>主页</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-tree-deciduous"></span>动态</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-floppy-open"></span>投稿</a>
                </li>
                <li>
                    <a href="${APP_PATH}/toPage2"><span class="glyphicon glyphicon-facetime-video"></span>频道</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-bookmark"></span>收藏</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-heart-empty"></span>订阅</a>
                </li>

            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜索视频">
                    <button type="submit" class="btn btn-default"><span
                            class="glyphicon glyphicon-search"></span></button>
                </div>

            </form>
        </div>
        <div class="navbar-header col-md-4 col-sm-4">
            <ul class="nav nav-tabs">
                <li>
                    <a href="#"><small>关注数</small></a>
                </li>
                <li>
                    <a href="#"><small>粉丝数</small></a>
                </li>
                <li>
                    <a href="#"><small>播放数</small></a>
                </li>
                <li>
                    <a href="#"><small>阅读数</small></a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%@ include file="pZhuye.jsp"%>
<script type="text/javascript" src="js/main.js"></script>
<SCRIPT>
    $("#keyWord").change(function (){
        var key = this.value;
        $.ajax({
            url:"${APP_PATH}/changeTag",
            data:"keyWord=" + key,
            type:"GET",
            success:function (result){
                if(result.code == 100){
                    $("#keyWord").attr("value",key);
                }else {
                    $("#keyWord").attr("value","非法的个性签名！");
                }

            }
        });
    });


</SCRIPT>
<!-- <script>
    $("#page1").load("login.html");
</script> -->
</body>
</html>
