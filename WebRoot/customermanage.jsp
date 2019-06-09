<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>

    <head>
        <title>用户登录</title>
        <link rel="stylesheet" href="css/c_modal.css">
        <link rel="stylesheet" href="css/bootstrap3.css">
        <style>
            .container-small {
                max-width: 400px;
            }
            
            h1 {
                padding: 20px;
            }
        </style>
        <script language="javascript">
            function checkLogin() {
                var zname = document.all.zname.value;
                var zpassword = document.all.zpassword.value;
                if (zname == "") {
                    var result = false;
                    var infotext = '用户名不能为空!!!';

                    toalert(result, infotext);

                    return;
                }
                if (zpassword == "") {
                    var result = false;
                    var infotext = '密码不能为空!!!';

                    toalert(result, infotext);
                    return;
                }
                document.anform.submit();
            }
        </script>
        <%
     String userStr=(String)session.getAttribute("user");
     if(userStr!=null)
     {
       request.setAttribute("msg","请您注销后再登录其他用户名！");
   %>
            <jsp:forward page="pagination.jsp" />
            <%
     }
   %>
    </head>

    <body>

        <form class="container container-small body" action="CustomerServlet" name="anform" method="post">
            <h1>用户登录</h1>
            <div class="form-group">
                <label for="zname" class="control-label">用户名</label>
                <input type="text" class="form-control" name="zname" id="zname" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <label for="zpassword" class="control-label">密码</label>
                <input name="zpassword" type="password" id="zpassword" class="form-control" placeholder="请输入密码">
            </div>
            <input name="action" type="hidden" value="denglu" />
            <button type="button" class="btn btn-primary btn-block" onclick="checkLogin()">登录</button>
            <br><a href="javascript:history.back()">返回</a>
        </form>


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
        <script>
            <% 
        String msg=(String)request.getAttribute("msg");
        if(msg!=null)
        {
      %>
            var result = true;
            var infotext = '<%=msg%>';

            toalert(result, infotext);
            <%
        }
       %>
        </script>
    </body>

    </html>