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

<body onload="add()">
 <%
     TeamLeader teamLeader = (TeamLeader)session.getAttribute("teamLeader");
     int year = 2000;
    if(teamLeader==null){
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
       request.setCharacterEncoding("utf-8");
       int id = Integer.parseInt(request.getParameter("id"));
            TeacherDao teacherDao = new TeacherDaoImpl();
            Teacher teacher = teacherDao.getTeacherById(id);
            out.println(" <a href='../teamLeaderExit'>退出登录</a> ||　　　　　　");
            out.println(" <a href='teamLeaderMain.jsp'>团队负责人主页</a>");
            %>
<div align="center"   >
<br/><br/><br/>

<%
   JiaoShiXiangDao jsxDao = new JiaoShiXiangDaoImpl();
   List<JiaoShiXiang> jsxList = jsxDao.queryAllJiaoShiXiang();
   TKH tkh = teacherDao.queryTHK(id);
%>



<h1>信息工程学院专任教师工作量化考核表（<input type="text" name="year" value="<%=year%>" size="8"/>年）</h1><br>
<font color='red' size='4'><a href="teamLeaderToTeacher.jsp?id=<%=id%>">重新评价</a></font>　｜　
<font color='red' size='4'><a href="teamTeacherUpload.jsp?id=<%=id%>">查看获奖材料</a></font>　｜　
<font color='red' size='4'><a href="teamTeacher.jsp">评价下一个</a></font>　｜　
<font color='red' size='4'><a href="teamLeaderMain.jsp">返回主页</a></font>
       <table border="1" >
           <thead align="left">
             <h1><font color='red' size='3'><%=teacher.getTrueName() %>　/　<%=teacher.getTeam() %></font></h1>
           </thead>
           <tr>
              <th width="50px">考核项目</th>
              <th width="150px">考核内容</th>
              <th width="50px">分值</th>
              <th width="250px">考核标准</th>
              <th width="250px">给分</th>
              <th width="250px">加分</th>
              <th width="250px">扣分</th>
              <th width="50px">自评得分</th>
              <th width="100px">自评备注</th>
              <th width="50px">团队负责人给分</th>
              <th width="100px">团队负责人备注</th>
           </tr>
            <%
              for(int i = 0 ; i < jsxList.size() ; i++) {
         	      JiaoShiXiang jsx = jsxList.get(i);
        	   %>
        	  <tr>
               <td align="center"><%=jsx.getKhNo() %></td>
               <td align="center"><%=jsx.getKhName() %></td>
               <td align="center"><%=jsx.getKhValue() %></td>
               <td><%=jsx.getKhStandard() %></td>
               <td><%=jsx.getKhGetScorerStandard() %></td>
               <td><%=jsx.getKhAddScoreStandard()%> </td>
               <td><%=jsx.getKhSubScoreStandard() %></td>
              <% if(tkh !=null ){ %>
                <td align="center"><%=tkh.getNoScore()[i][2] %></td>
                <td><%=tkh.getNoNote()[i][0] %></td>
                <td align="center"><%=tkh.getNoScore()[i][3] %></td>
                <td><%=tkh.getNoNote()[i][1] %> </td>
              </tr>
              <%}else {%>
                 <td align="center">0</td>
                 <td> </td>
                 <td align="center">0</td>
                 <td> </td>
                </tr>
              <%} 
         
             }
           %>
   		
            <tr>
               <td colspan="5" align="center" >自评总分：<%=tkh.getTotal_myself() %></td>
               <td colspan="4" align="center" >团队负责人评价总分</td>
                <td colspan="2" align="center" >   
                   <font color='red' size='3' ><%=tkh.getTotal_leader()%></font>
                  
                </td>
            </tr>
         </table>
   
    
 </div>   
 <%} %>  
</body>
</html>