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
 
<div align="center"   >
<br/><br/><br/>

 <font color='red' size='3'>　自评成功！　</font><br/><br/><br/>

 <%  
    Date today=new Date();
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
    String str_today=simpleDateFormat.format(today);
    String year = str_today.substring(0,4);
    TeacherDao teacherDao = new TeacherDaoImpl();
     int id = Integer.parseInt(request.getParameter("id"));
    TKH tkh = teacherDao.queryTHK(id);
    JiaoShiXiangDao jsxDao = new JiaoShiXiangDaoImpl();
    List<JiaoShiXiang> jsxList = jsxDao.queryAllJiaoShiXiang();
%>
    <h1>信息工程学院专任教师工作量化考核表（<%=year %>年）</h1><br/><br/><br/>
    
    <table border="1" >
      <thead>
      
      </thead>
      <tr>
         <th width="10">考核项目</th><th >考核内容</th><th>分值</th><th>考核标准</th>
         <th>给分</th><th >加分</th><th>扣分</th><th >自评得分</th><th>备注<th>
      </tr>
      <%
      for(int i = 0 ; i < jsxList.size() ; i++) {
    	  JiaoShiXiang jsx = jsxList.get(i);
   	   %>
   	   <tr>
          <td ><%=jsx.getKhNo() %></td>
          <td><%=jsx.getKhName() %></td>
          <td><%=jsx.getKhValue() %></td>
          <td><%=jsx.getKhStandard() %></td>
          <td><%=jsx.getKhGetScorerStandard() %></td>
          <td><%=jsx.getKhAddScoreStandard()%> </td>
          <td><%=jsx.getKhSubScoreStandard() %></td>
          <td><%=tkh.getNoScore()[i][2] %></td>
          <td><%=tkh.getNoNote()[i][0] %></td>
          </tr>
          
		 <%
		  }
      %>
       <tr>
          <td colspan="7" align="center" >总分</td>
          <td colspan="2" align="center" >
             
              <font color='red' size='3'><%=tkh.getTotal_myself() %></font>
           </td>
       </tr>
    </table> 
 
 
 
</body>
</html>