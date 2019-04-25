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
<%--    <script type="application/javascript">--%>
<%--        function image(target) {--%>
<%--            var name=target.value;--%>
<%--            var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();--%>
<%--            if(fileName !="jpg" && fileName !="jpeg" && fileName !="png" && fileName !="gif"){--%>
<%--                alert("请选择图片格式文件上传(jpg,png,gif,gif等)！");--%>
<%--                target.value="";--%>
<%--                return false;   //阻止submit提交--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>
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
             year = str_today.substring(0,4);
            out.println("<br/><font color='red' size='3'>被考评教师：" + teacher.getTrueName() + "</font>" );
            out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
            out.println(" <a href='../teacherExit'>退出登录</a>");
          
            %>

 <div align="center"   >
 <h1>上传个人标准照</h1><br/>
<br/><br/><br/>
 <form action="teacherUpPic?id=<%=teacher.getId() %>" method="post" enctype="multipart/form-data" >
    <table border="1">
      <tr>
       <th>个人标准照:</th><td><img alt="个人标准照" src="<%=basePath %>upload/<%=teacher.getPic()%>" width="100px"></td>
     </tr>     
      <tr>
        <td>上传图片：</td><td><input type="file" accept="image/*" name="upfile" size="40" onchange="image(this)" /><input type="submit" value="上传"  /></td>
      </tr>
      </table>
   </form><br>
  <a href="teacherMain.jsp">返回教师主页</a>
 </div>
 <%} %>
</body>
</html>