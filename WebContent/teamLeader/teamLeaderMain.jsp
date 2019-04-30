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
    <link type="text/css" rel="stylesheet" href="../css/teamLeaderMain.css">

</head>
 <%
          TeamLeader teamLeader = (TeamLeader)session.getAttribute("teamLeader");
          String year = "0000" ;
          if(teamLeader==null){
            response.sendRedirect("../index.jsp");
          }else{
             Date today=new Date();
             SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
             String str_today=simpleDateFormat.format(today);
             year = str_today.substring(0,4);
            //out.println("<br/><font color='red' size='3'>考评教师：" + teamLeader.getTrueName() + "</font>" );
//            out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
//            out.println(" <a href='../teamLeaderExit'>退出登录</a>");
         
            %>
 <%} %>
<body >
<div class="center"></div>
<div class="system"><a href='../teamLeaderExit'>退出登录</a></div>
<div class="important">
    <span><%=teamLeader.getPosition() %></span>
    <div class="name"><%=teamLeader.getTrueName() %></div>
    <%
        String teamType = teamLeader.getTeamType().trim();
        if(teamType.equals("教学")){ %>
    <%--<div class="return1">--%>
        <button class="return1"><a href=teamTeacher.jsp>给教学团队成员考评</a></button>
    <%--</div>--%>
    <%--<div class="return">--%>
    <button  class="return"><a href=teamShowTeacher.jsp>查看教学团队成员得分</a></button>
    <%--</div>--%>
    <%--<div class="return2">--%>
        <button class="return2"><a href=teamAddTeacher.jsp>添加教学团队成员信息</a></button>
    <%--</div>--%>
       <% } %>
    <%
        if(teamType.equals("行政")){ %>
        <button class="return1"><a href=teamXingZheng.jsp >给行政团队成员考评</a></button>
        <button  class="return"><a href=teamShowXingZheng.jsp>查看团队成员得分</a></button>
        <button class="return2"><a href=teamAddXingZheng.jsp >添加教学团队成员信息</a></button>
    <% }%>


    <div class="time">登陆时间：<%Date today=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String str_today=simpleDateFormat.format(today);
        out.println("<font color='red' size='3'>" + str_today + "</font>" );
    %></div>
</div>
</body>
</html>
