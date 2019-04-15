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
 <%
     XingZheng xingZheng = (XingZheng)session.getAttribute("xingZheng");
    int year = 2000; 
    if(xingZheng==null){
        response.sendRedirect("../index.jsp");
    }else{
       Date today=new Date();
       SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
       String str_today=simpleDateFormat.format(today);
       int month = Integer.parseInt(str_today.substring(6,7));
     if(month < 9){
        year = Integer.parseInt(str_today.substring(0,4)) -1;
     }else{
  	     year = Integer.parseInt(str_today.substring(0,4));
      }
      out.println("<br/><font color='red' size='3'>被考评行政人员：" + xingZheng.getTrueName() + "</font>" );
   //out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
     out.println(" 　　　<a href='../xingZhengExit'>退出登录</a>");
      out.println("　　　　　　");
      out.println(" <a href='xingzhengMain.jsp'>退回行政人员主页</a>");

            TeamDao teamDao = new TeamDaoImpl();
            List<Team> teams = teamDao.queryAllTeam();
            DepDao depDao = new DepDaoImpl();
            List<Dep> deps = depDao.queryAllDep();
            LevelDao levelDao = new LevelDaoImpl();
            List<Level> levels = levelDao.getAll();
            %>

 <div align="center"   >
<br/><br/><br/>
<h1>完善个人信息</h1><br/>
 <form action="updateXingZheng?id=<%=xingZheng.getId() %>" method="post">
　　　<table border="1">
      <tr>
       <th align="right" height="30">用户名:<br/></th><td><input type="text" name="username" value="<%=xingZheng.getUsername()%>" readonly="readonly" /></td>
     </tr>
     <tr>
       <th align="right" height="30">真实姓名：</th><td><input type="text" name="trueName" value="<%=xingZheng.getTrueName()%>" required="required"/></td>
     </tr>
     <tr>
       <th align="right" height="30">新密码：</th><td><input type="password" name="password" id="password" /></td>
     </tr>
     <tr>
       <th align="right" height="30">再次输入密码：</th><td><input type="password" name="password2" id="password2"  /></td>
     </tr>
     <tr>
       <th align="right" height="30">职称：</th>
       <td><select name="level" required="required" >
            <option value="<%=xingZheng.getLevel()%>" style="color: #c2c2c2;"><%=xingZheng.getLevel()%></option>
            <%
          for(Level level : levels){
           %>
            <option value ="<%=level.getLevel()%>"><%=level.getLevel()%></option>
          <%} %>
         </select></td>
     </tr>
     <tr>
       <th align="right" height="30">所属部门：</th>
       <td><select name="team"  required="required">
        <option value="<%=xingZheng.getTeam()%>" style="color: #c2c2c2;"><%=xingZheng.getTeam()%></option>
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
       <select name="dep" required="required" >
        <option value="<%=xingZheng.getDep()%>" style="color: #c2c2c2;"><%=xingZheng.getDep() %> </option>
        <%
          for(Dep dep : deps){
      %>
            <option value ="<%=dep.getDepName()%>"><%=dep.getDepName()%></option>
     <%} %>
        </select>
       </td>
     </tr>
     <tr>
       <th align="right" height="30" >备注：</th><td><textarea rows="3" cols="33" name="note" ><%=xingZheng.getNote()%></textarea></td>
     </tr>
    </table>
    <br><br>
    <input type="submit" value="提交" onclick="return check()" >　　　　<input type="reset" value="取消" />
 </form>
 </div>
 <%} %>
</body>
</html>