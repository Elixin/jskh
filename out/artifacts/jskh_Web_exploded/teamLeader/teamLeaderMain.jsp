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
            out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
            out.println(" <a href='../teamLeaderExit'>退出登录</a>");
         
            %>

 <div align="center"   >
<br/><br/><br/>
<h2><font color='blue' ><%=teamLeader.getPosition() %></font>:<font color='red' ><%=teamLeader.getTrueName() %></font></h2><br/><br/>
     <%
       String teamType = teamLeader.getTeamType().trim();
     if(teamType.equals("教学")){
    	 out.println("<a href=teamTeacher.jsp>给教学团队成员考评</a>　　|　　");
    	 out.println("<a href=teamShowTeacher.jsp>查看教学团队成员得分</a>　　|　　");
    	 out.println("<a href=teamAddTeacher.jsp>添加教学团队成员信息</a>");
      }else if(teamType.equals("行政")){
    	 out.println("<a href=teamXingZheng.jsp>给行政团队成员考评</a>　　|　　");
    	 out.println("<a href=teamShowXingZheng.jsp>查看团队成员得分</a>　　|　　");
    	 out.println("<a href=teamAddXingZheng.jsp>添加教学团队成员信息</a>");
     }
     
     %>
       　　　    
    
 </div>
 <%} %>
</body>
</html>