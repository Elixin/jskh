<%@ page language="java" import="java.util.Date,java.text.SimpleDateFormat" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.lw.jskh.entity.*,com.lw.jskh.dao.*,com.lw.jskh.dao.impl.*"%>
 <%
    String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>       
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 "/>
<title>教师考核系统</title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/common.css" />
<style type="text/css">
<!--
-->
</style>

</head>

<body>
 <%
          Teacher teacher = (Teacher)session.getAttribute("teacher");
          String year = "0000" ;
          if(teacher==null){
            response.sendRedirect("../index.jsp");
          }else{
             Date today=new Date();
             SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
             String str_today=simpleDateFormat.format(today);
             year = str_today.substring(0,4);
            //out.println("<br/><font color='red' size='3'>考评教师：" + teacher.getTrueName() + "</font>" );
            out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
            out.println(" <a href='../teacherExit'>退出登录</a>");
          
            %>

 <div align="center"   >
<br/><br/><br/><img alt="标准照" src="<%=basePath %>upload/<%=teacher.getPic()%>" width="100px"><br/>
<h1>我是教师：<font color='red' ><%=teacher.getTrueName() %></font> </h1><br/><br/><br/>
     <a href="teacherMyself.jsp">开始自评</a>　　｜
     　    <a href="teacherUpload.jsp">上传资料</a>　　｜　    
     <a href="#">评价团队负责人</a>　　｜　    
     <a href="teacherSet.jsp">设置个人信息</a>
 </div>
 <%} %>
</body>
</html>