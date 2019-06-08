<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <%@ page import="com.zyl.bicycle.dao.*" %>
        <%@ page import="com.zyl.bicycle.domain.*" %>

            <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
            <html>

            <head>
                <% 
	   String chaoji=(String)session.getAttribute("chaoji");
	   String putongF=(String)session.getAttribute("putong");
	   if(chaoji==null&&putongF==null)
	   {
	     request.setAttribute("msg", "对不起，只有管理员才可以\\n使用此项功能，请登陆！");
	%>
                    <jsp:forward page="adminlogin.jsp" />
                    <%
	   }
	%>
                        <title>自行车管理</title>
                        <link rel="stylesheet" href="css/bootstrap3.css">
                        <link rel="stylesheet" href="css/main.css">
                        <script language="javascript">
                            function qingkong() {
                                document.all.bikename.value = "";
                                document.all.bikeprice.value = "";
                                document.all.bikeyajin.value = "";
                                document.all.bikecount.value = "";
                                document.all.bikeurl.value = "";
                            }

                            function checkAddGoods() {
                                var bikename = document.all.bikename.value;
                                var bikeprice = document.all.bikeprice.value;
                                var bikeyajin = document.all.bikeyajin.value;
                                var bikecount = document.all.bikecount.value;
                                var bikeurl = document.all.bikeurl.value;

                                if (bikename == "") {
                                    alert("自行车名称不能为空！！");
                                    return;
                                }
                                if (bikeprice == "") {
                                    alert("租金不能为空！！");
                                    return;
                                }
                                if (bikeyajin == "") {
                                    alert("押金不能为空！！");
                                    return;
                                }
                                if (bikecount == "") {
                                    alert("数量不能为空！！");
                                    return;
                                }
                                if (bikeurl == "") {
                                    alert("Url链接不能为空！！");
                                    return;
                                }
                                document.form.submit();
                            }
                        </script>
            </head>

            <body>
                <br>
                <form action="BikeServlet" name="form" method="post" class="container container-small">
                    <h1>添加自行车</h1>
                    <div class="form-group">
                        <label for="bikename" class="control-label">名称</label>
                        <input type="text" name="bikename" id="bikename" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="bikeprice" class="control-label">租金(天）</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                ￥
                            </div>
                            <input type="number" name="bikeprice" id="bikeprice" class="form-control">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="bikeyajin" class="control-label">押金</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                ￥
                            </div>
                            <input type="number" name="bikeyajin" id="bikeyajin" class="form-control">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="bikecount" class="control-label">数量 </label>
                        <input type="text" name="bikecount" id="bikecount" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="bikeurl" class="control-label">图片链接 </label>
                        <input type="text" name="bikeurl" id="bikeurl" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="ser" class="control-label">所属服务站 </label>
                        <select name="servicer" class="form-control" id="ser">
								<%ServicerDao sd=new ServicerDao();
								  List<Servicer> list=sd.list("from Servicer s");
								  for(Servicer s : list){ %>
							   <option value="<%=s.getName() %>"><%=s.getName() %></option>
							   <%} %>
						 </select>
                    </div>
                    <button type="button" class="btn btn-black" onclick="checkAddGoods()">添加</button>
                    <input name="action" type="hidden" value="add" />
                    <button type="button" class="btn btn-black" onclick="qingkong()">清空</button>
                </form>


            </body>
            <% 
   String msg=(String)request.getAttribute("msg");
   if(msg!=null)
   {
%>
                <script>
                    alert('<%=msg%>');
                </script>
                <%
   }
%>

            </html>