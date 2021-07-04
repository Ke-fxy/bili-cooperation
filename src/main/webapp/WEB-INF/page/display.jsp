<%--
  Created by IntelliJ IDEA.
  User: 10047
  Date: 2021/7/3
  Time: 19:43
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
<body>
<!-- 导航栏 -->
<%--<%@ pagecontentType="text/html;charset=GB2312" language="java"errorPage=""%>--%>
<%@ include file="nav.jsp"%>
<div class="container">
    <!-- 播放 -->
    <div class="col-md-9">
        <div class="row" style="height: 60px;">
            作品：<br>
            <!-- 标题 -->
            <h1>${video.vName}</h1><br>
        </div>
        <div class="row" style="height: 20px">

        </div>
        <div class="row" style="height: 500px; width: 950px;">
            <video src="${APP_PATH}/${video.vPath}" controls width="850px" height="485px"></video>
        </div>

<%--        评论表单--%>
        <div class="row">
            <form class="form-inline" role="form" action="${APP_PATH}/addComment">
                <img src="${APP_PATH}/static/img/pl1.jpg" alt="233" class="img-circle" >
                <div class="form-group" style="width: 60px">

                </div>
                <div class="form-group">
                    <textarea class="form-control" rows="3" cols="75" placeholder="请输入一条友善的评论吧！" name="content"></textarea>
                    <input type="hidden" name="vId" value="${video.id}">
                    <input type="hidden" name="uId" value="${sessionScope.id}">
                </div>
                <div class="form-group" style="width: 25px">

                </div>
                <button type="submit" class="btn btn-info">评论</button>
            </form>
        </div>
    </div>
    <!-- 作者 -->
    <div class="col-md-3">
        <div class="row" style="height: 82px">

        </div>
        <div class="row">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        up主：
                    </h3>
                </div>
                <div class="panel-body">
                    <lead>${authorId}</lead>
                </div>
            </div>
        </div>
        <div class="row" style="height: 20px">

        </div>
        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        简介：
                    </h3>
                </div>
                <div class="panel-body">
                    <lead>${video.introduction}</lead>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-body" >
                <h2>评论区：</h2>
            </div>
        </div>
        <div class="row" id="comment">

        </div>
    </div>
    <div class="row">
        <div class="col-lg-6" id="page_info_area">

        </div>
        <div class="col-lg-6" id="page_nav_area">

        </div>
    </div><%--分页--%>
</div>

<script type="text/javascript" charset="utf-8" src="${APP_PATH}/static/js/main.js"></script>
<script>


    $(function (){
        to_Page(1);
    });



    function to_Page(pn){
        $.ajax({
            url:"${APP_PATH}/getComments",
            data:"pn=" + pn +"&vId="+ ${video.id},
            type:"GET",
            success:function (result){
                //1.解析并显示员工数据
                build_emps_table(result);
                //2.解析并显示分页信息
                // alert("!!");
                build_page_info(result);
                //3.分页条
                build_page_nav(result);
            }
        });
    }


    function build_emps_table(result){
        //首先得清空表格
        $("#comment").empty();

        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item){
            var time = $("<small></small>").append(new Date(item.time));
            var vName = $("<h3></h3>").addClass("panel-title").append(item.username).append("<br>") .append(time);
            var div1 = $("<div></div>").addClass("panel-body").append(item.content);
            var div2 = $("<div></div>").addClass("panel-heading").append(vName);
            // alert("??");
            var div3 = $("<div></div>").addClass("panel").addClass("panel-info").append(div2).append(div1);
            $("#comment").append(div3);

            // vName,评论, 时间
        });
    };

    function build_page_info(result){
        $("#page_info_area").empty();

        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总"+result.extend.pageInfo.pages+"叶，总记录数"+result.extend.pageInfo.total+"条");
    }

    function build_page_nav(result){
        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            prePageLi.addClass("disabled");
            firstPageLi.addClass("disabled");
        }else {
            firstPageLi.click(function (){
                to_Page(1);
            });
            prePageLi.click(function (){
                to_Page(result.extend.pageInfo.pageNum - 1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if (result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function (){
                to_Page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function (){
                to_Page(result.extend.pageInfo.pages);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        var pages = result.extend.pageInfo.navigatepageNums;
        $.each(pages,function (index,item){
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function (){
                to_Page(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
</script>
</body>
</html>
