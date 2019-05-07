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
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/teacherUpPic.css" />
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
//        out.println("<br/><font color='red' size='3'>被考评行政：" + xingZheng.getTrueName() + "</font>" );
        //out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
//        out.println(" 　　　<a href='../xingZhengExit'>退出登录</a>");
//        out.println("　　　　　　");
//        out.println(" <a href='xingzhengMain.jsp'>退回行政人员主页</a>");
%>
<div class="center">
    <br />
    <h1>上传个人标准照</h1>
    <form action="xingZhengUpPic?id=<%=xingZheng.getId() %>" method="post" enctype="multipart/form-data" >
        <h2>被评行政教师：<font><%=xingZheng.getTrueName()%></font></h2>
        <div class="photo">
            <h3>个人标准照:</h3>
            <img src="<%=basePath %>upload/<%=xingZheng.getPic()%>" width="100px"/>
        </div>
        <div class="sc">
            <h3>上传图片：</h3>
            <input type="file" accept="image/*" name="upfile" size="40" onchange="image(this)" />
            <input type="submit" value="上传" class="scb" />
        </div>

        <div class="time">登陆时间：<%=str_today%></div>

        <button class="button"><a href="xingzhengMain.jsp">返回行政人员主页</a></button>
        <button class="button"><a href='../teacherExit' >退出登录</a></button>


    </form>
</div>
<%} %>

<%

    String Error1=(String) request.getAttribute("message3");
//    System.out.println(Error1);
    try {
        if(Error1.equals("图片上传成功！")){
            out.print("<script type='text/javascript'> alert('"+Error1+"'); </script>");
            session.removeAttribute("message3");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>