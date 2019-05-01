<%@ page language="java" import="java.util.Date,java.text.SimpleDateFormat" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.lw.jskh.entity.*,com.lw.jskh.dao.*,com.lw.jskh.dao.impl.*"%>
 <%
    String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
     Teacher teacher = (Teacher)session.getAttribute("teacher");
 %>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 "/>
<title>教师考核系统</title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/upload.css" />

    <script type="text/javascript">

        function no() {
            var one = document.getElementById("upknow");
            one.style.display="inline-block"
            var id = event.srcElement.id;
            switch (id) {
                case 'a':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=13";
                    break;
                case 'b':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=14";
                    break;
                case 'c':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=15";
                    break;
                case 'd':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=16";
                    break;
                case 'e':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=17";
                    break;
                case 'f':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=18";
                    break;
                case 'g':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=19";
                    break;
                case 'h':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=20";
                    break;
                case 'i':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=21";
                    break;
                case 'j':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=22";
                    break;
                case 'k':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=23";
                    break;
                case 'l':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=24";
                    break;
                case 'm':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=25";
                    break;
                case 'n':
                    document.getElementById("up").action = "teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=26";
                    break;

            }

        }

        function dis() {
            var one = document.getElementById("upknow");
            if (one.style.display=="inline-block"){
                one.style.display="none";
            }
        }
    </script>

</head>

<body>
 <%

 int year = 2000; 
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
       
         request.setCharacterEncoding("utf-8");
        String filename  = null; 
        TprizeUploadDao tprizeUploadDao = new TprizeUploadDaoImpl();
        List<TprizeUpload> tprizeUploads = tprizeUploadDao.queryAllByTid(teacher.getId());
         if(tprizeUploads!=null ){
        	// System.out.println(tprizeUploads.size());
         }
       
       %>
     <div class="center">
         <br />
         <h1>上传佐证材料</h1>
         <h2>被评教师：<font><%=teacher.getTrueName()%></font></h2>
         <div class="know">
             <div class="a" onclick="no()" id="a">十三、教师获奖</div>
             <div class="a" onclick="no()" id="b">十四、教学与科研成果奖</div>
             <div class="a" onclick="no()" id="c">十五、教师论文发表</div>
             <div class="b" onclick="no()" id="d">十六、指导学生参加技能大赛、创新创业大赛</div>
             <div class="a" onclick="no()" id="e">十七、教师社会服务</div>
             <div class="a" onclick="no()" id="f">十八、教改与科研项目</div>
             <div class="a" onclick="no()" id="g">十九、科研考核</div>
             <div class="b" onclick="no()" id="h">二十、完成学校规定科研考核情况</div>
             <div class="a" onclick="no()" id="i">二十一、支教半年</div>
             <div class="a" onclick="no()" id="j">二十二、课程主讲教师</div>
             <div class="a" onclick="no()" id="k">二十三、校企合作</div>
             <div class="a" onclick="no()" id="l">二十四、专项工作</div>
             <div class="a" onclick="no()" id="m">二十五、专利</div>
             <div class="a" onclick="no()" id="n">二十六、公开出版教材</div>
         </div>
         <input type="button" class="button" src="../teacherExit" value="退出登录">
         <input type="button" class="button" src="teacherMain.jsp" value="退回教师主页">
         <div class="upknow" id="upknow">
             <form action="teacherPrizeAddPic?id=<%=teacher.getId()%>&tPrizeType=13" method="post" enctype="multipart/form-data" id="up">
                 <br />
                 <input class="scwj" type="file"  name="file" size="100" required="required" />
                 <br />
                 <br />
                 <input class="sc" type="submit" value="上传" onclick="dis()" />
                 </tr>
             </form>
         </div>

     </div>
 	  
 </div>
 <%} %>
</body>
</html>