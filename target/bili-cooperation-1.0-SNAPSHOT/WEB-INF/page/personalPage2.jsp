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
                <input type="text" class="form-control" id="keyWord" value=${user.tag} >
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
                <li >
                    <a href="${APP_PATH}/getInfo?id=${id}" id="pZhuye" ><span class="glyphicon glyphicon-home"></span>主页</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-tree-deciduous"></span>动态</a>
                </li>
                <li >
                    <a href="#" ><span class="glyphicon glyphicon-floppy-open"></span>投稿</a>
                </li>
                <li class="active">
                    <a href="#"><span class="glyphicon glyphicon-facetime-video"></span>频道</a>
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

<%@ include file="pTougao.jsp"%>
<script type="text/javascript">

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

    $(function (){
        to_Page(1);
    });



    function to_Page(pn){
        $.ajax({
            url:"${APP_PATH}/getVideosByAuthor",
            data:"pn=" + pn,
            type:"GET",
            success:function (result){
                //1.解析并显示员工数据
                build_emps_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.分页条
                build_page_nav(result);
            }
        });
    }


    function build_emps_table(result){
        //首先得清空表格
        $("#showVideo").empty();

        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item){
            var pic = $("<img>").attr("src",item.vImg);
            var title=$("<h3></h3>").append(item.vName);
            var aut=$("<p></p>").append(item.vAuthor);
            var id=$("<p></p >").append(item.id);
            var div1=$("<div></div>").append(title)
                .addClass("caption")
                .append(aut)
                .append(id);
            var div2=$("<div></div>").append(pic)
                .addClass("thumbnail")
                .append(div1);
            var div3=$("<div></div>").append(div2).addClass(" col-md-3");

            var input=$("<input>").attr("type","hidden").attr("value",item.id).attr("name","id");
            var btn=$("<button></button>").attr("type","submit").attr("class","btn btn-default").append("播放").appendTo(input);
            var form=$("<form></form>").attr("role","form").append(input).append(btn).attr("action","${APP_PATH}/start").attr("target","_blank");
            var div3=$("<div></div>").append(div2).addClass(" col-md-3").append(form);
            $("#showVideo").append(div3);
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


    // $("#pZhuye").click(function (){
    //
    // });
</script>
<!-- <script>
    $("#page1").load("login.html");
</script> -->
</body>
</html>
