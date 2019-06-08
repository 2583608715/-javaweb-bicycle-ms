<%@ page contentType="text/html;charset=gb2312" pageEncoding="utf-8"%>
    <%@ page import="java.util.*"%>
        <html>

        <head>
            <title>top</title>
            <link rel="stylesheet" href="css/bootstrap3.css">
            <style></style>
        </head>

        <body>

            <div class="navbar navbar-default">
                <div class="container">
                    <div class="navbar-header">
                        <div class="navbar-brand">LOGO(top.jsp修改)</div>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active" style="background:rgb(0, 140, 255)">
                            <a href="pagination.jsp" target="mainFrame">主页</a>
                        </li>


                        <li>
                            <a href="cart.jsp" target="mainFrame">购物车</a>
                        </li>
                        <li>
                            <a href="ddbiao.jsp" target="mainFrame">我的订单</a>
                        </li>


                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                              个人中心
                              <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="customermanage.jsp" target="mainFrame">用户登录</a>
                                </li>
                                <li>
                                    <a href="customerpwchange.jsp" target="mainFrame">重置密码</a>
                                </li>
                                <li>
                                    <a href='CustomerServlet?action=logout' target="mainFrame">注销</a>
                                </li>

                            </ul>
                        </li>
                        <li>
                            <a href="customerzc.jsp" target="mainFrame">注册</a>
                        </li>
                        <li class="danger"> <a href="/bicycle/adminlogin.jsp" target="_blank">管理员</a></li>

                    </ul>
                </div>

            </div>



        </body>
        <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

        </html>