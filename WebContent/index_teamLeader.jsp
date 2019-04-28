<%@ page language="java" import="java.util.Date,java.text.SimpleDateFormat" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8" />
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background:url(images/timg.jpg);
            background-repeat: no-repeat;
        }

        #wrap {
            /*height: 719px;*/
            /*width: 100px;*/
            /*background-image: url(4.jpg);*/
            /*background-repeat: no-repeat;*/
            /*background-position: center center;*/
            /*position: relative;*/
        }

        #head {
            height: 120px;
            width: 100px;
            background-color: #66CCCC;
            text-align: center;
            position: relative;
        }


        .logGet {
            height: 508px;
            width: 400px;
            background-color: #FFFFFF;
            position: relative;
            top: 20%;
            margin: 0px auto;
            border-radius: 10px;
            opacity: 0;
            animation: myone 1s linear forwards;
        }

        .login{
            width: 100%;
            height: 45px;
            background-color: #ee7700;
            border: none;
            color: white;
            font-size: 18px;
        }

        .p1 {
            display: inline-block;
            font-size: 28px;
            margin-top: 30px;
            width: 86%;

        }

        .logDtip {
            height: 80px;
            width: 86%;
            border-bottom: 1px solid #ee7700;
            margin-bottom: 60px;
            margin-top: 2px;
            margin-right: auto;
            margin-left: auto;
        }


        .lgD input {
            width: 100%;
            height: 42px;
            text-indent: 2.5rem;
        }

        .lgD {
            width: 86%;
            position: relative;
            margin-bottom: 30px;
            margin-top: 30px;
            margin-right: auto;
            margin-left: auto;
        }

        .logC {
            width: 86%;
            margin-top: 0px;
            margin-right: auto;
            margin-bottom: 0px;
            margin-left: auto;
        }

        .zc{
            text-decoration: none;
            display: inline-block;
            color: grey;
            font-size: 25px;
            margin-top: 60px;
            margin-left: 36%;


        }
        @keyframes myone{
            from{
                opacity: 0;
            }
            to{
                opacity: 1;
            }
        }
    </style>
</head>

<body>

<div class="wrap" id="wrap">
    <div class="logGet">
        <div class="logD logDtip">
            <p class="p1">团队负责人登录</p>
            <%
                request.setCharacterEncoding("utf-8");
                String info =request.getParameter("info");
                if(info!=null && info.equals("fail") ){
                    out.println("<br/><font color='red'>用户名或密码不正确！</font>");
                }
                if(info!=null && info.equals("open") ){
                    out.println("<br/><font color='red'>没有开放登录权限！</font>");
                }
            %>
        </div>
        <form action="<%=basePath%>teamleaderLogin" method="post">
        <div class="lgD">
            <input type="text" placeholder="输入用户名" id="username" name="username" required/>
        </div>
        <div class="lgD">
            <input type="password" placeholder="输入用户密码" id="password" name="password" required/>
        </div>
        <div class="logC">
            <input type="submit" value="登录" class="login">
        </div>
        </form>
    </div>
</div>

</body>

</html>