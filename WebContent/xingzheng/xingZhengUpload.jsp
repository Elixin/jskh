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
<title>行政人员考核系统</title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/common.css" />
<style type="text/css">
<!--
-->
</style>

</head>

<body>
 <%
 XingZheng xingZheng = (XingZheng)session.getAttribute("xingZheng");
 int year = 2000; 
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
   out.println("<br/><font color='red' size='3'>被考评行政人员：" + xingZheng.getTrueName() + "</font>" );
   //out.println("<font color='red' size='3'>　　　登录时间：" + str_today + "</font>" );
   out.println(" 　　　<a href='../xingZhengExit'>退出登录</a>");
   out.println("　　　　　　");
   out.println(" <a href='xingzhengMain.jsp'>退回行政人员主页</a>");

            %>
       <%
       
         request.setCharacterEncoding("utf-8");
        String filename  = null; 
        XprizeUploadDao xprizeUploadDao = new XprizeUploadDaoImpl();
        List<XprizeUpload> xprizeUploads = xprizeUploadDao.queryAllByXid(xingZheng.getId());
         if(xprizeUploads!=null ){
        	// System.out.println(xprizeUploads.size());
         }
       
       %>
 <div align="center"   >
<br/><br/><br/>
 <h1>上传佐证材料</h1><br/>
<table border="1">
  
     
        <tr>  
           <th  colspan="3"　 width="６00" height="30"> 13	获得校级教学和科研成果</th>
        </tr>
         <tr>  
           <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==13){
               %>
            	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                <%  
            	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=13" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"  /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
        
         <tr>  
               <th  colspan="3"　 height="30"> 14	学校科研考核为优秀（90分）以上，加5分</th>
        </tr>
          <tr>  
             <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==14){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=14" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"   /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
        
        <tr>  
           <th  colspan="3"　 height="30"> 15	获得校级奖励</th>
        </tr>
          <tr>  
           <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==15){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=15" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"   /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
         
          <tr>  
           <th  colspan="3"　 height="30"> 16	参与并认真完成学校重大事项抽调工作加5分。</th>
        </tr>
          <tr>  
            <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==16){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=16" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"  /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
         
          <tr>  
           <th  colspan="3"　 height="30"> 17	教师开展社会服务项目资金到学校财务指定账户且结题，每5万加10分。</th>
        </tr>
          <tr>  
           <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==17){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=17" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"  /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
         
          <tr>  
           <th  colspan="3"　 height="30"> 18	申报并获批国家级教改和科研项目</th>
        </tr>
          <tr>  
           <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==18){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=18" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"  /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
         
          <tr>  
           <th  colspan="3"　 height="30"> 19	指导学生获得省部级奖</th>
        </tr>
          <tr>  
           <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==19){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=19" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"  /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
         
          <tr>  
           <th  colspan="3"　 height="30"> 20	担任课程主讲教师且完成各项任务</th>
        </tr>
          <tr>  
          <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==20){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=20" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"  /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
         
          <tr>  
           <th  colspan="3"　 height="30"> 21	公开出版教材</th>
        </tr>
          <tr>  
           <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==21){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=21" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"  /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
         
          <tr>  
           <th  colspan="3"　 height="30"> 22	发表教育教学改革中文核心论文</th>
        </tr>
          <tr>  
           <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==22){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=22" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"  /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
         
         
          <tr>  
           <th  colspan="3"　 height="30"> 23	教师每推荐一家企业与学校合作成功（签订合作协议）加5分</th>
        </tr>
          <tr>  
           <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==23){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=23" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"  /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
         
          <tr>  
           <th  colspan="3"　 height="30"> 24	以第一作者申请发明专利并授权加50分。</th>
        </tr>
          <tr>  
           <td  colspan="3"　 height="30"> 已经上传：<br>
           <%
            for(XprizeUpload xprizeUpload : xprizeUploads){
            	if(xprizeUpload.getxPrizeType()==24){
                    %>
                	<a href='<%=basePath %>/upload/<%=xprizeUpload.getxPrizePic()%>'><%=xprizeUpload.getxPrizePic()%></a>　
            	<a href="javascript:if(confirm('确认是否删除此项？')) location='xPrizeUploadDel?id=<%=xprizeUpload.getId()%>'"><img alt="del" src="<%=basePath %>/images/icon_error.gif" /></a>　　　　
            	<br>
                    <%  
                	}
            }
           %></td>
        </tr>
         <form action="xingZhengPrizeAddPic?id=<%=xingZheng.getId() %>&xPrizeType=24" method="post" enctype="multipart/form-data" >
         <tr>
            <td>上传图片：</td><td><input type="file" accept="application/pdf" name="file" size="80"  /></td><td><input type="submit" value="上传" /></td>
         </tr>
         </form>
     
</table>  
 	  
 </div>
 <%} %>
</body>
</html>