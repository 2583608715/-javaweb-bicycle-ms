<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/adminleft.css">
        <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <style>

        </style>
    </head>


    <body>
        <% 
            String chaoji=(String)session.getAttribute("chaoji");    
            System.out.println("cj"+chaoji+"|"+session.getId());
          %>
            <div class="well">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-2">
                            <ul id="main-nav" class="nav nav-tabs nav-stacked">
                                <li class="active">
                                    <a href="./Welcome.jsp" target="mainFrame">
                                        <i class="glyphicon glyphicon-home"></i> 首页
                                    </a>
                                </li>
                                <li>

                                    <a href="#adminmanage" class="nav-header collapsed" data-toggle="collapse">
                                        <i class="glyphicon glyphicon-cog"></i> 管理员管理
                                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                                    </a>


                                    <ul id="adminmanage" class="nav nav-list collapse secondmenu" style="height: 0px;">
                                        <%
                                                if(chaoji!=null)
                                                {
                                                %>
                                            <li><a href="adminzc.jsp" target="mainFrame"><i class="glyphicon glyphicon-plus"></i>管理员添加</a></li>
                                            <li><a href="admindelate.jsp" target="mainFrame"><i class=" glyphicon glyphicon-minus"></i>管理员删除</a></li>
                                            <%         	  
                                                }
                                                %>
                                                <li><a href="adminlist.jsp" target="mainFrame"><i class="glyphicon glyphicon-th-list"></i>管理员信息</a></li>
                                                <li><a href="adminchangepw.jsp" target="mainFrame"><i class="glyphicon glyphicon-asterisk"></i>密码修改</a></li>

                                    </ul>
                                </li>
                                <li>
                                    <a href="#bicyclemanage" class="nav-header collapsed" data-toggle="collapse">
                                        <i class="glyphicon glyphicon-cog"></i> 自行车管理
                                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                                    </a>
                                    <ul id="bicyclemanage" class="nav nav-list collapse secondmenu" style="height: 0px;">
                                        <%
                                                            if(chaoji!=null)
                                                            {
                                                            %>
                                            <li><a href="servicermanage.jsp" target="mainFrame"><i class="glyphicon glyphicon-plus"></i>服务站添加</a></li>
                                            <li><a href="servicermd.jsp" target="mainFrame"><i class="glyphicon glyphicon-minus"></i>服务站删除修改</a></li>
                                            <%         	  
                                                            }
                                                            %>
                                                <li><a href="bikemanage.jsp" target="mainFrame"><i class="glyphicon glyphicon-plus"></i>自行车添加</a></li>
                                                <li><a href="bikemd.jsp" target="mainFrame"><i class="glyphicon glyphicon-minus"></i>自行车删除修改</a></li>

                                    </ul>
                                </li>
                                <li>
                                    <a href="#ddmanage" class="nav-header collapsed" data-toggle="collapse">
                                        <i class="glyphicon glyphicon-cog"></i> 订单管理
                                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                                    </a>
                                    <ul id="ddmanage" class="nav nav-list collapse secondmenu" style="height: 0px;">
                                        <li><a href="AdminServlet?action=alldd" target="mainFrame"><i class="glyphicon glyphicon-th"></i>全部订单列表</a></li>
                                        <li><a href="AdminServlet?action=yfsdd" target="mainFrame"><i class="glyphicon glyphicon-ok"></i>已接收订单</a></li>
                                        <li><a href="AdminServlet?action=wfsdd" target="mainFrame"><i class="glyphicon glyphicon-remove"></i>未接收订单</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="AdminLogoutServlet?action=logout" target="_top" class="out">
                                        <i class="glyphicon glyphicon-off"></i> 注销
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>
                </div>
            </div>



    </body>




    </html>