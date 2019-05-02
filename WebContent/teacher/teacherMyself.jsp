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
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/Myself.css" />
<style type="text/css">
<!--
-->
</style>
<script type="text/javascript">
   
window.onload=function (){

    var totalScore=0;
}
     function add(){
    	 var scores = document.getElementsByName("teacherMyself");
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

function disone() {

    var one = document.getElementById("one");
    var two = document.getElementById("two");
    var three = document.getElementById("three");

    var ones = document.getElementById("ones");
    var twos = document.getElementById("twos");
    var threes = document.getElementById("threes");
    one.style.display="initial";
    two.style.display="none";
    three.style.display="none";

    ones.style.background="#ffa500";
    twos.style.background="#fff";
    threes.style.background="#fff";
}
function distwo() {


    var one = document.getElementById("one");
    var two = document.getElementById("two");
    var three = document.getElementById("three");



    one.style.display="none";
    two.style.display="initial";
    three.style.display="none";

    var ones = document.getElementById("ones");
    var twos = document.getElementById("twos");
    var threes = document.getElementById("threes");

    ones.style.background="#fff";
    twos.style.background="#ffa500";
    threes.style.background="#fff";


}
function disthree() {
    var one = document.getElementById("one");
    var two = document.getElementById("two");
    var three = document.getElementById("three");

    one.style.display="none";
    two.style.display="none";
    three.style.display="initial";

    var ones = document.getElementById("ones");
    var twos = document.getElementById("twos");
    var threes = document.getElementById("threes");

    ones.style.background="#fff";
    twos.style.background="#fff";
    threes.style.background="#ffa500";
}

</script>
</head>

<body>
 <%
          Teacher teacher = (Teacher)session.getAttribute("teacher");
           int year = 2000; ;
          if(teacher==null){
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
            %>


<%
   JiaoShiXiangDao jsxDao = new JiaoShiXiangDaoImpl();
   List<JiaoShiXiang> jsxList = jsxDao.queryAllJiaoShiXiang();
   
   TeacherDao teacherDao = new TeacherDaoImpl();
   
   //int id = teacherDao.queryTid(teacher.getId());
   
   TKH tkh = teacherDao.queryTHK(teacher.getId());
   
%>
 <a class="leave" href='../teacherExit'>退出登录</a>

 <a class="leaveimp" href='teacherMain.jsp'>退回教师主页</a>
 <div align="center">

     <h1><%=teacher.getDep()%>专任教师工作量化考核表（<%=year%>年）</h1>
     <br/> 　被考评教师：
     <font color='red' size='3'><%=teacher.getTrueName()%></font>　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 　 日期：
     <font color='red' size='3'><%=str_today%></font>
     <font color='red' size='5'>
         <a class="zp" href="teacher_myself.jsp">开始自评</a>
     </font>
     <table class="one" id="one" border="1">
         <tr>
             <th width="50px">考核项目</th>
             <th width="200px">考核内容</th>
             <th width="50px">分值</th>
             <th width="250px">考核标准</th>
             <th width="250px">给分</th>
             <th width="250px">加分</th>
             <th width="250px">扣分</th>
             <th width="50px">自评得分</th>
             <th width="100px">自评备注</th>
         </tr>
             <%
                for(int i = 0 ; i < jsxList.size()/3; i++) {
    	            JiaoShiXiang jsx = jsxList.get(i);
             %>
         <tr>
             <td align="center" height="50"><%=jsx.getKhNo() %></td>
             <td align="center"><%=jsx.getKhName() %></td>
             <td align="center"><%=jsx.getKhValue() %></td>
             <td align="left"><%=jsx.getKhStandard() %></td>
             <td align="left"><%=jsx.getKhGetScorerStandard() %></td>
             <td align="left"><%=jsx.getKhAddScoreStandard()%> </td>
             <td align="left"><%=jsx.getKhSubScoreStandard() %></td>
            <% if(tkh !=null ){ %>
                <td align="center"><%=tkh.getNoScore()[i][2] %></td>
                <td align="left"><%=tkh.getNoNote()[i][0] %></td>
            <%}else {%>
                <td></td>
                <td></td>
         </tr>
            <%}%>
         <%}%>
     </table>
     <table class="two" id="two" border="1">
         <tr>
             <th width="50px">考核项目</th>
             <th width="200px">考核内容</th>
             <th width="50px">分值</th>
             <th width="250px">考核标准</th>
             <th width="250px">给分</th>
             <th width="250px">加分</th>
             <th width="250px">扣分</th>
             <th width="50px">自评得分</th>
             <th width="100px">自评备注</th>
         </tr>
         </tr>
         <%
             for(int i = jsxList.size()/3 ; i < jsxList.size()/3+jsxList.size()/3; i++) {
                 JiaoShiXiang jsx = jsxList.get(i);
         %>
         <tr>
             <td align="center" height="50"><%=jsx.getKhNo() %></td>
             <td align="center"><%=jsx.getKhName() %></td>
             <td align="center"><%=jsx.getKhValue() %></td>
             <td align="left"><%=jsx.getKhStandard() %></td>
             <td align="left"><%=jsx.getKhGetScorerStandard() %></td>
             <td align="left"><%=jsx.getKhAddScoreStandard()%> </td>
             <td align="left"><%=jsx.getKhSubScoreStandard() %></td>
             <% if(tkh !=null ){ %>
             <td align="center"><%=tkh.getNoScore()[i][2] %></td>
             <td align="left"><%=tkh.getNoNote()[i][0] %></td>
             <%}else {%>
             <td></td>
             <td></td>
         </tr>
         <%}%>

                 <%}%>
     </table>
     <table class="three" id="three" border="1">
         <tr>
             <th width="50px">考核项目</th>
             <th width="200px">考核内容</th>
             <th width="50px">分值</th>
             <th width="250px">考核标准</th>
             <th width="250px">给分</th>
             <th width="250px">加分</th>
             <th width="250px">扣分</th>
             <th width="50px">自评得分</th>
             <th width="100px">自评备注</th>
         </tr>
         <%
             for(int i = jsxList.size()/3*2 ; i < jsxList.size(); i++) {
                 JiaoShiXiang jsx = jsxList.get(i);
         %>
         <tr>
             <td align="center" height="50"><%=jsx.getKhNo() %></td>
             <td align="center"><%=jsx.getKhName() %></td>
             <td align="center"><%=jsx.getKhValue() %></td>
             <td align="left"><%=jsx.getKhStandard() %></td>
             <td align="left"><%=jsx.getKhGetScorerStandard() %></td>
             <td align="left"><%=jsx.getKhAddScoreStandard()%> </td>
             <td align="left"><%=jsx.getKhSubScoreStandard() %></td>

             <% if(tkh !=null ){ %>
             <td align="center"><%=tkh.getNoScore()[i][2] %></td>
             <td align="left"><%=tkh.getNoNote()[i][0] %></td>
             <%}else {%>
             <td></td>
             <td></td>
         </tr>
         <%}%>
         <%}%>
         <tr>
             <td colspan="7" align="center" height="50">总分</td>
             <td colspan="2" align="center" >

                 <font color='red' size='3'>
                     <%
                         if(tkh==null){
                             out.print(0);
                         }else
                         {
                             out.print(tkh.getTotal_myself());
                         }
                     %>
                 </font>
             </td>
         </tr>
     </table>
     <div class="page">
         <a href="#" onclick="disone()" id="ones">1</a>
         <a href="#" onclick="distwo()" id="twos">2</a>
         <a href="#" onclick="disthree()" id="threes">3</a>

     </div>
 </div>

 <%} %>
</body>
</html>