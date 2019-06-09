<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <%@ page import="com.zyl.bicycle.domain.*" %>
        <%@ page import="com.zyl.bicycle.dao.*" %>
            <%@ page import="com.zyl.bicycle.bean.*" %>
                <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

                <%   
    
    PageBean pb=(PageBean)session.getAttribute("buypage");
    int id=pb.getSort();
    BikeDao bd=new BikeDao();
    List<Bike> list=bd.listOfPageAndServicer(pb.getCurrentpage(),id);
   
  
    %>


                    <html>

                    <head>
                        <link rel="stylesheet" href="css/c_modal.css">
                        <link rel="stylesheet" href="css/bootstrap3.css">
                        <link rel="stylesheet" href="css/main.css">

                        <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
                        <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
                    </head>

                    <body>
                        <div class="body">
                            <table>
                                <%int i=0;
                for(Bike b : list){
                i++;%>
                                    <tr>
                                        <td> <img class="img-rounded" style="padding: 10px;" src="<%=b.getPic_url()%>" id="img" height="150" width="120" /></td>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td>自行车ID：
                                                        <%=b.getId() %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>自行车名称：
                                                        <%=b.getName() %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>租金：￥
                                                        <%=b.getPrice() %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>押金：￥
                                                        <%=b.getYajin() %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>数量：
                                                        <%=b.getCount() %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>所属服务站：
                                                        <%=b.getServicer().getName() %>
                                                    </td>
                                                </tr>
                                                <%if(b.getCount()!=0){ %>
                                                    <form action="YuDingServlet" method="post" id="mf<%=i%>">
                                                        <tr>
                                                            <td>
                                                                <input class="btn btn-sm btn-primary" type="submit" name="tijiao" value="预定">
                                                                <input type="hidden" name="bid" value="<%=b.getId() %>">
                                                                <input type="hidden" name="action" value="buy">
                                                            </td>
                                                        </tr>
                                                    </form>
                                                    <%} %>
                                            </table>
                                        </td>
                                    </tr>


                                    <%} %>
                            </table>
                            <hr color="black" size="1" />
                            <table>
                                <tr>
                                    <td><br>
                                        <% if(pb.getCurrentpage()>1) {%>
                                            <form action="BikeSortPageServlet" name="form" method="post">

                                                <img src="img/top/prev.gif" style="cursor:hand" onclick="JavaScript:document.form.submit()">
                                                <input name="showaction" type="hidden" value="before3" />
                                            </form>
                                            <% } %>
                                    </td>
                                    <td>
                                        <form action="BikeSortPageServlet" method="post">
                                            <td align="center" width="200">
                                                <%if(list!=null&&list.size()!=0)
                  {
                  %>
                                                    <select onchange="this.form.submit()" name="changepage3">
                         <% 
                                 for(int j=1;j<=pb.getTotalpage();j++)
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
                                                        <input name="showaction" type="hidden" value="pageChange3" />
                                            </td>
                                        </form>
                                    </td>
                                    <td>
                                        <% if(pb.getCurrentpage()<pb.getTotalpage()){ %><br>
                                            <form action="BikeSortPageServlet" name="form1" method="post">

                                                <img src="img/top/next.gif" style="cursor:hand" onclick="JavaScript:document.form1.submit()">
                                                <input name="showaction" type="hidden" value="next3" />

                                            </form>
                                            <% } %>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <!--modal-->
                        <div id="c_modal">
                            <div class="c_alert">
                                <div class="c_close">×</div>
                                <div id="c_info">
                                    <span class="info_icon"></span>
                                    <span id="info">密码不能为空!</span>
                                </div>
                            </div>
                        </div>
                        <script src="js/c_modal.js"></script>

                    </body>
                    <% 
                    String msg=(String)request.getAttribute("msg");
                    if(msg!=null)
                    {
                 %>
                        <script>
                            var result = true;
                            var infotext = '<%=msg%>';

                            toalert(result, infotext);
                        </script>
                        <%
                    }
                 %>


                    </html>