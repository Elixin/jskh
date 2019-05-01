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
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/teamaddteacher.css" />
<%--    <link type="text/css" rel="stylesheet" href="../css/teamAddTeacher.css"/>--%>


    <script type="text/javascript">
        function dis() {
            var jt = document.getElementById('Jt');
            var newteacher = document.getElementById('Newteacher');

            if (jt.style.display=="inline"){
                jt.style.display="none";
                newteacher.style.display="none"
            } else {
                jt.style.display="inline";
                newteacher.style.display="inline"

            }

        }
    </script>
</head>

<body>
 <%
          TeamLeader teamLeader = (TeamLeader)session.getAttribute("teamLeader");
          String year = "0000" ;
          if(teamLeader==null){
            response.sendRedirect("../index.jsp");
          }%>
<body >
<div class="center"></div>
<div class="system"><a href='../teamLeaderExit'>退出登录</a></div>
<div class="leave"><a href="teamLeaderMain.jsp">团队负责人主页</a></div>
<div class="important">
    <span><%=teamLeader.getPosition()%></span>
    <div class="name"><%=teamLeader.getTrueName() %></div>
    <button class="return1" onclick="dis()">为团队添加新成员</button>
    <button class="return"><a href="teamLeaderMain.jsp">返回团队负责人主页</a></button>
    <div class="time">登陆时间：<%Date today=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String str_today=simpleDateFormat.format(today);%><%=str_today%></div>
</div>
<img src="../images/jt.png" class="jt" id="Jt"/>
<div class="Newteacher" id="Newteacher">
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


    <label >
        <span>工号</span>
        <input type="number" name="userName" request="request"/>
    </label>
    <label >
        <span>用户名</span>
        <input type="text" name="trueName" request="request"/>
    </label>
    <label >
        <span>所属团队</span>
        <input type="text" name="team" value="<%=teamLeader.getManagerTeam() %>" readonly="readonly"/>
    </label>
    <br />
    <label >
        <span>所属二级学院</span>
            <input   type="text" name="team" value="<%=teamLeader.getDep()%>" readonly="readonly"/>
    </label>
    <input type="submit" value="提交" class="b1"/>
    <input type="reset" value="取消" class="b2"/>
    </form>
</div>
</body>
</html>