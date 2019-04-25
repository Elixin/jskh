<%@ page language="java" import="java.util.Date,java.text.SimpleDateFormat" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
    String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 "/>
<title>教师考核系统</title>
<link type="text/css" rel="stylesheet" href="css/index.css">

</head>

<body>
<div class="center">
    <div class="title">教职工年度考核填报系统</div>
    <div class="button">
        <div class="teacher"><a href="index_teacher.jsp">教师</a></div>
        <div class="xingzheng"><a href="index_xingzheng.jsp">行政人员</a></div>
        <div class="fuzeren"><a href="index_teamLeader.jsp">团队负责人</a></div>
        <div class="lingdao"><a href="#">院领导</a></div>
    </div>
</div>
</body>
</html>