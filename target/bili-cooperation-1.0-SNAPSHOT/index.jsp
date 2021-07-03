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
<jsp:forward page="/toMainPage"></jsp:forward>
<h1><%= "Hello World!" %>
</h1>
<br/>
<form action="${Path}/upload" method="post" enctype="multipart/form-data">
    视频：<input type="file" name="video">
    封面：<input type="file" name="vImg">
    视频名：<input type="text" name="vName">
    id:<input type="text" name="id">
    <input type="submit">
</form>
验证码：<img src="kaptcha.jpg" alt="" style="height: 40px;width: 80px">
<span>${sessionScope.id}</span>
<a href="${Path}/login1">111</a>
<a href="${Path}/register1">111</a>
<a href="${Path}/start?id=15">播放</a>
<video src="${Path}/${video.vPath}" controls></video>
<a href="${Path}/getInfo?id=${id}">page</a>
</body>
</html>
