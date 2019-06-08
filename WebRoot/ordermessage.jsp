<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <%@ page import="com.zyl.bicycle.dao.*" %>
        <%@ page import="com.zyl.bicycle.domain.*" %>

            <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
            <html>

            <head>
                <% 
	   String username=(String)session.getAttribute("user");
	   if(username==null)
	   {
	%>
                    <jsp:forward page="customerzc.jsp" />
                    <%
	   }
	%>
                        <title>定单详情</title>
                        <link rel="stylesheet" href="css/bootstrap3.css">
                        <link rel="stylesheet" href="css/main.css">
                        <script language="javascript">
                            function qingkong() {
                                document.all.kehutel.value = "";
                                document.all.time.value = "";
                            }

                            function checkAddGoods() {
                                var kehutel = document.all.kehutel.value;
                                var time = document.all.time.value;
                                if (kehutel == "") {
                                    alert("客户电话不能为空！！");
                                    return;
                                }
                                if (time == "") {
                                    alert("租期不能为空！！");
                                    return;
                                }
                                document.form.submit();
                            }
                        </script>
            </head>

            <body>
                <form action="YuDingServlet" name="form" method="post" class="container container-small">
                    <h1>订单详情</h1>
                    <div class="form-group">
                        <label for="kehutel" class="control-label">客户电话</label>
                        <input name="kehutel" id="kehutel" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="date" class="control-label">预定日期</label>
                        <input name="year" id="date" type="date" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="time" class="control-label">租期(天)</label>
                        <input name="time" id="time" type="number" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label">归还服务站</label>
                        <select name="servicer" class="form-control">
				<%ServicerDao sd=new ServicerDao();
				  List<Servicer> list=sd.list("from Servicer s");
				  for(Servicer s : list){ %>
			   <option value="<%=s.getId() %>"><%=s.getName() %></option>
			   <%} %>
			   </select>
                    </div>
                    <button class="btn btn-primary" onclick="checkAddGoods()">提交</button>
                    <input name="action" type="hidden" value="save" />
                    <button class="btn btn-primary" nclick="qingkong()">清空</button>

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