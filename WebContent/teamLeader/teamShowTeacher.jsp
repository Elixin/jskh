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
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/teamShowTeacher.css" />
    <%--<link type="text/css" rel="stylesheet" href="../css/teamShowTeacher.css">--%>
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
            %>
<div class="center" >
<br><br>
    <br><br>
    <h1><font color='black' ><%=teamLeader.getManagerTeam() %>负责人</font>:<font color='blue' ><%=teamLeader.getTrueName() %></font></h1><br/><br/>

    <h1><font color='black' ><%=teamLeader.getManagerTeam() %></font></h1>
    <h2>(按团队负责人打分降序排列)</h2><br>
    <%
        TeamLeaderDao teamLeaderDao = new TeamLeaderDaoImpl();
        List<Teacher> teachers =  teamLeaderDao.descOrederTeamScoreTeacher(teamLeader.getId());
        if(!teachers.isEmpty()){
    %>
    <table  border="1"  >
        <tr>
            <th width="50px" align="center" height="50">序号</th>
            <th width="200px" align="center">姓名</th>
            <th width="200px" align="center">团队负责人给分</th>
            <th width="200px" align="center">自评得分</th>
        </tr>
        <%
            List<Teacher1> teacherList=new ArrayList<>();
            List<Teacher1> teacherList1=new ArrayList<>();
            teacherList1.clear();
            Teacher teacher = null;
            for (int i=0;i<teachers.size();i++){
                teacherList.add(new Teacher1(teachers.get(i).getId(),teachers.get(i).getTrueName(),
                        teachers.get(i).getTeamScore(),teachers.get(i).getMyselftScore()));
                System.out.println(teacherList.get(i).getMyselftScore1());
                System.out.println();
            }
            teacherList1.addAll(Teacher1.sortCard(teacherList));
            for(int i=0 ; i< teacherList1.size() ; i++){
//        	    teacher=teachers.get(i);
        %>
        <tr>
            <td align="center" height="30"><%=i+1 %></td>
            <td align="center"><font color='red' size='5'><a href="teamLeaderToTeacher.jsp?id=<%=teacherList1.get(i).getId1()%>"><%=teacherList1.get(i).getTrueName1() %></a></font></td>
            <td align="center"><%=teacherList1.get(i).getTeamScore1() %></td>
            <td align="center"><%=teacherList1.get(i).getMyselftScore1() %></td>
        </tr>
        <%
            }
            teacherList.clear();
        %>
    </table>
    <%
            }
        }
    %>
    <br/><br/>
    <button><a href="teamLeaderMain.jsp">返回团队负责人主页</a></button>
</div>
</body>
</html>