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
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/main.css" />
<style type="text/css">
<!--
-->
</style>
</head>
<body>
<%
    XingZheng xingZheng = (XingZheng)session.getAttribute("xingZheng");
    String year = "0000" ;
    if(xingZheng==null){
        response.sendRedirect("../index.jsp");
    }else{
        Date today=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String str_today=simpleDateFormat.format(today);
        year = str_today.substring(0,4);
        //out.println("<br/><font color='red' size='3'>考评教师：" + xingZheng.getTrueName() + "</font>" );
%>

<div align="center"   >
    <div class="center">
        <div class="photo" >
            <%
                if (xingZheng.getPic()==null){
                    out.print("");
                }else {
                    out.print("<img src=\""+basePath +"upload/"+xingZheng.getPic()+"\" width=\"100px\">");
                }

            %>
        </div>

        <h1>教师：<font color='red' ><%=xingZheng.getTrueName()%></font></h1>
        <button><a href="xingZhengMyself.jsp">开始自评</a></button>
        <button><a href="xingZhengUpload.jsp">上传资料</a></button>
        <button><a href="xingZhengSet.jsp">设置个人信息</a></button>
        <a class="leave" href='../teacherExit' >退出登录</a>　
        <div class="time" >登录时间：<%=str_today%></div>
    </div>
        <%} %>
</body>
</html>