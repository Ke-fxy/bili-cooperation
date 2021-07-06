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
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
</head>

<body>
<div class="container">
    <div class="col-md-7">
        <h4><a href="#">我的视频</a></h4>
        <div class="row">
            <div class="col-md-3">
                <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1">上传视频</button>
            </div>
            <div class="col-md-3 col-md-offset-3 text-warning">
                ${msg}
            </div>
        </div>

        <!-- 模态框（Modal） -->

        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">上传一个视频吧！</h4>
                    </div>
                    <div class="modal-body">

                        <!-- form -->
                        <form role="form" action="${APP_PATH}/upload1" method="post" enctype="multipart/form-data" id="videoUp">
                            <div class="form-group">
                                <label for="name">视频标题</label>
                                <input type="text" class="form-control" style="color: black" id="name" name="vName" placeholder="请输入视频标题">
                            </div>
                            <div class="form-group">
                                <label for="name">视频简介</label>
                                <textarea class="form-control" rows="3" name="introduction"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="name">分区</label>
                                <select class="form-control" name="zone">
                                    <option value="game">游戏区</option>
                                    <option value="dance">舞蹈区</option>
                                    <option value="sc">科技区</option>
                                    <option value="life">生活区</option>
                                    <option value="2">二次元</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputfile1">视频封面</label>
                                <input type="file" id="inputfile1" name="vImg">
                            </div>
                            <div class="form-group">
                                <label for="inputfile2">视频</label>
                                <input type="file" id="inputfile2" name="video">
                            </div>
                            <button type="submit" class="btn btn-default">提交</button>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <hr>
        <h4><a href="#">我的专栏</a></h4>
        <hr>
        <h4><a href="${APP_PATH}/toPage2">我的频道</a></h4>
        <hr>
        <a href="${APP_PATH}/logout" id="log" class="btn btn-primary">退出登录</a>
    </div>
    <div class="col-md-5">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">公告</h3>
            </div>
            <div class="panel-body" style="height: 200px;">
                请您遵守视频社区文明规范！
            </div>
        </div>
        <div class="row" style="height: 10px;"></div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h5 class="panel-title">
                    <span class="glyphicon glyphicon-eye-close"></span>仅自己可见
                </h5>
            </div>
            <div class="panel-body">
                您的ID：${user.id}
            </div>
        </div>
    </div>
</div>


<script src="js/jquery-3.5.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
    $("#videoUp").validate({
        rules: {
            vName: {
                required:true,
                maxlength: 8
            },
            introduction: {
                required: true,
            },
            vImg:"required",
            video:"required"
        },
        messages: {
            name: {
                required:"Please enter your video's name!",
                maxlength: jQuery.format("The password cannot be more than {0} characters!")
            },
            introduction: {
                required: "Please input an introduction!",
            },
            vImg:"Please select the file you want to upload!",
            video:"Please select the file you want to upload!",
            // userCheck: "Please enter Check Number!"
        }
    });
</script>
</body>
</html>
