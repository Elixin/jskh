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
    <script language="JavaScript" type="text/javascript">
        function display(Jt,New) {
               var jt = document.getElementById(Jt);
               var newteacher = document.getElementById(New);
               if (jt.style.display=="none"){
                   jt.style.display="";
                   newteacher.style.display="";
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
          }else{
             Date today=new Date();
             SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
             String str_today=simpleDateFormat.format(today);
             year = str_today.substring(0,4);
            out.println("<br/><font color='red' size='3'>考评教师：" + teamLeader.getTrueName() + "</font>" );
            out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
            out.println("　　｜　　 <a href='../teamLeaderExit'>退出登录</a>　　｜　　");

            %>



 <%--<div class="center"></div>--%>
 <%--<a href='../teamLeaderExit' class="system">退出系统</a>--%>
 <%--<a href='teamLeaderMain.jsp' class="leave">团队负责人主页</a>--%>

 <%--<div class="important">--%>
     <%--<span><%=teamLeader.getPosition()%></span>--%>
     <%--<div class="name"><%=teamLeader.getTrueName()%>	</div>--%>
     <%--<button class="return1" onclick="display('pic','New')" >为团队添加新成员</button>--%>
     <%--<button class="return">返回团队负责人主页</button>--%>
     <%--<div class="time">登陆时间：2019/4/5</div>--%>
 <%--</div>--%>
 <%--<img src="<%=basePath%>/images/jt.png" class="jt" id="pic"/>--%>

 <%--<div class="Newteacher" id="New">--%>
     <%--<label class="a">--%>
         <%--<span>工号</span>--%>
         <%--<input type="text"  name="name" placeholder="工号提交后不能修改。"/>--%>
     <%--</label>--%>
     <%--<label class="b">--%>
         <%--<span>用户名</span>--%>
         <%--<input type="text"  name="name" placeholder="工号提交后不能修改。"/>--%>
     <%--</label>--%>
     <%--<label>--%>
         <%--<span>所属团队</span>--%>
         <%--<select class="team" name="team"  >--%>
             <%--<option value ="软件与控制">软件与控制</option>--%>
             <%--<option value ="网络安全">网络安全</option>--%>
             <%--<option value ="应用">应用</option>--%>
             <%--<option value ="移动通信">移动通信</option>--%>
             <%--<option value ="学院办公室">学院办公室</option>--%>
             <%--<option value ="教务科">教务科</option>--%>
             <%--<option value ="学生科">学生科</option>--%>
             <%--<option value ="实训科">实训科</option>--%>
         <%--</select>--%>
     <%--</label>--%>
     <%--<br />--%>
     <%--<label>--%>
         <%--<span>所属二级学院</span>--%>
         <%--<select class="dep" name="dep"  >--%>
             <%--<option value ="信息工程学院">信息工程学院</option>--%>
             <%--<option value ="财经与贸易学院">财经与贸易学院</option>--%>
             <%--<option value ="机械工程学院">机械工程学院</option>--%>
             <%--<option value ="基础部">基础部</option>--%>
             <%--<option value ="地测学院">地测学院</option>--%>
             <%--<option value ="电气工程学院">电气工程学院</option>--%>
             <%--<option value ="继续教育学院">继续教育学院</option>--%>
             <%--<option value ="矿业与环境学院">矿业与环境学院</option>--%>
             <%--<option value ="艺术与设计学院">艺术与设计学院</option>--%>
         <%--</select>--%>
     <%--</label>--%>
     <%--<button class="b1">提交</button>--%>
     <%--<button class="b2">取消</button>--%>
 <%--</div>--%>




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