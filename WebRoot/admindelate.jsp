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

                        <link rel="stylesheet" href="css/bootstrap3.css">
                        <link rel="stylesheet" href="css/main.css">
            </head>

            <body>


                <br><br>
                <table class="table">
                    <tr>
                        <td>
                            <table class="table">
                                <caption style="font-size:1.5em;font-weight:bold">管理员管理</caption>

                                <tr>
                                    <th>管理员名</th>
                                    <th>管理员密码</th>
                                    <th>管理员权限</th>
                                    <th>删除</th>
                                </tr>


                                <%
		AdminDao ad=new AdminDao();
		String hql="from Admin a";
		List<Admin> list=ad.list(hql);
		for(Admin a : list)
		{
			
       %>

                                    <tr>
                                        <td>
                                            <%= a.getName() %>
                                        </td>
                                        <td>
                                            <%= a.getPassword() %>
                                        </td>
                                        <td>
                                            <%= a.getLevel() %>
                                        </td>
                                        <form action="AdminLogoutServlet">
                                            <td>
                                                <input class="btn btn-danger" type="submit" value="删除" />
                                                <input type="hidden" name="mname" value="<%=a.getName()%>" />
                                                <input type="hidden" name="action" value="mandelete" />
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
                            <a class="btn btn-primary btn-black btn-block" href="Welcome.jsp">
返回
                                </a>
                        </td>
                    </tr>
                </table>

            </body>

            </html>

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