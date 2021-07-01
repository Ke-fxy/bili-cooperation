<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <%
        pageContext.setAttribute("Path",request.getContextPath());
    %>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<form action="${Path}/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="video">
    <input type="submit">
    验证码：<img src="kaptcha.jpg" alt="" style="height: 40px;width: 80px">
    <span>${sessionScope.id}</span>
</form>
<a href="${Path}/login1">111</a>
<a href="${Path}/register1">111</a>

<video controls width="99%" loop>
    <source src="file:///E:/bili-cooperation/download/1.mp4" type="video/mp4">
</video>
</body>
</html>