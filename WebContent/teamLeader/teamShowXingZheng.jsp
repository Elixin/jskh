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
        List<XingZheng> xingZhengs =  teamLeaderDao.descOrederTeamScoreXingZheng(teamLeader.getId());
        if(!xingZhengs.isEmpty()){
    %>
    <table  border="1"  >
        <tr>
            <th width="50px" align="center" height="50">序号</th>
            <th width="200px" align="center">姓名</th>
            <th width="200px" align="center">团队负责人给分</th>
            <th width="200px" align="center">自评得分</th>
        </tr>
        <%
            XingZheng xingZheng = new XingZheng();
            for(int i=0 ; i< xingZhengs.size() ; i++){
                xingZheng = xingZhengs.get(i);
        %>
        <tr>
            <td align="center" height="30"><%=i+1 %></td>
            <td align="center"><font color='red' size='5'><a href="teamLeaderToXingZheng.jsp?id=<%=xingZheng.getId()%>"><%=xingZheng.getTrueName() %></a></font></td>
            <td align="center"><%=xingZheng.getTeamScore() %></td>
            <td align="center"><%=xingZheng.getMyselftScore() %></td>
        </tr>
        <%
            }
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