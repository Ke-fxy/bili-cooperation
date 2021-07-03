<%--
  Created by IntelliJ IDEA.
  User: 10047
  Date: 2021/7/1
  Time: 13:17
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
    <title>Login</title>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
    <!--font-awesome 核心我CSS 文件-->
<%--    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">--%>
    <script src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.validate.min.js"></script>
</head>
<style>
    .denglu {
        padding-top: 30px;
    }

    .form {
        background: rgba(255, 255, 255, 0.2);
        width: 700px;
        margin: 200px auto;
    }

    .fa {
        display: inline-block;
        top: 27px;
        left: 6px;
        position: relative;
        color: #ccc;
    }

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
</style>

<body>
<!-- 导航栏 -->
<%@ include file="nav.jsp"%>
<!-- bilibili图片 -->
<div class="container-fluid" style="background-color: #00a0d8; height: 100px;">
    <img src="${APP_PATH}/static/img/bili登录.png" alt="123" class="col-md-4 col-md-offset-2"
         style="background-color: #00a0d8; width: 66%;">
</div>
<!-- 登录 -->
<div class="container">
    <div class="row">
        <div class="col-md-5 denglu">
            <strong>
                —————————————————————————————————
            </strong>
        </div>
        <div class="col-md-2">
            <h1 class="text-center">注册</h1>
        </div>
        <div class="col-md-5 denglu">
            <strong>
                —————————————————————————————————
            </strong>
        </div>
    </div>
</div>
<!-- 注册form -->
<div class="container">
    <div class="form row" id="register_div">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" action="${APP_PATH}/register" method="post">
            <!-- <h3 class="form-title col-md-offset-3">注册账户</h3> -->
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" name="username" id="userName"
                           autofocus="autofocus" value="${username}"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Password"
                           id="register_password" name="password" value="${password}"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-check fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Re-type Your Password"
                           name="rpassword" />
                </div>
                <div class="form-group">
                    <i class="fa fa-envelope fa-lg"></i>
                    <input class="form-control eamil" type="text" placeholder="Email" name="email" value="${email}"/>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-success pull-right" value="注册" id="sub"/>
                    <a href="${APP_PATH}/login1" class="btn btn-info pull-left" id="back_btn">返回登录页面</a>
                    <div class="form-group text-warning" >
                        <lead>${msg}</lead>
                    </div>
                    <!-- <input type="submit" class="btn btn-info pull-left" id="back_btn" value="返回登录页面" /> -->
                </div>
            </div>
        </form>
    </div>
</div>
<div style="background-color: #f6f9fa; width: 100%; height: 400px;">
    <div class="container">
        <div class="row" style="padding-top: 70px;">
            <div class="col-md-4">
                <p class="text-muted">
                    bilibili <br>
                </p>
                <ul class="list-unstyled">
                    <li><a href="#">关于我们</a> <a href="#">友情链接</a></li>
                    <li><a href="#">联系我们</a> <a href="#">隐私政策</a></li>
                    <li><a href="#">用户协议</a> <a href="#">bilibili认证</a></li>
                    <li><a href="#">加入我们</a> <a href="#">Investor Relations</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <p class="text-muted">
                    传送门 <br>
                </p>
                <ul class="list-unstyled">
                    <li><a href="#">协议汇总</a> <a href="#">帮助中心</a> <a href="#">名人堂</a></li>
                    <li><a href="#">活动中心</a> <a href="#">用户反馈</a> <a href="#">MCN管理中心</a></li>
                    <li><a href="#">活动专题页</a> <a href="#">壁纸站</a> <a href="#">高级弹幕</a></li>
                    <li><a href="#">侵权申诉</a> <a href="#">广告合作</a> <a href="#">企业号官网</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <img src="${APP_PATH}/static/img/partner%20(1).png" alt="" style="width: 50%;">
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" charset="utf-8" src="${APP_PATH}/static/js/main.js"></script>
</body>

</body>
</html>
