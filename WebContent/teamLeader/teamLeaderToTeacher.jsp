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
<script type="text/javascript">
   
window.onload=function (){

    var totalScore=0;
}
     function add(){
    	 var scores = document.getElementsByName("teacherTeamLeader");
    	 //alert(scores.length);
    	 var totalScore=0;
    	 for(var i=0;i<scores.length;i++){
    	        var s=scores[i];
    	        //alert(Number(s.value));
    	        totalScore += Number(s.value);
    	    }
    	//alert(totalScore);
    	var ts=document.getElementById("totalScore"); 
    	ts.innerHTML = totalScore;
    	
     }

</script>
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
            %>
<div align="center"   >
<br/><br/><br/>

<%
   JiaoShiXiangDao jsxDao = new JiaoShiXiangDaoImpl();
   List<JiaoShiXiang> jsxList = jsxDao.queryAllJiaoShiXiang();
   TKH tkh = teacherDao.queryTHK(id);
%>

<form action="<%=basePath%>teamLeader/teamLeaderToteacherKh" method="post" name="tkhbForm" >

<h1>信息工程学院专任教师工作量化考核表（<input type="text" name="year" value="<%=year%>" size="8"/>年）</h1>
    
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
               <td ><%=jsx.getKhNo() %></td>
               <td align="center"><%=jsx.getKhName() %></td>
               <td align="center"><%=jsx.getKhValue() %></td>
               <td><%=jsx.getKhStandard() %></td>
               <td><%=jsx.getKhGetScorerStandard() %></td>
               <td><%=jsx.getKhAddScoreStandard()%> </td>
               <td><%=jsx.getKhSubScoreStandard() %></td>
              <% if(tkh !=null ){ %>
                <td align="center"><%=tkh.getNoScore()[i][2] %></td>
                <td><%=tkh.getNoNote()[i][0] %></td>
                <td><input type="number" id="teacherTeamLeader" name="teacherTeamLeader"  min="0" size="10" onblur="add()" value="<%=tkh.getNoScore()[i][3] %>" /></td>
                <td><textarea rows="5" cols="10" name="teamLeaderNote" ><%=tkh.getNoNote()[i][1] %> </textarea></td>
              </tr>
              <%}else {%>
                 <td align="center">0</td>
                 <td> </td>
                 <td><input type="number" id="teacherTeamLeader" name="teacherTeamLeader"  min="0" size="10" onblur="add()" value="0" /></td>
                <td><textarea rows="5" cols="10" name="teamLeaderNote" ></textarea></td>
                </tr>
              <%} 
         
             }
           %>
   		
            <tr>
               <% if(tkh !=null ){ %>
               <td colspan="5" align="center" >自评总分：<%=tkh.getTotal_myself() %></td>
               <%}else {%>
               <td colspan="5" align="center" >自评总分：0分</td>
               <%} %>
               <td colspan="4" align="center" >团队负责人评价总分</td>
                <td colspan="2" align="center" >   
                   <font color='red' size='3' id="totalScore"></font>
                  
                </td>
            </tr>
         </table>
           <input type="hidden" name="id"  value="<%=teacher.getId() %>" />
         	<p><input type="submit" value="提交" />　　　<input type="reset" value="取消" />
        </form>
 </div>   
 <%} %>  
</body>
</html>