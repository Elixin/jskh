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
      XingZhengDao xingZhengDao = new XingZhengDaoImpl();
      System.out.println(id);
      XingZheng xingZheng = xingZhengDao.getXingZheng(id); 
      System.out.println(xingZheng.getId());
      out.println(" <a href='../teamLeaderExit'>退出登录</a>　　　　　　");
      out.println(" <a href='teamLeaderMain.jsp'>团队负责人主页</a>");
            %>
<div align="center"   >
<br/><br/><br/>

<%
    XKHDao  xkhDao = new XKHDaoImpl();
    System.out.println(xingZheng.getId());
    XKH xkh = xkhDao.getXKH(xingZheng.getId());
%>

 <h1>信息工程学院行政人员工作量化考核表（<%=year %>年）</h1><br/>
    <br/><br/>
    被考评教师姓名：<font color='red' size='3'><%=xingZheng.getTrueName() %></font>　　　　　　　　　　　　　　　　　　　　　　　　　
     　 日期：<font color='red' size='3'><%=str_today %> </font>　　　　
     <font color='red' size='5'><a href="xingzheng_team.jsp?id=<%=id%>">团队负责人打分</a></font>　　　　
     <font color='red' size='5'><a href="teamXingZheng.jsp">继续给团队其它人员打分</a></font>
    <table border="1" >
      <thead>
      
      </thead>
      <!--表头-->
      <tr>
        <th colspan="2">考核项</th>
        <th>基础分值</th>
        <th colspan="2">等　 级　说　明</th>
        <th  width="50px" align="center">自评得分</th>
        <th  width="150px" align="center">自评备注</th>
        <th  width="50px" align="center">团队打分</th>
        <th  width="150px" align="center">团队打分备注</th>
      </tr>
      <!--考核项一-->
      <tr>
        <td rowspan="3" width="30px" align="center">一</td>
        <td rowspan="3" width="50px" align="center">履行岗位职责情况</td> 
        <td rowspan="3" width="50px" align="center">30分</td>
        <td colspan="2" align="left"><B>说明：能按领导要求的时间节点完成工作任务，职责履行到位，工作质量高，效率高，没有发生任何差错或事故。出现下列情况作扣分处理：</B></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
       <tr>
        <td width="30px" align="center">1</td>
        <td>接受工作任务，但未按时完成，一再拖延或推诿。一次扣5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center" ><font color='red' size='3'><%=xkh.getKhx()[0][0] %></font></td>
        <td align="left"><%=xkh.getKhxNote()[0][0] %></td>
        <td align="center" ><font color='red' size='3'><%=xkh.getKhx()[0][1] %></font></td>
        <td align="left"><%=xkh.getKhxNote()[0][1] %></td>
         <%}else {%>
        <td align="center" ><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center" ><font color='red' size='3'></font></td>
        <td align="left"></td>    
         <%} %>
      </tr>
      <tr>
        <td width="30px" align="center">2</td>
        <td>不服从领导指令，严重影响工作进度或工作发生重大差错重大事故，一次扣10分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[1][0] %></font></td>
        <td align="left"><%=xkh.getKhxNote()[1][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[1][1] %></font></td>
        <td align="left"><%=xkh.getKhxNote()[1][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>   
         <%} %>
      </tr>
      <!--考核项二-->
       <tr>
        <td rowspan="4" width="30px" align="center">二</td>
        <td rowspan="4" width="50px" align="center">考勤情况</td> 
        <td rowspan="4" width="50px" align="center">20分</td>
        <td colspan="2"><B>说明：本学期全勤为满分，请假手续以有分管领导签字的纸质请假条为准。出现下列情况作扣分处理：</B></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
       <tr>
        <td width="30px" align="center">3</td>
        <td>因私向领导口头请假但未完成纸质请假手续一次扣2分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[2][0] %></font></td>
        <td align="left"><%=xkh.getKhxNote()[2][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[2][1] %></font></td>
        <td align="left"><%=xkh.getKhxNote()[2][1] %></td>
         <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
      <tr>
        <td width="30px" align="center">4</td>
        <td>完成手续的情况下，因私请假三天及以上（请假天数参照学校年度考核要求）扣5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[3][0] %></font></td>
        <td align="left"><%=xkh.getKhxNote()[3][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[3][1] %></font></td>
        <td align="left"><%=xkh.getKhxNote()[3][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
      <tr>
        <td width="30px" align="center">5</td>
        <td>无故迟到早退一次扣5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[4][0] %></font></td>
        <td align="left"><%=xkh.getKhxNote()[4][0] %></td>
         <td align="center"><font color='red' size='3'><%=xkh.getKhx()[4][1] %></font></td>
        <td align="left"><%=xkh.getKhxNote()[4][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <!--考核项三-->
      <tr>
        <td rowspan="3" width="30px" align="center">三</td>
        <td rowspan="3" width="50px" align="center">职业道德</td> 
        <td rowspan="3" width="50px" align="center">30分</td>
        <td colspan="2" align="left"><B>说明：对自已要求严格，能自觉地遵守国家法规和学校的规章制度，工作态度好。出现下列情况作扣分处理：</B></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
       <tr>
        <td width="30px" align="center">6</td>
        <td>工作懈怠，不能严格要求自己，上班时间玩网游、看电影、网购一次扣5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[5][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[5][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[5][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[5][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
      <tr>
        <td width="30px" align="center">7</td>
        <td>被服务对象投诉的；自由散漫，打架、吵架，情节严重，造成严重后果者一次扣5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[6][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[6][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[6][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[6][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <!--考核项四-->
      <tr>
        <td rowspan="3" width="30px" align="center">四</td>
        <td rowspan="3" width="50px" align="center">组织参加活动</td> 
        <td rowspan="3" width="50px" align="center">20分</td>
        <td colspan="2" align="left"><B>说明：积极组织并参加学校及学院活动、会议、值班，无缺席。出现下列情况作扣分处理：</B></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
       <tr>
        <td width="30px" align="center">8</td>
        <td>活动中，不认真和不按要求完成任务现象，迟到、早退一次扣5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[7][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[7][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[7][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[7][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %> 
      </tr>
      <tr>
        <td width="30px" align="center">9</td>
        <td>活动中，不能认真完成任务，并造成严重影响一次扣10分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[8][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[8][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[8][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[8][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <!--考核项五-->
      <tr>
        <td rowspan="1" width="30px" align="center">五</td>
        <td rowspan="1" width="50px" align="center">教学任务</td> 
        <td rowspan="1" width="50px" align="center">5分</td>
        <td rowspan="1" width="50px" align="center">10</td>
        <td>每学期完成系数前40学时教学任务得5分，不足40学时扣5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[9][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[9][0] %></td>
         <td align="center"><font color='red' size='3'><%=xkh.getKhx()[9][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[9][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %> 
      </tr>
       <!--考核项六-->
      <tr>
        <td rowspan="14" width="30px" align="center">六</td>
        <td rowspan="14" width="50px" align="center">加分项目</td> 
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">11</td>
        <td>认真完成本职工作的基础上，接受领导安排的其他工作任务，每完成一项加5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[10][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[10][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[10][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[10][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">12</td>
        <td>有创新的工作思路和方法经应用后有明显成效加5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[11][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[11][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[11][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[11][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
      <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">13</td>
        <td>获得校级教学和科研成果一等奖、二等奖、三等奖分别加20分、15分、10分，如由多人完成，按照学校教学科研制度比例进行分配；
        获得省部级教学和科研成果奖励一等奖、二等奖、三等奖分别加100、70、50分，如由多人完成，按照学校教学科研制度比例进行分配；
        获国家级教学和科研成果一等奖、二等奖、  三等奖分别加500分、300分、100分，如由多人完成，按照学校教学科研制度比例进行分配；
        获得行业协会（学会）奖励的按低一级对待。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[12][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[12][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[12][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[12][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
      <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">14</td>
        <td>学校科研考核为优秀（90分）以上，加5分</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[13][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[13][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[13][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[13][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">15</td>
        <td>获得校级奖励一等奖加3分，获得二等奖加2，获得三等奖加1分；获得校级优秀共产党员、优秀教师等无等次区分的加2分。
        获得市级奖励一等奖加10分，获得二等奖加7，获得三等奖加5分；获得市级优秀共产党员、教学名师等无等次区分的加8分；
        获得行业协会（学会）奖励的按低一级对待。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[14][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[14][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[14][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[14][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">16</td>
        <td>参与并认真完成学校重大事项抽调工作加5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[15][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[15][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[15][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[15][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">17</td>
        <td>教师开展社会服务项目资金到学校财务指定账户且结题，每5万加10分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[16][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[16][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[16][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[16][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">18</td>
        <td>申报并获批国家级教改和科研项目，重大加100分，重点70分，一般60分；教师申报并获批省部级教改和科研课题，重大项目55分，
        重点40分，一般30分； 教师申报并获批校级教改和科研课题重点10分，一般5分；项目如由多人完成，按照学校教学科研制度比例进行分配；
        所有项目在立项当年兑现20%分值，项目结题兑现剩余部分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[17][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[17][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[17][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[17][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">19</td>
        <td>指导学生获得省部级一等奖、二等奖、三等奖分别加30分、20分、10分，如由多人指导，按照学校教学科研制度比例进行分配，获得优秀指导教师的另加5分；
        指导学生获得国家级一等奖、二等奖、三等奖分别加80分、70分、40分，如由多人指导，按照学校教学科研制度比例进行分配，获得优秀指导教师的另加10分；
        获得行业协会（学会）奖励的按低一级对待。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[18][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[18][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[18][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[18][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">20</td>
        <td>担任课程主讲教师且完成各项任务，评价为优秀的每门课程加5分，评价为良好的每门课程加3分，评价为合格的每门课程加1分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[19][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[19][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[19][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[19][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">21</td>
        <td>公开出版教材每本加50分，如由多人完成，按照学校教学科研制度比例进行分配。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[20][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[20][0] %></td>
         <td align="center"><font color='red' size='3'><%=xkh.getKhx()[20][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[20][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">22</td>
        <td>发表教育教学改革中文核心论文加10分；发表自然科学、社会科学中文核心论文加9分；教师发表SCI一区论文加50分，SCI二区加40分，
        SCI 三区加30分，SCI 四去加20分，SCI国际会议加10分；教师发表EI期刊论文加 18分，EI国际会议加8分。所有期刊只奖励第1作者。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[21][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[21][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[21][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[21][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">23</td>
        <td>教师每推荐一家企业与学校合作成功（签订合作协议）加5分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[22][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[22][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[22][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[22][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <tr>
        <td rowspan="1" width="50px" align="center"></td>
        <td width="30px" align="center">24</td>
        <td>以第一作者申请发明专利并授权加50分。</td>
         <% if(xkh !=null ){ %>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[23][0] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[23][0] %></td>
        <td align="center"><font color='red' size='3'><%=xkh.getKhx()[23][1] %></font></td>
        <td align="center"><%=xkh.getKhxNote()[23][1] %></td>
        <%}else {%>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td>
        <td align="center"><font color='red' size='3'></font></td>
        <td align="left"></td> 
         <%} %>
      </tr>
       <!--总分-->
      <tr>
        <% if(xkh !=null ){ %>
        <td  colspan="2"  align="center" height="40px">自评总分</td>
        <td colspan="2" align="center"><font color='red' size='3'><%=xkh.getTotal_myself() %>分</font> </td> 
        <td  colspan="2"  align="center" height="40px">团队负责人打分</td>
        <td colspan="3" align="center"><font color='red' size='3'><%=xkh.getTotal_team() %>分</font> </td> 
        <%}else {%>
        <td  colspan="2"  align="center" height="40px">自评总分</td>
        <td colspan="2" align="center"><font color='red' size='3'>分</font> </td> 
        <td  colspan="2"  align="center" height="40px">团队负责人打分</td>
        <td colspan="3" align="center"><font color='red' size='3'>分</font> </td>
         <%} %>
      </tr>
    </table> 
    
 </div>
 <%} %>      
</body>
</html>