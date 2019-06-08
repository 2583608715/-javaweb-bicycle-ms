<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <%@ page import="com.zyl.bicycle.bean.*" %>
        <%@ page import="com.zyl.bicycle.dao.*" %>
            <%@ page import="com.zyl.bicycle.domain.*" %>

                <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
                <%
   String chaoji=(String)session.getAttribute("chaoji");
   String putongF=(String)session.getAttribute("putong");
   if(chaoji==null&&putongF==null)
   {
     request.setAttribute("msg", "对不起，只有管理员才可以\\n使用此项功能，请登陆！");
%>
                    <jsp:forward page="adminlogin.jsp" />
                    <%   }
    PageBean pb=new PageBean();
    Integer xypage=(Integer)request.getAttribute("bikepage"); 
    if(xypage!=null){
    pb.setCurrentpage(xypage);
    }
    BikeDao bd=new BikeDao();
    List<Bike> list=bd.listOfPage(pb.getCurrentpage());
    int totalpage=pb.bikePage();
    %>
                        <html>

                        <head>
                            <title></title>
                            <link rel="stylesheet" href="css/bootstrap3.css">
                            <link rel="stylesheet" href="css/main.css">
                            <script language="javascript">
                                function checkdd(tmf, taction) {
                                    var bikeprice = document.getElementById('bikeprice').value;
                                    var bikeyajin = document.getElementById('bikeyajin').value;
                                    var bikecount = document.getElementById('bikecount').value;
                                    var bikeurl = document.getElementById('bikeurl').value;
                                    var zzs = /^\d+(\.\d+)?$/;
                                    var zzsgamount = /^[0-9]+$/;
                                    if (bikeprice == "" || !zzs.test(bikeprice)) {
                                        alert("自行车租金不能为空！！");
                                        return;
                                    }
                                    if (!zzs.test(bikeprice)) {
                                        alert("自行车租金格式不对！！");
                                        return;
                                    }

                                    if (bikeyajin == "") {
                                        alert("自行车押金不能为空！！");
                                        return;
                                    }
                                    if (!zzs.test(bikeyajin)) {
                                        alert("自行车押金格式不对！！");
                                        return;
                                    }
                                    if (bikecount == "") {
                                        alert("自行车数量不能为空");
                                        return;
                                    }
                                    if (!zzsgamount.test(bikecount)) {
                                        alert("自行车数量格式不对");
                                    }
                                    if (bikeurl == "") {
                                        alert("请给出图片URL！");
                                        return;
                                    }

                                    taction.value = "updatebike";
                                    tmf.submit();
                                }

                                function delSubmit(tmf, taction) {
                                    taction.value = "deletebike";
                                    tmf.submit();
                                }
                            </script>
                        </head>

                        <body>
                            <br><br>
                            <table class="table">
                                <tr>
                                    <th>自行车ID</th>
                                    <th>自行车名称</th>
                                    <th>所属服务站</th>
                                    <th>租金</th>
                                    <th>押金</th>
                                    <th>数量</th>
                                    <th ">Url链接</th>
				    <th>修改</th>
				    <th>删除</th>     
                  </tr>
<% int i=0;
for(Bike b : list){
  i++;
  Servicer s=b.getServicer();%>
 
	<form action="BikeServlet " method="post " name="mf " id="mf<%=i%>">
                                        <input id="action<%=i%>" type="hidden" name="action" value="upadatebike" />
                                        <input type="hidden" name="bikeid" value="<%= b.getId()%>" />
                                        <input name="bikename" type="hidden" value="<%=b.getName()%>">
                                        <input type="hidden" name="servicer" value="<%=s.getName() %>">
                                        <tr>
                                            <td>
                                                <%=b.getId()%>
                                            </td>
                                            <td>
                                                <%=b.getName() %>
                                            </td>
                                            <td>
                                                <%=s.getName() %>
                                            </td>
                                            <td><input type="text" class="form-control" name="bikeprice" id="bikeprice" value="<%=b.getPrice() %>" size="8" /></td>
                                            <td><input type="text" class="form-control" name="bikeyajin" id="bikeyajin" value="<%=b.getYajin()%>" size="8" /></td>
                                            <td><input type="text" class="form-control" name="bikecount" id="bikecount" value="<%= b.getCount() %>" size="10" /></td>
                                            <td><input type="text" class="form-control" name="bikeurl" id="bikeurl" value="<%= b.getPic_url() %>" size="25" /></td>

                                            <td align="center" height="20">
                                                <input type="button" class="btn btn-black" value="修改" onclick="checkdd(document.getElementById('mf<%=i%>'),document.getElementById('action<%=i%>'));" />
                                            </td>
                                            <td align="center" height="20">
                                                <input type="button" class="btn btn-danger" value="删除" onclick="delSubmit(document.getElementById('mf<%=i%>'),document.getElementById('action<%=i%>'));" />
                                            </td>
                                        </tr>
                                        </form>
                                        <%} %>
                                            <table class="table">
                                                <tr>
                                                    <td><br>
                                                        <% if(pb.getCurrentpage()>1) {%>
                                                            <form action="SearchPageServlet" name="form" method="post">

                                                                <img src="img/top/prev.gif" style="cursor:hand" onclick="JavaScript:document.form.submit()">
                                                                <input name="baction" type="hidden" value="before2" />
                                                            </form>
                                                            <% } %>
                                                    </td>
                                                    <td>
                                                        <form action="SearchPageServlet" method="post">
                                                            <td>
                                                                <%if(list!=null&&list.size()!=0)
      {
      %>
                                                                    <select onchange="this.form.submit()" name="changepage2">
      	   <% 
      	   		for(int j=1;j<=totalpage;j++)
      	   		{
      	   		String flag1 = "";
      	   			if(j==pb.getCurrentpage())
      	   			{
      	   				flag1 = "selected";
      	   			}
      	    %>
      	    	<option value="<%=j%>" <%= flag1 %>>第<%=j%>页</option>
      	    <% 
      	    	}
      	     %>
      	  </select>
                                                                    <%
}
%>
                                                                        <input name="baction" type="hidden" value="pageChange2" />
                                                            </td>
                                                        </form>
                                                    </td>
                                                    <td>
                                                        <% if(pb.getCurrentpage()<totalpage){ %><br>
                                                            <form action="SearchPageServlet" name="form1" method="post">

                                                                <img src="img/top/next.gif" style="cursor:hand" onclick="JavaScript:document.form1.submit()">
                                                                <input name="baction" type="hidden" value="next2" />

                                                            </form>
                                                            <% } %>
                                                    </td>
                                                </tr>
                                            </table>

                        </body>

                        </html>
                        <%
   String updatemsg=(String)request.getAttribute("updatemsg");
   String deletemsg=(String)request.getAttribute("deletemsg");
   if(updatemsg!=null)
   {
%>
                            <script>
                                alert('<%=updatemsg%>');
                            </script>
                            <%
   request.setAttribute("updatemsg",null);
   }
   if(deletemsg!=null){
%>
                                <script>
                                    alert('<%=deletemsg%>');
                                </script>
                                <%
  	request.setAttribute("deletemsg",null);
   }
    %>