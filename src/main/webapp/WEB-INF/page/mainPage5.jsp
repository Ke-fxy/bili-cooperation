<%--
  Created by IntelliJ IDEA.
  User: 10047
  Date: 2021/7/3
  Time: 10:34
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
</style>

<body data-spy="scroll" data-target="#myScrollspy">

<%@ include file="nav1.jsp"%>
<div class="container-fluid">

</div>
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
            <div class="row" style="height: 20px;">
                <div class="col-md-3 text-center">
                    <a href="#">首页</a>
                </div>
                <div class="col-md-3 text-center">
                    <a href="#">动态</a>
                </div>
                <div class="col-md-3 text-center">
                    <a href="#">热门</a>
                </div>
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
    <div class="jumbotron">
        <div id="myCarousel" class="carousel slide">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="${APP_PATH}/static/img/55.jpeg" alt="First slide">
                    <div class="carousel-caption">标题 1</div>
                </div>
                <div class="item">
                    <img src="${APP_PATH}/static/img/66.jpeg" alt="Second slide">
                    <div class="carousel-caption">标题 2</div>
                </div>
                <%--                <div class="item">--%>
                <%--                    <img src="${APP_PATH}/static/img/44.jpeg" alt="Third slide">--%>
                <%--                    <div class="carousel-caption">标题 3</div>--%>
                <%--                </div>--%>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-2" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="350">
                <li><a href="${APP_PATH}/toMainPage">游戏区</a></li>
                <li><a href="${APP_PATH}/toMainPage2">舞蹈区</a></li>
                <li><a href="${APP_PATH}/toMainPage3">科技区</a></li>
                <li><a href="${APP_PATH}/toMainPage4">生活区</a></li>
                <li><a href="#section-5">二次元</a></li>
            </ul>
        </div>
        <div class="col-xs-7">
            <h2 id="section-5">二次元</h2>
            <div  id="zone5" class="row">

            </div>
            <div class="row">
                <div class="col-lg-6" id="pia5">

                </div>
                <div class="col-lg-6" id="pna5">

                </div>
            </div><%--分页--%>
            <hr>
            <hr>
        </div>
        <div class="col-xs-3" >
            <h3>排行榜 TOP5</h3>
            <div class="list-group" id="topz5">
                <div>
                    <a href="#" class="list-group-item" id="t1"><em style="font-size: 25px ">1 </em>24*7 支持</a>
                </div>
                <div>
                    <a href="#" class="list-group-item" id="t2"><em style="font-size: 17px ">2 </em>免费 Window 空间托管</a>
                </div>
                <div>
                    <a href="#" class="list-group-item" id="t3"><em style="font-size: 17px ">3 </em>图像的数量</a>
                </div>
                <div>
                    <a href="#" class="list-group-item" id="t4"><em style="font-size:17px ">4 </em>每年更新成本</a>
                </div>
                <div>
                    <a href="#" class="list-group-item" id="t5"><em style="font-size:17px ">5 </em>每年更新成本</a>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>

<script>
    $(function (){
        to_Page(1,"2","#zone5","#pia5","#pna5");
        hotTop("2");
    });

    function hotTop(pn){
        $.ajax({
            url:"${APP_PATH}/getRank1",
            data:"zone=" + pn,
            type:"GET",
            success:function (result){
                //1.解析并显示员工数据
                build_emps_table5(result);
                //2.解析并显示分页信息
                // alert("!!");
                // build_page_info(result);
                //3.分页条
                // build_page_nav(result);
            }
        });
    }


    function build_emps_table5(result){
        //首先得清空表格
        $("#topz5").empty();

        var emps = result.extend.videoList;
        $.each(emps,function (index,item){
            var time = $("<em></em>").addClass(".text-uppercase").append(index+1).append(" ").append(item.vName).append("<br>");
            var vName = $("<small></small>").append(item.introduction);
            // alert("??");
            var ah = $("<a></a>").attr("href", "#").addClass("list-group-item").append(time).append(vName);
            // var bl = $("<blockquote></blockquote>").append(time).append(vName);
            // var ah = $("<a></a>").attr("href", "#").addClass("list-group-item").append(bl);
            // var div3 = $("<div></div>").addClass("list-group-item").append(ah);
            $("#topz5").append(ah);
        });
    };

    function to_Page(pn, zone, zoneDiv,pia,pna){
        $.ajax({
            url:"${APP_PATH}/getVideosByZone",
            data:"pn=" + pn+"&zone="+ zone,
            type:"GET",
            success:function (result){
                //1.解析并显示员工数据
                // alert(zoneDiv);
                build_emps_table(result, zoneDiv);
                // 2.解析并显示分页信息
                 build_page_info(result,pia);
                //3.分页条
                 build_page_nav(result,pna);
            }

     })
    }


    function build_emps_table(result,zoneDiv){
        //首先得清空表格
        $(zoneDiv).empty();


        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item){
            var pic = $("<img>").attr("src","static/"+item.vImg);
            var title=$("<h4></h4>").append(item.vName);
            var aut=$("<p></p>").append(item.vAuthor);
            var id=$("<p></p >").append(item.introduction);
            var div1=$("<div></div>").append(title)
                .addClass("caption")
                .append(aut)
                .append(id);
            var div2=$("<div></div>").append(pic)
                .addClass("thumbnail")
                .append(div1);

            var zz =item.id;
            var input=$("<input>").attr("type","hidden").attr("value",item.id).attr("name","id");
            var btn=$("<button></button>").attr("type","submit").attr("class","btn btn-default").append("播放").appendTo(input);
            var form=$("<form></form>").attr("role","form").append(input).append(btn).attr("action","${APP_PATH}/start").attr("target","_blank");
            // alert(input.val()+"??");
            <%--.attr("action","${APP_PATH}/start").attr("target","_blank");--%>
            // $(zoneDiv).append(form);
            var div3=$("<div></div>").append(div2).addClass(" col-md-3").append(form);
            $(zoneDiv).append(div3);
            // #item.zone
        });
    };

    function build_page_info(result,pia){

        $(pia).empty();

        $(pia).append("当前"+result.extend.pageInfo.pageNum+"页，总"+result.extend.pageInfo.pages+"叶，总记录数"+result.extend.pageInfo.total+"条");
    }

    function build_page_nav(result,pna){
        $(pna).empty();

        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            prePageLi.addClass("disabled");
            firstPageLi.addClass("disabled");
        }else {
            firstPageLi.click(function (){
                to_Page(1,"2","#zone5","#pia5","#pna5");
            });
            prePageLi.click(function (){
                to_Page(result.extend.pageInfo.pageNum - 1,"2","#zone5","#pia5","#pna5");
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if (result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function (){
                to_Page(result.extend.pageInfo.pageNum + 1,"2","#zone5","#pia5","#pna5");
            });
            lastPageLi.click(function (){
                to_Page(result.extend.pageInfo.pages,"2","#zone5","#pia5","#pna5");
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
                to_Page(item,"2","#zone5","#pia5","#pna5");
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo(pna);
    }
</script>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
