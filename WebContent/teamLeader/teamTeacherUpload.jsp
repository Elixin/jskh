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
   int id = Integer.parseInt(request.getParameter("id"));
   TeacherDao teacherDao = new TeacherDaoImpl();
   Teacher teacher = teacherDao.getTeacherById(id);
   out.println("<br/><font color='red' size='3'>被考评教师：" + teacher.getTrueName() + "</font>" );
   //out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
   out.println(" 　　　<a href='../teamLeaderExit'>退出登录</a>");
   out.println("　　　　　　");
   out.println(" <a href='teamLeaderMain.jsp'>团 队负责人主页</a>");

            %>
       <%
       
         request.setCharacterEncoding("utf-8");
        String filename  = null; 
        TprizeUploadDao tprizeUploadDao = new TprizeUploadDaoImpl();
        List<TprizeUpload> tprizeUploads = tprizeUploadDao.queryAllByTid(teacher.getId());
         if(tprizeUploads!=null ){
        	// System.out.println(tprizeUploads.size());
         }
       
       %>
 <div align="center"   >
<br/><br/><br/>
 
<table border="1">
  
     
        <tr>  
           <th  colspan="3" width="600" height="30"> 十三、教师获奖</th>
        </tr>
         <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==13){
               %>
            	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	<br>
                <%  
            	}
            }
           %></td>
        </tr>
        <tr>  
               <th  colspan="3"  height="30"> 十四、教学与科研成果奖</th>
        </tr>
          <tr>  
             <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==14){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	   	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
        <tr>  
           <th  colspan="3"  height="30"> 十五、教师论文发表</th>
        </tr>
          <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==15){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	  	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
           <tr>  
           <th  colspan="3"  height="30"> 十六、指导学生参加技能大赛、创新创业大赛</th>
        </tr>
          <tr>  
            <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==16){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
        <tr>  
           <th  colspan="3"  height="30"> 十七、教师社会服务</th>
        </tr>
          <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==17){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
        <tr>  
           <th  colspan="3"  height="30"> 十八、教改与科研项目</th>
        </tr>
          <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==18){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
        <tr>  
           <th  colspan="3"  height="30"> 十九、科研考核</th>
        </tr>
          <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==19){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <tr>  
           <th  colspan="3"  height="30"> 二十、完成学校规定科研考核情况</th>
        </tr>
          <tr>  
          <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==20){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
          <tr>  
           <th  colspan="3"  height="30"> 二十一、支教半年</th>
        </tr>
          <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==21){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
        <tr>  
           <th  colspan="3"  height="30"> 二十二、课程主讲教师</th>
        </tr>
          <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==22){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
        <tr>  
           <th  colspan="3"  height="30"> 二十三、校企合作</th>
        </tr>
          <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==23){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
       <tr>  
           <th  colspan="3"  height="30"> 二十四、专项工作</th>
        </tr>
          <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==24){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <tr>  
           <th  colspan="3"  height="30"> 二十五、专利</th>
        </tr>
          <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==25){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
        <tr>  
           <th  colspan="3"  height="30"> 二十六、公开出版教材</th>
        </tr>
          <tr>  
           <td  colspan="3"  height="30"> 已经上传：<br>
           <%
            for(TprizeUpload tprizeUpload : tprizeUploads){
            	if(tprizeUpload.gettPrizeType()==26){
                    %>
                	<a href='<%=basePath %>/upload/<%=tprizeUpload.gettPrizePic()%>'><%=tprizeUpload.gettPrizePic()%></a>　　　
                  	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
  </table>  
 	  
 </div>
 <%} %>
</body>
</html>