<%--
  Created by IntelliJ IDEA.
  User: 10047
  Date: 2021/7/2
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>pTougao</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>

<body>
<div class="container">
    <div class="col-md-3">
        <ul class="nav nav-pills nav-stacked" style="max-width: 260px;">
            <li class="active">
                <a href="#">
                    <span class="badge pull-right">${ pageInfo.total}</span>
                    视频
                </a>
            </li>
            <li><a href="#">音频</a></li>
            <li>
                <a href="#">
                    <span class="badge pull-right">3</span>
                    专栏
                </a>
            </li>
            <li><a href="#">相册</a></li>
        </ul>
    </div>
    <div class="col-md-9">
        <div  id="showVideo" class="row">
        </div>
        <div class="row">
            <div class="col-lg-6" id="page_info_area">

            </div>
            <div class="col-lg-6" id="page_nav_area">

            </div>
        </div><%--分页--%>
    </div>

</div>


<script src="js/jquery-3.5.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
