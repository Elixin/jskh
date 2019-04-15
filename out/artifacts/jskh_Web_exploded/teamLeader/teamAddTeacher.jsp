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
            out.println("　　｜　　 <a href='../teamLeaderExit'>退出登录</a>　　｜　　");
            out.println(" <a href='teamLeaderMain.jsp'>团队负责人主页</a>");
            %>

 <div align="center"   >
<br/><br/><br/>
<h2><font color='blue' ><%=teamLeader.getPosition() %></font>:<font color='red' ><%=teamLeader.getTrueName() %></font></h2><br/>
    <h3>为团队添加新成员</h3><br>
     <%  String info = request.getParameter("info");
        if(info!=null && info.equals("ok")){
      %>
          <font color=red>添加成功！</font><br/>
      <%  	
        }else if(info!=null && info.equals("no")){
            %>
            <font color=red>添加失败，用户名已填加！</font><br/>
        <% } 	
    %>
    <br>
    <form action="<%=basePath%>teamLeader/addTeacher" method="post" >
      
      <table border="1" >
        <tr>
          <td align="right" width="80px" height="30">工号：</td><td width="200px"><input type="number" name="userName" request="request"/></td>
        </tr>
        <tr>
          <td  align="right" height="30">姓名：</td><td><input type="text" name="trueName" request="request"/></td>
        </tr>
        <tr>
          <td  align="right" height="30">所在团队：</td><td><input type="text" name="team" value="<%=teamLeader.getManagerTeam() %>" readonly="readonly"/></td>
        </tr>
        <tr>
          <td  align="right" height="30">二级学院：</td><td><input type="text" name="team" value="<%=teamLeader.getDep() %>" readonly="readonly"/></td>
        </tr>
      </table>
      <br/>
      <input type="submit" value="提交" /> <input type="reset" value="取消" />
       　　</form>　    
     <br/>
     <font color='red' size='4'><a href="teamLeaderMain.jsp">返回团队负责人主页</a></font>
 </div>
 <%} %>
</body>
</html>