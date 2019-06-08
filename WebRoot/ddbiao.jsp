<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <%@ page import="com.zyl.bicycle.domain.*" %>
        <%@ page import="com.zyl.bicycle.dao.*" %>
            <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
            <% 
	String user=(String)session.getAttribute("user");
	if(user==null)
	{
		request.getRequestDispatcher("/customermanage.jsp").forward(request,response);
	}
	else
	{ OrderDao od=new OrderDao();
	  List<Order> list=od.listOfClient(user);
     %>
                <html>

                <head>
                    <link rel="stylesheet" href="css/bootstrap3.css">
                    <title></title>
                    <script language="javascript">
                        function check(temp, mmf) {
                            if (temp == "mod") {

                                mmf.action.value = "ordercx";
                            }
                            mmf.submit();
                        }
                    </script>
                </head>

                <body>
                    <%if(list==null||list.size()==0){ %>
                        <table class="table">
                            <tr>
                                <td>
                                    <img src="img/png-0405.png" />
                                </td>
                                <td>
                                    <b style="font-size:1.5em">没有定单！！！</b>
                                </td>
                            </tr>
                        </table>
                        <%}else{ %>
                            <table class="table">
                                <tr>
                                    <td>
                                        <table class="table">
                                            <caption style="font-size:1.6em;font-weight:bold">订单信息</caption>
                                            <tr bgcolor="#d2e9ff">
                                                <th>订单号</th>
                                                <th>状态</th>
                                                <th>客户ID</th>
                                                <th>收货人电话</b>
                                                    </font>
                                                </th>
                                                <th>总租金</th>
                                                <th>总押金</th>
                                                <th>预订拿车时间</th>
                                                <th>租期</th>
                                                <th>查看明细</th>
                                            </tr>
                                            <%	
      	int i=0;
      	double price=0;
      	double yajin=0;
	     for(Order o : list)
		{
		i++;
		for(Item item : o.getItems()){
		  price=price+item.getBike().getPrice()*item.getCount();
		  yajin=yajin+item.getBike().getYajin()*item.getCount();
		}		   
		 %>

                                                <tr>
                                                    <td>
                                                        <%=o.getId()%>
                                                    </td>
                                                    <td>
                                                        <%=o.getOrdercheck() %>
                                                    </td>
                                                    <td>
                                                        <%= o.getClient_name() %>
                                                    </td>
                                                    <td>
                                                        <%= o.getKehutel() %>
                                                    </td>
                                                    <td>￥
                                                        <%= price%>元</td>
                                                    <td>￥
                                                        <%= yajin%>元</td>
                                                    <td>
                                                        <%=o.getCreate_date()%>
                                                    </td>
                                                    <td>
                                                        <%=o.getTime()%>
                                                    </td>
                                                    <form action="item.jsp">
                                                        <td align="center" height="20">
                                                            <input type="hidden" name="oid" value="<%= o.getId()%>" />
                                                            <input type="hidden" name="action" value="modify1" />
                                                            <input class="btn btn-primary" type="submit" value="查看" />
                                                        </td>
                                                    </form>
                                                </tr>
                                                <% 
	   	}
	   	}
	   	}
	    %>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <hr></hr>
                </body>

                </html>