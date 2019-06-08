<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>

    <head>
        <title>后台登录</title>
        <link rel="stylesheet" href="css/bootstrap3.css">
        <style>
            body {
                margin-top: 80px;
            }
            
            .container-small {
                max-width: 400px;
            }
            
            h1 {
                padding-bottom: 20px;
            }
            
            #back {
                display: block;
                padding-top: 20px;
            }
        </style>
        <script language="javascript">
            function checkManLogin() {
                var mmname = document.all.mmname.value;
                var mmpassword = document.all.mmpassword.value;
                if (mmname == "") {
                    alert("管理员名不能为空!!!");
                    return;
                }
                if (mmpassword == "") {
                    alert("密码不能为空!!!");
                    return;
                }
                document.anform.submit();
            }
        </script>
    </head>

    <body>
        <form action="AdminLogoutServlet" name="anform" method="post" class="container container-small">
            <h1>管理员登录</h1>
            <div class="form-group">
                <label for="mmname" class="control-label">管理员用户名</label>
                <input name="mmname" type="text" id="mmname" class="form-control" placeholder="由小写英文字母、中文、数字组成" />
            </div>
            <div class="form-group">
                <label for="mmpassword" class="control-label">密码</label>
                <input name="mmpassword" type="password" id="mmpassword" class="form-control" placeholder="由小写英文字母数字组成，6位小于15位" />
            </div>
            <input name="action" type="hidden" value="mandenglu" />
            <button type="button" class="btn btn-block btn-primary" onclick="checkManLogin()">注册</button>
            <a id="back" href="./">返回</a>
        </form>


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