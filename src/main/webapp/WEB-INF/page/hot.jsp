<%--
  Created by IntelliJ IDEA.
  User: 10047
  Date: 2022/1/5
  Time: 20:37
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
    li>a {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 15px;
    }

    #myScrollspy ul.nav-tabs {
        width: 140px;
        margin-top: 20px;
        border-radius: 4px;
        border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
    }

    #myScrollspy ul.nav-tabs li {
        margin: 0;
        border-top: 1px solid #ddd;
    }

    #myScrollspy ul.nav-tabs li:first-child {
        border-top: none;
    }

    #myScrollspy ul.nav-tabs li a {
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }

    /*#myScrollspy ul.nav-tabs li.active a,*/
    /*#myScrollspy ul.nav-tabs li.active a:hover {*/
    /*    !*color: #fff;*!*/
    /*    !*background: #0088cc;*!*/
    /*    !*border: 1px solid #0088cc;*!*/
    /*}*/

    #myScrollspy ul.nav-tabs li:first-child a {
        border-radius: 4px 4px 0 0;
    }

    #myScrollspy ul.nav-tabs li:last-child a {
        border-radius: 0 0 4px 4px;
    }

    ul.nav-tabs.affix {
        top: 30px;
        /* Set the top position of pinned element */
    }

    #si a{
        text-decoration: none;
    }
</style>

<body data-spy="scroll" data-target="#myScrollspy">

<%@ include file="nav1.jsp"%>

<div class="container">
    <div class="row" style="height: 66px;">
        <!-- 四个超链接 -->
        <div class="col-md-3">
            <div class="row" style="height: 46px;">
                <div class="col-md-3">
                    <a href="#" id="sy"><img src="${APP_PATH}/static/img/sy1.jpg" alt="233" class="img-circle"
                                             style="width: 100%;"></a>
                </div>
                <div class="col-md-3">
                    <a href="#" id="dt"><img src="${APP_PATH}/static/img/dt1.jpg" alt="233" class="img-circle"
                                             style="width: 100%;"></a>
                </div>
                <div class="col-md-3">
                    <a href="#" id="rm"><img src="${APP_PATH}/static/img/rm1.jpg" alt="233" class="img-circle"
                                             style="width: 100%;"></a>
                </div>
                <div class="col-md-3">
                    <a href="#" id="pd"><img src="${APP_PATH}/static/img/pd1.jpg" alt="233" class="img-circle"
                                             style="width: 100%;"></a>
                </div>
            </div>
            <div class="row" style="height: 20px;" id="si">
                <div class="col-md-3 text-center">
                    <a href="#">首页</a>
                </div>
                <div class="col-md-3 text-center">
                    <a href="#">动态</a>
                </div>
<%--                !!!!!!!--%>


                <div class="col-md-3 text-center">
                    <a href="#">热门</a>
                </div>


<%--!!!!!!!--%>


                <div class="col-md-3 text-center">
                    <a href="#">频道</a>
                </div>
            </div>

        </div>
        <div class="col-md-6">
            <div class="row" style="height: 2px;"></div>
            <ul class="breadcrumb">
                <li><a href="#">动 画</a></li>
                <li><a href="#">音 乐</a></li>
                <li><a href="#section-2">舞 蹈</a></li>
                <li><a href="#">知 识</a></li>
                <li><a href="#section-4">生 活</a></li>
                <li><a href="#">时 尚</a></li>
                <li><a href="#">娱 乐</a></li>
                <li><a href="#">放 映 厅</a></li>
                <br>
                <li><a href="#section-5">番 剧</a></li>
                <li><a href="#">国 创</a></li>
                <li><a href="#section-1"> 游 戏</a></li>
                <li><a href="#section-3">科 技</a></li>
                <li><a href="#">鬼 畜</a></li>
                <li><a href="#">资 讯</a></li>
                <li><a href="#">影 视</a></li>
                <li><a href="#">更多</a></li>
            </ul>
        </div>
        <div class="col-md-3">
            <div class="row" style="height: 6px;"></div>
            <div class="row" style="height: 29px;">
                <div class="col-md-4 text-center">
                    <span class="glyphicon glyphicon-list-alt"></span>专栏
                </div>
                <div class="col-md-4 text-center">
                    <span class="glyphicon glyphicon-flag"></span>活动
                </div>
                <div class="col-md-4 text-center">
                    <span class="glyphicon glyphicon-lock"></span>小黑屋
                </div>
            </div>
            <div class="row" style="height: 29px;">
                <div class="col-md-4 text-center">
                    <span class="glyphicon glyphicon-facetime-video"></span>直播
                </div>
                <div class="col-md-4 text-center">
                    <span class="glyphicon glyphicon-paperclip"></span>课堂
                </div>
                <div class="col-md-4 text-center">
                    <span class="glyphicon glyphicon-headphones"></span>新歌
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <h1>热门榜</h1>
    <div class="row" id="top">
        <div class="col-lg-6" id="pia7">

        </div>
        <div class="col-lg-6" id="pna7">

        </div>
    </div>
</div>

<script>
    $(function (){
        getRank(1,"#top","#pia7","#pna7");
    });



    function getRank(pn, zoneDiv,pia,pna){
        $.ajax({
            url:"${APP_PATH}/getRank",
            data:"",
            type:"GET",
            success:function (result){
                //1.解析并显示员工数据
                // alert(zoneDiv);
                build_emps_table(result, zoneDiv);
              /*  // 2.解析并显示分页信息
                build_page_info(result,pia);
                //3.分页条
                build_page_nav(result,pna);*/
            }

        })
    }


    function build_emps_table(result,zoneDiv){
        //首先得清空表格
        $(zoneDiv).empty();


        var emps = result.extend.videoList.list;
        $.each(emps,function (index,item){
            var pic = $("<img>").attr("src",item.vImg);
            var title=$("<blockquote></blockquote>").append(item.vName);
            var aut=$("<small></small>").append(item.vAuthor);
            var id=$("<small></small>").append(item.introduction);
            var div1=$("<div></div>").append(title)
                .append(aut)
                .append(id);
            var div2=$("<div></div>").append(pic)
                .append(div1);
            var zz =item.id;
            var input=$("<input>").attr("type","hidden").attr("value",item.id).attr("name","id");
            var btn=$("<button></button>").attr("type","submit").attr("class","btn btn-default").append("播放").appendTo(input);
            var form=$("<form></form>").attr("role","form").append(input).append(btn).attr("action","${APP_PATH}/start").attr("target","_blank");
            // alert(input.val()+"??");
            <%--.attr("action","${APP_PATH}/start").attr("target","_blank");--%>
            // $(zoneDiv).append(form);
            var div3=$("<div></div>").append(div2).addClass("col-md-9").append(form);
            $(zoneDiv).append(div3);
            // #item.zone
        });
    };

    /*function build_page_info(result,pia){

        $(pia).empty();

        $(pia).append("当前"+result.extend.pageInfo.pageNum+"页，总"+result.extend.pageInfo.pages+"叶，总记录数"+result.extend.pageInfo.total+"条");
    }*/

    /*function build_page_nav(result,pna){
        $(pna).empty();

        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            prePageLi.addClass("disabled");
            firstPageLi.addClass("disabled");
        }else {
            firstPageLi.click(function (){
                to_Page(1,"#top","#pia7","#pna7");
            });
            prePageLi.click(function (){
                to_Page(result.extend.pageInfo.pageNum - 1,"#top","#pia7","#pna7");
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if (result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function (){
                to_Page(result.extend.pageInfo.pageNum + 1,"#top","#pia7","#pna7");
            });
            lastPageLi.click(function (){
                to_Page(result.extend.pageInfo.pages,"#top","#pia7","#pna7");
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
                to_Page(item,"#top","#pia7","#pna7");
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo(pna);
    }*/
</script>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
