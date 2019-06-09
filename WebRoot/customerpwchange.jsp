<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <% 
	session.setAttribute("fromWhere","mmcz");
	String user=(String)session.getAttribute("user");
	if(user==null)
	{
		response.sendRedirect("customermanage.jsp");
	}
	else
	{
 %>
        <html>

        <head>
            <title>密码重置</title>
            <link rel="stylesheet" href="css/bootstrap3.css">
            <link rel="stylesheet" href="css/c_modal.css">
            <style>
                .container-small {
                    max-width: 400px;
                }
            </style>
            <script language="javascript">
                function check() {
                    var apwd = document.addform.apwd.value;
                    var secpwd = document.addform.secpwd.value;
                    if (apwd == "" || apwd.length < 6) {
                        var result = false;
                        var infotext = '密码不合法,长度不得小于6!!!!';
                        toalert(result, infotext);

                        return;
                    }
                    if (secpwd != apwd) {
                        var result = false;
                        var infotext = '两次密码输入不一至!!!';
                        toalert(result, infotext);

                        return;
                    }
                    document.addform.submit();
                }
            </script>
        </head>

        <body>
            <form action="CustomerServlet" method="post" name="addform" class="body container container-small">
                <h1>密码重置</h1>
                <div class="form-group">
                    <label for="cname" class="control-label">用户名</label>
                    <input value="<%=user%>" disabled class="form-control" placeholder="由小写英文字母、中文、数字组成" id="cname" />
                </div>
                <div class="form-group">
                    <label for="cpassword" class="control-label">密码</label>
                    <input name="apwd" type="password" id="cpassword" class="form-control" placeholder="由小写英文字母数字组成，6位小于15位" />
                </div>
                <div class="form-group">
                    <label for="secpwd" class="control-label">重复密码</label>
                    <input type="password" class="form-control" placeholder="由小写英文字母数字组成，6位小于15位" name="secpwd" id="secpwd" />
                </div>
                <input type="hidden" name="action" value="resetpwd" />
                <button type="button" class="btn  btn-primary" onclick="check()">确认</button>
                <input class="btn  btn-primary" type="reset" value="清空" />
                <a href="javascript:history.back()">返回</a>
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
        </body>

        </html>
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
                <% 
 	}
%>