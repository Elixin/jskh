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
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/pic.css" />
<style type="text/css">
<!--
-->
</style>
    <script type="text/javascript">
        function succeed() {
            alert("上传成功");
        }
    </script>
</head>

<body>
 <%
          Teacher teacher = (Teacher)session.getAttribute("teacher");
          System.out.println(teacher.getUsername());
          String year = "0000" ;
          if(teacher==null){
            response.sendRedirect("../index.jsp");
          }else{
             Date today=new Date();
             SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
             String str_today=simpleDateFormat.format(today);
//             year = str_today.substring(0,4);
            %>

     <div class="center">
         <form action="teacherUpPic?id=<%=teacher.getId() %>" method="post" enctype="multipart/form-data">
             <br />
             <h1>上传个人标准照</h1>
             <h2>被评教师：<font><%=teacher.getTrueName()%></font></h2>
             <div class="photo">
                 <h3>个人标准照:</h3>
                 <img alt="个人标准照" src="<%=basePath %>upload/<%=teacher.getPic()%>" width="200px">
             </div>
             <div class="sc">
                 <h3>上传图片：</h3>
                 <input type="file" accept="image/*" name="upfile" size="40" /><input class="scb" type="submit" value="上传" onclick="succeed()" />
             </div>
             <div class="time">登录时间：<%= str_today%></div>
             <a class="button" href="<%=path%>/teacherExit">退出登录</a>
             <a class="button" href="teacherMain.jsp">退回教师主页</a>
         </form>
     </div>
 <%} %>

</body>
</html>