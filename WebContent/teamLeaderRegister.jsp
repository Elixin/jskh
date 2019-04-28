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
    <link type="text/css" rel="stylesheet" href="css/register.css" />
    <style type="text/css">

    </style>
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
    </script>
</head>

<body>
<div class="bigbox">
    <%

        TeamDao teamDao = new TeamDaoImpl();
        List<Team> teams = teamDao.queryAllTeam();
        DepDao depDao = new DepDaoImpl();
        List<Dep> deps = depDao.queryAllDep();
        LevelDao levelDao = new LevelDaoImpl();
        List<Level> levels = levelDao.getAll();
    %>
    <form action="<%=basePath%>regTeamLeader" method="post" class="form-userInfo">
        <h1>团队负责人注册信息</h1>
        <span class="text1">请在文本框中完善您的个人信息：</span>
        <span class="text2">(用户名及工号，填加后不能再修改)</span>
        <div class="fillhead">
        </div>
        <%
            request.setCharacterEncoding("utf-8");
            String info =request.getParameter("info");
            if(info!=null && info.equals("no") ){
                out.println("<label class=\"username \">\n" +
                        "            <span>用户名</span>\n" +
                        "            <input type=\"text\"  name=\"userName\" id=\"userName\" required=\"required\" placeholder=\"用户名已经使用\"/>\n" +
                        "        </label>");
            }else {
                out.println("<label>\n" +
                        "            <span>用户名</span>\n" +
                        "            <input type=\"text\"  name=\"userName\" id=\"userName\" required=\"required\" placeholder=\"请输入您的工号。提交后不能修改。\"/>\n" +
                        "        </label>");
            }
        %>
        <label>
            <span>真实姓名</span>
            <input type="text" name="trueName" required="required"  />
        </label>
        <label>
            <span>设置密码</span>
            <input type="text" name="password" id="password" required="required" placeholder="请设置8位数以上的密码" />
        </label>
        <label>
            <span>再输一次</span>
            <input type="text" name="password2" id="password2" required="required" placeholder="与上面输入密码相同" />
        </label>
        <label>
            <span>职称</span>
            <input type="text" name="level"  required="required" placeholder="软件与控制" />
        </label>
        <label>
            <span>管理团队</span>
            <select class="team" name="managerTeam"  >
                <%
                    for(Team team : teams){
                %>
                <option value ="<%=team.getTeamName()%>"><%=team.getTeamName()%></option>
                <%} %>
            </select>
        </label>
        <label>
            <span>团队类型</span>
            <select class="teamType" name="teamType"  >
                <option value ="教学">教学</option>
                <option value ="行政">行政</option>
            </select>
        </label>
        <label>
            <span>所属二级学院</span>
            <select class="dep" name="dep"  >
                <%
                    for(Dep dep : deps){
                %>
                <option value ="<%=dep.getDepName()%>"><%=dep.getDepName()%></option>
                <%} %>
            </select>
        </label>
        <label>
            <span>备注</span>
            <textarea rows="3" cols="33"    name="note"></textarea>
        </label>
        <label>
            <input type="submit" class="button" value="提交" onclick="return check()">
        </label>
    </form>
</div>
</body>
</html>