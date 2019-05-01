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
    <%--<link type="text/css" rel="stylesheet" href="../css/teamTeacher.css">--%>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/teamTeacher.css" />
<style type="text/css">
<!--
-->
</style>

</head>

<body>
<div class="center" >
    <br><br>
    <%
        TeamLeader teamLeader = (TeamLeader)session.getAttribute("teamLeader");
        String year = "0000" ;
        if(teamLeader==null){
            response.sendRedirect("../index.jsp");
        }else{}
    %>


    <h1><font color='black' ><%=teamLeader.getPosition() %></font>:<font color='blue' size="50px"><%=teamLeader.getTrueName() %></font></h1><br/><br/>

    <h2><font color='red' ><%=teamLeader.getManagerTeam() %> </font>成员</h2>
    <br />
    <br />
    <br />
    <%
        TeamLeaderDao teamLeaderDao = new TeamLeaderDaoImpl();
        List<Teacher> teachers =  teamLeaderDao.getTeamTeacher(teamLeader.getId());
        int i=0;
        if(!teachers.isEmpty()){
            for(Teacher teacher : teachers){

                if (i%3==0) {%>
        <br />
    <%} %>

    <button class="button1"><a href="teamLeaderToTeacher.jsp?id=<%=teacher.getId()%>"><%=teacher.getTrueName() %></a></button>
    <%
                i=i+1;  }
        }
    %>

</div>
</body>
</html>