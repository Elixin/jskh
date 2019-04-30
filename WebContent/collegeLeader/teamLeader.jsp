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
<div align="center">
<br><br>
 <%
          CollegeLeader collegeLeader = (CollegeLeader) session.getAttribute("collegeLeader");
          String year = "0000" ;
          if(collegeLeader==null){
            response.sendRedirect("../index.jsp");
          }else{
            
         
            %>
<h1><font color='blue' ><%=collegeLeader.getPosition() %></font>:<font color='red' ><%=collegeLeader.getTrueName() %></font></h1><br/><br/>


    <h2><font color='red' ><%=collegeLeader.getDep() %> </font>成员有：</h2>
    <br><br>
      <%
        CollegeLeaderDao collegeLeaderDao=new CollegeLeaderDaoImpl();
        List<TeamLeader> teamLeaders=collegeLeaderDao.getCollegeTeam(collegeLeader.getId());
        if(!teamLeaders.isEmpty()){
        	for(TeamLeader teamLeader : teamLeaders){
        		%>
        		<font color='red' size='5'><a href="collegeLeaderToTeamLeader.jsp?id=<%=teamLeader.getId()%>"><%=teamLeader.getTrueName() %></a></font>　　｜　
        		<%
        	}
        }
      
      %>
    
    
      　　　    
    
 </div>
 <%} %>
</body>
</html>