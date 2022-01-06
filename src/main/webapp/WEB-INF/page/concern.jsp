<%--
  Created by IntelliJ IDEA.
  User: 10047
  Date: 2022/1/6
  Time: 20:03
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
<div class="container">
    <table class="table table-striped" id="zz1">
        <caption>全部粉丝</caption>
        <thead>
        <tr>
            <th>用户名</th>
            <th>简介</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>


<script src="js/jquery-3.5.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${APP_PATH}/static/js/main.js"></script>
<script type="text/javascript">
    /**
     * 发送ajax请求
     */
    $(function (){
        to_Page(1);
    });

    function build_emps_table6(result){
        //首先得清空表格
        $("#zz1 tbody").empty();

        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item){
            // var empIdTd = $("<td></td>").append(item.id);
            var empNameTd = $("<td></td>").append(item.username);
            // var empGenderTd = $("<td></td>").append(item.zone);
            // var empEmailTd = $("<td></td>").append(item.vAuthor);
            var empDeptTd = $("<td></td>").append(item.tag);
            // var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm")
            //     .append("<span></span>").addClass("glyphicon glyphicon-pencil update_btn").attr("vId",item.id).attr("vAuthor",item.vAuthor)
            //     .append("编辑");
            // var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
            //     .append("<span></span>").addClass("glyphicon glyphicon-trash delete_btn").attr("vId",item.id)
            //     .append("取消关注");
            var div3=$("<tr></tr>")
                .append(empNameTd)
                .append(empDeptTd);

            $("#zz1 tbody").append(div3);
        });
    };


    function to_Page(pn){
        $.ajax({
            url:"${APP_PATH}/getConcerneds",
            data:"pn=" + pn +"&id="+ ${id},
            type:"GET",
            success:function (result){
                //1.解析并显示员工数据
                build_emps_table6(result);
            }
        });
    }



</script>
</body>
</html>