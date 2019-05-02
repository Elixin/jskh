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
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/myself.css" />
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
    var four = document.getElementById("four");

    var ones = document.getElementById("ones");
    var twos = document.getElementById("twos");
    var threes = document.getElementById("threes");
    var fours = document.getElementById("fours");
    one.style.display="initial";
    two.style.display="none";
    three.style.display="none";
    four.style.display="none";

    ones.style.background="#ffa500";
    twos.style.background="#fff";
    threes.style.background="#fff";
    fours.style.background="#fff";
}
function distwo() {


    var one = document.getElementById("one");
    var two = document.getElementById("two");
    var three = document.getElementById("three");
    var four = document.getElementById("four");



    one.style.display="none";
    two.style.display="initial";
    three.style.display="none";
    four.style.display="none";

    var ones = document.getElementById("ones");
    var twos = document.getElementById("twos");
    var threes = document.getElementById("threes");
    var fours = document.getElementById("fours");

    ones.style.background="#fff";
    twos.style.background="#ffa500";
    threes.style.background="#fff";
    fours.style.background="#fff";


}
function disthree() {
    var one = document.getElementById("one");
    var two = document.getElementById("two");
    var three = document.getElementById("three");
    var four = document.getElementById("four");

    one.style.display="none";
    two.style.display="none";
    three.style.display="initial";
    four.style.display="none";

    var ones = document.getElementById("ones");
    var twos = document.getElementById("twos");
    var threes = document.getElementById("threes");
    var fours = document.getElementById("fours");

    ones.style.background="#fff";
    twos.style.background="#fff";
    threes.style.background="#ffa500";
    fours.style.background="#fff";

}
function disfour() {
    var one = document.getElementById("one");
    var two = document.getElementById("two");
    var three = document.getElementById("three");
    var four = document.getElementById("four");

    one.style.display="none";
    two.style.display="none";
    three.style.display="none";
    four.style.display="initial";

    var ones = document.getElementById("ones");
    var twos = document.getElementById("twos");
    var threes = document.getElementById("threes");
    var fours = document.getElementById("fours");

    ones.style.background="#fff";
    twos.style.background="#fff";
    threes.style.background="#fff";
    fours.style.background="#ffa500";
}

</script>
</head>

<body onload="add()">
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
//      out.println("<br/><font color='red' size='3'>被考评教师：" + teacher.getTrueName() + "</font>" );
//   //out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
//      out.println(" 　　　<a href='../teacherExit'>退出登录</a>");
//      out.println("　　　　　　");
//      out.println(" <a href='teacherMain.jsp'>退回教师主页</a>");
          
            %>
<%
   JiaoShiXiangDao jsxDao = new JiaoShiXiangDaoImpl();
   List<JiaoShiXiang> jsxList = jsxDao.queryAllJiaoShiXiang();
   TeacherDao teacherDao = new TeacherDaoImpl();
   TKH tkh = teacherDao.queryTHK(teacher.getId());
%>

 <a class="leave" href='../teacherExit'>退出登录</a>

 <a class="leaveimp" href='teacherMain.jsp'>退回教师主页</a>
 <div align="center">

     <form action="<%=basePath%>teacher/teacherKh" method="post" name="tkhbForm">

         <h1><%=teacher.getDep()%>专任教师工作量化考核表（<input type="text" name="year" value="<%=year%>" size="8"/>年）</h1><br/> 　被考评教师：
         <font color='red' size='3'><%=teacher.getTrueName()%></font>　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 　 日期：
         <font color='red' size='3'><%=str_today%></font>
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
                for(int i = 0 ; i < jsxList.size()/4; i++) {
                    JiaoShiXiang jsx = jsxList.get(i);
             %>
             <tr>
                 <td align="center" height="30"><%=jsx.getKhNo() %></td>
                 <td align="center"><%=jsx.getKhName() %></td>
                 <td align="center"><%=jsx.getKhValue() %></td>
                 <td align="left"><%=jsx.getKhStandard() %></td>
                 <td align="left"><%=jsx.getKhGetScorerStandard() %></td>
                 <td align="left"><%=jsx.getKhAddScoreStandard()%> </td>
                 <td align="left"><%=jsx.getKhSubScoreStandard() %></td>
                 <% if(tkh !=null ){ %>
                 <td align="center" >
                     <input type="number" id="teacherMyself" name="teacherMyself"  min="0" size="5" onblur="add()" value="<%=tkh.getNoScore()[i][2] %>" /></td>
                 <td align="left"><textarea rows="5" cols="10" name="teacherNote" ><%=tkh.getNoNote()[i][0] %> </textarea></td>
             </tr>
                 <%}else {%>
             <td><input type="number" value="0" id="teacherMyself" name="teacherMyself"  min="0" size="10" onblur="add()" /></td>
             <td><textarea rows="5" cols="10" name="teacherNote" ></textarea></td>
             </tr>
                 <%}
                 }%>

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

             <%
                 for(int i = jsxList.size()/4 ; i < (jsxList.size()/4)*2; i++) {
                     JiaoShiXiang jsx = jsxList.get(i);
             %>
             <tr>
                 <td align="center" height="30"><%=jsx.getKhNo() %></td>
                 <td align="center"><%=jsx.getKhName() %></td>
                 <td align="center"><%=jsx.getKhValue() %></td>
                 <td align="left"><%=jsx.getKhStandard() %></td>
                 <td align="left"><%=jsx.getKhGetScorerStandard() %></td>
                 <td align="left"><%=jsx.getKhAddScoreStandard()%> </td>
                 <td align="left"><%=jsx.getKhSubScoreStandard() %></td>
                 <% if(tkh !=null ){ %>
                 <td align="center" >
                     <input type="number" id="teacherMyself" name="teacherMyself"  min="0" size="5" onblur="add()" value="<%=tkh.getNoScore()[i][2] %>" /></td>
                 <td align="left"><textarea rows="5" cols="10" name="teacherNote" ><%=tkh.getNoNote()[i][0] %> </textarea></td>
             </tr>
             <%}else {%>
             <td><input type="number" value="0" id="teacherMyself" name="teacherMyself"  min="0" size="10" onblur="add()" /></td>
             <td><textarea rows="5" cols="10" name="teacherNote" ></textarea></td>
             </tr>
             <%}
             }%>
         </table>
         <table class="three" id="three" border="1" >
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
                 for(int i = (jsxList.size()/4)*2 ; i < (jsxList.size()/4)*3; i++) {
                     JiaoShiXiang jsx = jsxList.get(i);
             %>
             <tr>
                 <td align="center" height="30"><%=jsx.getKhNo() %></td>
                 <td align="center"><%=jsx.getKhName() %></td>
                 <td align="center"><%=jsx.getKhValue() %></td>
                 <td align="left"><%=jsx.getKhStandard() %></td>
                 <td align="left"><%=jsx.getKhGetScorerStandard() %></td>
                 <td align="left"><%=jsx.getKhAddScoreStandard()%> </td>
                 <td align="left"><%=jsx.getKhSubScoreStandard() %></td>
                 <% if(tkh !=null ){ %>
                 <td align="center" >
                     <input type="number" id="teacherMyself" name="teacherMyself"  min="0" size="5" onblur="add()" value="<%=tkh.getNoScore()[i][2] %>" /></td>
                 <td align="left"><textarea rows="5" cols="10" name="teacherNote" ><%=tkh.getNoNote()[i][0] %> </textarea></td>
             </tr>
             <%}else {%>
             <td><input type="number" value="0" id="teacherMyself" name="teacherMyself"  min="0" size="10" onblur="add()" /></td>
             <td><textarea rows="5" cols="10" name="teacherNote" ></textarea></td>
             </tr>
             <%}
             }%>
         </table>
         <div class="four" id="four"  >
             <table  border="1" >
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
                     for(int i = (jsxList.size()/4)*3 ; i < jsxList.size(); i++) {
                         JiaoShiXiang jsx = jsxList.get(i);
                 %>
                 <tr>
                     <td align="center" height="30"><%=jsx.getKhNo() %></td>
                     <td align="center"><%=jsx.getKhName() %></td>
                     <td align="center"><%=jsx.getKhValue() %></td>
                     <td align="left"><%=jsx.getKhStandard() %></td>
                     <td align="left"><%=jsx.getKhGetScorerStandard() %></td>
                     <td align="left"><%=jsx.getKhAddScoreStandard()%> </td>
                     <td align="left"><%=jsx.getKhSubScoreStandard() %></td>
                     <% if(tkh !=null ){ %>
                     <td align="center" >
                         <input type="number" id="teacherMyself" name="teacherMyself"  min="0" size="5" onblur="add()" value="<%=tkh.getNoScore()[i][2] %>" /></td>
                     <td align="left"><textarea rows="5" cols="10" name="teacherNote" ><%=tkh.getNoNote()[i][0] %> </textarea></td>
                 </tr>
                 <%}else {%>
                 <td><input type="number" value="0" id="teacherMyself" name="teacherMyself"  min="0" size="10" onblur="add()" /></td>
                 <td><textarea rows="5" cols="10" name="teacherNote" ></textarea></td>
                 </tr>
                 <%}
                 }%>

                 <tr>
                     <td colspan="7" align="center" height="50">总分</td>
                     <td colspan="2" align="center">

                         <font color='red' size='3' id="totalScore"></font>

                     </td>
                 </tr>
             </table>
             <input type="hidden" name="id" value="22" />
             <p><input class="tj" type="submit" value="提交" />　　　<input class="qx" type="reset" value="取消" />
         </div>
     </form>
     <div class="page">
         <a href="#" onclick="disone()" id="ones">1</a>
         <a href="#" onclick="distwo()" id="twos">2</a>
         <a href="#" onclick="disthree()" id="threes">3</a>
         <a href="#" onclick="disfour()" id="fours">4</a>
     </div>
 </div>


 <%} %>     
</body>
</html>



<%--<form action="<%=basePath%>teacher/teacherKh" method="post" name="tkhbForm" >--%>

<%--    <h1>信息工程学院专任教师工作量化考核表（<input type="text" name="year" value="<%=year%>" size="8"/>年）</h1><br/>--%>
<%--    　被考评教师：<font color='red' size='3'><%=teacher.getTrueName() %></font>　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　--%>
<%--    　 日期：<font color='red' size='3'><%=str_today %> </font>--%>
<%--    <table border="1" >--%>
<%--        <tr>--%>
<%--            <th width="50px">考核项目</th>--%>
<%--            <th width="200px">考核内容</th>--%>
<%--            <th width="50px">分值</th>--%>
<%--            <th width="250px">考核标准</th>--%>
<%--            <th width="250px">给分</th>--%>
<%--            <th width="250px">加分</th>--%>
<%--            <th width="250px">扣分</th>--%>
<%--            <th width="50px">自评得分</th>--%>
<%--            <th width="100px">自评备注</th>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--            for(int i = 0 ; i < jsxList.size() ; i++) {--%>
<%--                JiaoShiXiang jsx = jsxList.get(i);--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td align="center" height="30"><%=jsx.getKhNo() %></td>--%>
<%--            <td align="center"><%=jsx.getKhName() %></td>--%>
<%--            <td align="center"><%=jsx.getKhValue() %></td>--%>
<%--            <td align="left"><%=jsx.getKhStandard() %></td>--%>
<%--            <td align="left"><%=jsx.getKhGetScorerStandard() %></td>--%>
<%--            <td align="left"><%=jsx.getKhAddScoreStandard()%> </td>--%>
<%--            <td align="left"><%=jsx.getKhSubScoreStandard() %></td>--%>
<%--            <% if(tkh !=null ){ %>--%>
<%--            <td align="center" ><input type="number" id="teacherMyself" name="teacherMyself"  min="0" size="5" onblur="add()" value="<%=tkh.getNoScore()[i][2] %>" /></td>--%>
<%--            <td align="left"><textarea rows="5" cols="10" name="teacherNote" ><%=tkh.getNoNote()[i][0] %> </textarea></td>--%>
<%--        </tr>--%>
<%--        <%}else {%>--%>
<%--        <td><input type="number" value="0" id="teacherMyself" name="teacherMyself"  min="0" size="10" onblur="add()" /></td>--%>
<%--        <td><textarea rows="5" cols="10" name="teacherNote" ></textarea></td>--%>
<%--        </tr>--%>
<%--        <%}--%>

<%--        }--%>
<%--        %>--%>

<%--        <tr>--%>
<%--            <td colspan="7" align="center"  height="50" >总分</td>--%>
<%--            <td colspan="2" align="center" >--%>

<%--                <font color='red' size='3' id="totalScore"></font>--%>

<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--    <input type="hidden" name="id"  value="<%=teacher.getId() %>" />--%>
<%--    <p><input type="submit" value="提交" />　　　<input type="reset" value="取消" />--%>
<%--</form>--%>