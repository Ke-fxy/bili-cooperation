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
    验证码：<img src="/kaptcha.jpg">
</form>
</body>
</html>