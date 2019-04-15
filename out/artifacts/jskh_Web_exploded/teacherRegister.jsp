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
<link type="text/css" rel="stylesheet" href="css/common.css" />
<style type="text/css">
<!--
-->
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
<div align="center"   >
<br/><br/><br/>
<h1>教师注册</h1><br/>
 <%
          request.setCharacterEncoding("utf-8");
          String info =request.getParameter("info");
          if(info!=null && info.equals("no") ){
            out.println("<br/><font color='red'>添加失败！用户名已使用！</font><br/>");
          }
          
          TeamDao teamDao = new TeamDaoImpl();
          List<Team> teams = teamDao.queryAllTeam();
          DepDao depDao = new DepDaoImpl();
          List<Dep> deps = depDao.queryAllDep();
          LevelDao levelDao = new LevelDaoImpl();
          List<Level> levels = levelDao.getAll();
          
         %>
         <br/><h4><font color="red">(用户名及工号，填加后不能再修改)</font></h4><br/>
         
   <form action="<%=basePath%>regTeacher" method="post" >
     <table border="1">
      <tr>
       <th align="right" height="30">用户名:<br/></th><td width="300px"><input type="number" name="userName"  size="40" required="required" placeholder="请输入您的工号。提交后不能修改。"/></td>
     </tr>
     <tr>
       <th align="right" height="30">真实姓名：</th><td><input type="text" name="trueName" size="40" required="required"/></td>
     </tr>
     <tr>
       <th align="right" height="30">新密码：</th><td><input type="password" name="password" size="40" id="password" required="required" /></td>
     </tr>
     <tr>
       <th align="right" height="30">再次输入密码：</th><td><input type="password" name="password2" size="40" id="password2"  /></td>
     </tr>
     <tr>
       <th align="right" height="30">职称：</th>
       <td><select name="level" >
         <%
          for(Level level : levels){
           %>
            <option value ="<%=level.getLevel()%>"><%=level.getLevel()%></option>
          <%} %>
         </select></td>
     </tr>
     <tr>
       <th align="right" height="30">所属团队：</th>
       <td><select name="team"   >
        <%
          for(Team team : teams){
        %>
            <option value ="<%=team.getTeamName()%>"><%=team.getTeamName()%></option>
     <%} %>
        </select>
       
       </td>
     </tr>
     <tr>
       <th align="right" height="30">所在二级学院：</th>
       <td>
       <select name="dep" >
        <%
          for(Dep dep : deps){
      %>
            <option value ="<%=dep.getDepName()%>"><%=dep.getDepName()%></option>
     <%} %>
        </select>
       </td>
     </tr>
     <tr>
       <th align="right" height="30">备注：</th><td><textarea rows="3" cols="33" name="note"></textarea></td>
     </tr>
    </table>
    <br/>
    <input type="submit" value="提交" onclick="return check()" >　　　　<input type="reset" value="取消" />
       　　</form>　    
        <br/><br/>
        
 </div>      
</body>
</html>