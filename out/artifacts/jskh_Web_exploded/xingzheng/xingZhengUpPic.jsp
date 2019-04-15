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
</head>

<body>
 <%
     XingZheng xingZheng = (XingZheng)session.getAttribute("xingZheng");
     int year = 2000; ;
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
      out.println("<br/><font color='red' size='3'>被考评行政：" + xingZheng.getTrueName() + "</font>" );
   //out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
      out.println(" 　　　<a href='../xingZhengExit'>退出登录</a>");
      out.println("　　　　　　");
      out.println(" <a href='xingzhengMain.jsp'>退回行政人员主页</a>");
            %>

 <div align="center"   >
<br/><br/><br/>
<h1>上传个人标准照</h1><br/>
 <form action="xingZhengUpPic?id=<%=xingZheng.getId() %>" method="post" enctype="multipart/form-data" >
    <table border="1">
      <tr>
       <th>个人标准照:</th><td><img alt="个人标准照" src="<%=basePath %>upload/<%=xingZheng.getPic()%>" width="100px"></td>
     </tr>     
      <tr>
        <td>上传图片：</td><td><input type="file" accept="image/*" name="upfile" size="40" /><input type="submit" value="上传" /></td>
      </tr>
      </table>
   </form><br>
 <a href='xingzhengMain.jsp'>退回行政人员主页</a>
 </div>
 <%} %>
</body>
</html>