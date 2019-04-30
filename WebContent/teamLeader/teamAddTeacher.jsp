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
<%--    <script language="JavaScript" type="text/javascript">--%>
<%--        function display(Jt,New) {--%>
<%--               var jt = document.getElementById(Jt);--%>
<%--               var newteacher = document.getElementById(New);--%>
<%--               if (jt.style.display=="none"){--%>
<%--                   jt.style.display="";--%>
<%--                   newteacher.style.display="";--%>
<%--               }--%>
<%--        }--%>
<%--    </script>--%>

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
//            out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
//            out.println("　　｜　　 <a href='../teamLeaderExit'>退出登录</a>　　｜　　");

            %>



 <div class="center"></div>
 <a href='../teamLeaderExit' class="system">退出系统</a>
 <a href='teamLeaderMain.jsp' class="leave">团队负责人主页</a>

 <div class="important">
     <span><%=teamLeader.getPosition()%></span>
     <div class="name"><%=teamLeader.getTrueName()%>	</div>
     <button class="return1" onclick="display('pic','New')" >为团队添加新成员</button>
     <button class="return">返回团队负责人主页</button>
     <div class="time">登陆时间：2019/4/5</div>
 </div>
 <img src="<%=basePath%>/images/jt.png" class="jt" id="pic"/>

 <form action="<%=basePath%>teamLeader/addXingZheng" method="post">
     <div class="Newteacher" id="New">
         <label class="a">
             <span>工号</span>
             <input type="text"  name="name" placeholder="工号提交后不能修改。"/>
         </label>
         <label class="b">
             <span>用户名</span>
             <input type="text"  name="name" placeholder="工号提交后不能修改。"/>
         </label>
         <label>
             <span>所属团队</span>
             <select class="team" name="team"  >
                 <%
//                    for ()
                 %>
             </select>
         </label>
         <br />
         <label>
             <span>所属二级学院</span>
             <select class="dep" name="dep"  >
             </select>
         </label>
         <button class="b1">提交</button>
         <button class="b2">取消</button>
     </div>
 </form>

 <%} %>
</body>
</html>