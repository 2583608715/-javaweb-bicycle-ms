<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

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
                <script language="javascript" src="script/trim.js"></script>
                <script language="javascript">
                    function check() {
                        var aname = document.getElementById('aname').value;
                        var apwd = document.addform.apwd.value;
                        var secpwd = document.addform.secpwd.value;
                        if (aname == "") {
                            alert("管理员名不能为空!!!");
                            return;
                        }
                        if (apwd == "" || apwd.length < 6) {
                            alert("密码不合法,长度不得小于6!!!");
                            return;
                        }
                        if (secpwd != apwd) {
                            alert("两次密码输入不一至!!!");
                            return;
                        }
                        document.addform.submit();
                    }
                </script>
                <link rel="stylesheet" href="css/bootstrap3.css">
                <link rel="stylesheet" href="css/main.css">
    </head>

    <body>
        <br><br>

        <form action="AdminLogoutServlet" method="post" name="addform" class="container container-small">
            <h1>密码修改</h1>
            <%
                  	   if(chaoji==null)
                  	   {
                  	%>
                <input type="hidden" name="aname" value="<%=session.getAttribute(" admin ")%>"/>

                <%
                  	   }
                  	   else
                  	   {
                  	%>
                    <input type="hidden" name="aname" id="aname" value="<%=session.getAttribute(" admin ")%>"/>
                    <%
                  	   }
                  	%>
                        <div class="form-group">
                            <label for="mpassword" class="control-label">新密码</label>
                            <input type="password" name="apwd" id="mpassword" class="form-control" placeholder="由小写英文字母数字组成，6位小于15位" />
                        </div>
                        <div class="form-group">
                            <label for="mpw" class="control-label">重复密码</label>
                            <input type="password" name="secpwd" id="mpw" class="form-control" placeholder="由小写英文字母数字组成，6位小于15位">
                        </div>
                        <input type="hidden" name="action" value="resetpwd" />
                        <input class="btn btn-black" type="button" value="提交" onclick="check()" />

                        <input class="btn btn-black" type="reset" value="重置" />
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