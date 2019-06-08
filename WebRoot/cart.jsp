<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <%@ page import="com.zyl.bicycle.domain.*" %>
        <%@ page import="com.zyl.bicycle.dao.*" %>
            <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
            <%Map<Long,Integer> map=(HashMap<Long,Integer>)session.getAttribute("cart"); 
   %>
                <html>

                <head>
                    <link rel="stylesheet" href="css/bootstrap3.css">
                    <style>

                    </style>

                    <script language="javascript">
                        function checkNum(num) {
                            var reg = /^[1-9][0-9]*$/;
                            if (reg.test(num.trim())) {
                                return true;
                            } else {
                                alert("商品数量只能为数字且不能为0！！！");
                                return false;
                            }
                        }
                    </script>
                </head>

                <body>
                    <%  
if(map==null) 
{ 
%>
                        <table>
                            <tr>
                                <td>
                                    <img src="img/png-0405.png" />
                                </td>
                                <td>
                                    <b style="font-size:1.5em">没有预定任何自行车！！！</b>
                                </td>
                            </tr>
                        </table>
                        <%
}

else
{ if(map.size()==0){%>
                            <table>
                                <tr>
                                    <td>
                                        <img src="img/png-0405.png" />
                                    </td>
                                    <td>
                                        <b style="font-size:1.5em">没有预定任何自行车！！！</b>
                                    </td>
                                </tr>
                            </table>
                            <% }else{
  List<Bike> bikes=new ArrayList<Bike>();
  BikeDao bd =new BikeDao();
  double price=0;
  double yajin=0;
  for(long id : map.keySet()){
    bikes.add(bd.findOfId(id));
    price=price+bd.findOfId(id).getPrice()*map.get(id);
    yajin=yajin+bd.findOfId(id).getYajin()*map.get(id);
  }
%>

                                <table width="100%">
                                    <tr align="center">
                                        <td>

                                            <table border="0" width="70%" align="center">
                                                <tr>
                                                    <td style="font-size:1.6em" align="center">
                                                        预定自行车
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                        <table class="table" border="1" width="100%" bgcolor="#337ab7" cellspacing="1">
                                                            <tr>
                                                                <th>自行车ID</th>
                                                                <th>自行车名称</th>
                                                                <th>所属服务站</th>
                                                                <th>租金</th>
                                                                <th>押金</th>
                                                                <th>数量</th>
                                                                <th>删除</th>
                                                            </tr>
                                                            <% 
		for(Bike b : bikes){		
	%>
                                                                <tr>
                                                                    <td>
                                                                        <%= b.getId() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= b.getName()%>
                                                                    </td>
                                                                    <td>
                                                                        <%=b.getServicer().getName() %>
                                                                    </td>
                                                                    <td width="100">￥
                                                                        <%= b.getPrice() %>
                                                                    </td>
                                                                    <td width="100">￥
                                                                        <%= b.getYajin() %>
                                                                    </td>
                                                                    <form action="YuDingServlet" method="post" onsubmit="return checkNum(document.all.gnum<%=b.getId() %>.value);">
                                                                        <td width="100">

                                                                            <input class="form-control" type="text" id="gnum<%= b.getId() %>" name="gnum" value="<%=map.get(b.getId())%>" size="5" />
                                                                            <input class="btn btn-primary" type="submit" value="修改" />


                                                                            <input type="hidden" name="bikeid" value="<%=b.getId()%>" />
                                                                            <input type="hidden" name="action" value="change" />
                                                                        </td>
                                                                    </form>
                                                                    <form action="YuDingServlet" method="post">
                                                                        <td width="100" align="center">
                                                                            <input class="btn btn-danger" type="submit" value="删除" />
                                                                            <input type="hidden" name="bikeid" value="<%= b.getId()%>" />
                                                                            <input type="hidden" name="action" value="delete" />
                                                                        </td>
                                                                    </form>
                                                                </tr>
                                                                <%
		}
	 %>
                                                        </table>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table width="100%" border="0">
                                                            <tr>
                                                                <td align="right" colspan="3"><b>租金:￥<%= price %>元</b></td>
                                                                <td align="right" colspan="3"><b>押金:￥<%= yajin %>元</b></td>
                                                                <td align="center">
                                                                    <form action="YuDingServlet">
                                                                        <td width="100" align="center">
                                                                            <input class="btn btn-success" type="submit" value="结帐" />
                                                                            <input type="hidden" name="action" value="jiezhang" />
                                                                        </td>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <% 
	}}
     %>
                                                </center>
                                                <br/>
                                                <script>
                                                    <% 
         String msg=(String)request.getAttribute("msg");
         if(msg!=null)
         {
      %>
                                                    alert('<%=msg%>');
                                                    <%
         }
       %>
                                                </script>
                </body>

                </html>