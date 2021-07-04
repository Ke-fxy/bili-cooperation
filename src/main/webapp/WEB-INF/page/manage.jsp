<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Ihlov
  Date: 2021/5/30
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>
    <%--进入jQurey--%>
    <%--不以/开头的相对路径，以当前资源的路径为基准，容易出问题
        以/开头的相对路径，以服务器的路径作为标准
    --%>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
    <%--引入样式--%>
    <link href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">视频修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_form">
                    <input type="hidden" name="id" id="id_hidden">
                    <input type="hidden" name="vAuthor" id="vAuthor_hidden">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="vName" id="empName_add_input" placeholder="Name">
                            <span id="helpBlock1" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Zone_Select" class="col-sm-2 control-label">Zone</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="zone" id="Zone_Select">
                                <option value="game">游戏区</option>
                                <option value="dance">舞蹈区</option>
                                <option value="sc">科技区</option>
                                <option value="life">生活区</option>
                                <option value="2">二次元</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Introduction</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="introduction" id="introduction_input" placeholder="Introduction">
                            <span id="helpBlock3" class="help-block"></span>
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label  class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_add_btn">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1>视频管理</h1>
        </div>
        <div class="col-lg-2 col-lg-offset-10">
            <a href="${APP_PATH}/logout" id="log" class="btn btn-primary">退出登录</a>
        </div>

    </div><%--标题--%>
    <div class="row">
        <div class="col-lg-12">
            <table class="table table-hover" id="emps_table">
               <thead>
                   <tr>
                       <th>#</th>
                       <th>Name</th>
                       <th>Zone</th>
                       <th>AuthorId</th>
                       <th>Introduction</th>
                       <th>操作</th>
                   </tr>
               </thead>
               <tbody>
               </tbody>
            </table>
        </div>
    </div><%--列表--%>
    <div class="row">
        <div class="col-lg-6" id="page_info_area">

        </div>
        <div class="col-lg-6" id="page_nav_area">

        </div>
    </div><%--分页--%>
</div>
<script type="text/javascript">
    /**
     * 发送ajax请求
     */
    $(function (){
        to_Page(1);
    });

    function build_emps_table(result){
        //首先得清空表格
        $("#emps_table tbody").empty();

        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item){
            var empIdTd = $("<td></td>").append(item.id);
            var empNameTd = $("<td></td>").append(item.vName);
            var empGenderTd = $("<td></td>").append(item.zone);
            var empEmailTd = $("<td></td>").append(item.vAuthor);
            var empDeptTd = $("<td></td>").append(item.introduction);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil update_btn").attr("vId",item.id).attr("vAuthor",item.vAuthor)
                .append("编辑");
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                .append("<span></span>").addClass("glyphicon glyphicon-trash delete_btn").attr("vId",item.id)
                .append("删除");
            var btnTd = $("<td></td>")
                .append(editBtn)
                .append(" ")
                .append(deleteBtn);
            $("<tr></tr>").append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(empDeptTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
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

    function to_Page(pn){
        $.ajax({
            url:"${APP_PATH}/getAllList",
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

    $(document).on("click",".update_btn",function (){
        /*清楚表单数据*/
        /*$("#empAddModal form")[0].reset();*/
        var id = $(this).attr("vId");
        var vAuthor = $(this).attr("vAuthor");
        $("#empAddModal").modal({
        });
        $("#id_hidden").attr("value",id);
        $("#vAuthor_hidden").attr("value",vAuthor);
    });

    $(document).on("click",".delete_btn",function (){
        var id = $(this).attr("vId");
        location.href = "${APP_PATH}/delete?id="+id;
    })


    function validate_add_form(){
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){

            show_validate_msg("#empName_add_input","error","可以输入5-12位中英文");
            return false;
        }else {
            show_validate_msg("#empName_add_input","success","");
        }

        return true;
    }

    function show_validate_msg(ele,status,msg){
        /*清空之前的样式*/
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success" == status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if ("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    $("#empName_add_input").change(function (){
        //当内容发生改变时，发送ajax请求验证用户名是否可用
        var empName = this.value;

        $.ajax({
            url:"${APP_PATH}/checkVName",
            data:"vName=" + empName,
            type:"POST",
            success:function (result){
                if(result.code == 100){
                    show_validate_msg("#empName_add_input","success","视频名可用");
                    $("#emp_add_btn").attr("ajax_va","success");
                }else {
                    show_validate_msg("#empName_add_input","error","视频名重复");
                    $("#emp_add_btn").attr("ajax_va","error");
                }
            }
        });
    });

    /***********************************************************************/
    $("#emp_add_btn").click(function (){

        /*首先对数据进行前端校验*/
        if (!validate_add_form()){
            return false;
        }
        /*先判断之前的用户名重复校验*/
        if($(this).attr("ajax_va") == "error"){
            return false;
        }
        $.ajax({
            url:"${APP_PATH}/update",
            type:"POST",
            data: $("#add_form").serialize(),
            success:function (result){
                alert("修改成功，请刷新页面");
                $("#empAddModal").modal("hide");
            }
        })
    });


</script>
</body>
</html>
