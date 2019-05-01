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
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/set.css" />

    <script language="javascript">

        function check(){
            var pwd=document.getElementById("password").value;
            var pwd1=document.getElementById("password2").value;
            if(pwd1 != pwd){
                alert("两次密码不一样");
                document.getElementById('password').focus();
                return false;
            }
        }
        function retur() {
            self.location='teacherMain.jsp'
        }
    </script>
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
        TeamDao teamDao = new TeamDaoImpl();
        List<Team> teams = teamDao.queryAllTeam();
        DepDao depDao = new DepDaoImpl();
        List<Dep> deps = depDao.queryAllDep();
        LevelDao levelDao = new LevelDaoImpl();
        List<Level> levels = levelDao.getAll();
%>

<div class="bigbox">
    <form action="updateTeacher?id=<%=teacher.getId() %>" method="post"class="form-userInfo">
        <h1>教师注册信息</h1>
        <span class="text1">请在文本框中完善您的个人信息：</span>
        <div class="fillhead">
        </div>

        <label>
            <span>真实姓名</span>
            <input type="text" name="trueName" required="required"  value="<%=teacher.getTrueName()%>"/>
        </label>
        <label>
            <span>设置密码</span>
            <input type="text" name="password" id="password"  placeholder="请设置8位数以上的密码" />
        </label>
        <label>
            <span>再输一次</span>
            <input type="text" name="password2" id="password2"  placeholder="与上面输入密码相同" />
        </label>
        <label>
            <span>职务</span>
            <select class="zposition" name ="level">
                <option value="<%=teacher.getLevel()%>"><%=teacher.getLevel()%></option>
                        <%
                      for(Level level : levels){
                       %>
                        <option value ="<%=level.getLevel()%>"><%=level.getLevel()%></option>
                      <%} %>
            </select>
        </label>
        <label>
            <span>所属团队</span>
            <select class="team" name="team"  required="required" >
                <option value="<%=teacher.getTeam()%>"><%=teacher.getTeam()%></option>
                <%
                    for(Team team : teams){
                %>
                <option value ="<%=team.getTeamName()%>"><%=team.getTeamName()%></option>
                <%} %>
            </select>
        </label>
        <label>
            <span>所属二级学院</span>
            <select class="dep" name="dep" required="required" >
                <option value="<%=teacher.getDep()%>"><%=teacher.getDep() %> </option>
                <%
                    for(Dep dep : deps){
                %>
                <option value ="<%=dep.getDepName()%>"><%=dep.getDepName()%></option>
                <%} %>
            </select>
        </label>
        <label>
            <span>备注</span>
            <textarea rows="3" cols="33"  name="note" ><%= teacher.getNote()%></textarea>
        </label>
        <label>
            <input type="submit" class="button" value="提交" onclick="return check()">
        </label>
    </form>
</div>
<%} %>
</body>
</html>





