<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>

    <head>
        <title>用户注册</title>
        <link rel="stylesheet" href="css/bootstrap3.css">
        <style>
            .container-small {
                max-width: 400px;
            }
        </style>

        <script language="javascript">
            function checkCname() {
                var flag = false;
                var cname = document.aform.cname.value;
                if (cname == "") {
                    alert("用户名不能为空");
                } else {
                    flag = true;
                    alert("用户名");
                }
                return flag;
            }

            function checkCpw() {
                var flag = false;
                var cpassword = document.aform.cpassword.value;
                var zzs = /^[a-z0-9A-Z]{6,15}$/;
                if (cpassword == "") {
                    alert("密码不能为空");
                } else if (!zzs.test(cpassword)) {
                    alert("不符合规定");
                } else {
                    flag = true;
                    alert("密码");
                }
                return flag;
            }

            function checkSpw() {
                var flag = false;
                var cpassword = document.aform.cpassword.value;
                var spw = document.aform.spw.value;
                if (spw == "") {
                    alert("重复输入不能为空");
                } else if (spw != cpassword) {
                    document.all.spinfo.innerHTML =
                        alert("两次密码输入不一致");
                } else {
                    flag = true;
                    alert("s密码");
                }
                return flag;
            }

            function checkEmail() {
                var flag = false;
                var email = document.aform.email.value;
                var zzs = /^\w{1,12}@[a-z0-9]{1,8}\.(com)|( cn)$/;
                if (email == "") {
                    alert("email不能为空");
                } else if (!zzs.test(email)) {
                    alert(email);
                    alert("email输入格式有误");
                } else {
                    flag = true;
                    alert("email");
                }
                return flag;
            }

            function checkSub() {
                var flag1 = checkCname();
                var flag2 = checkCpw();
                var flag3 = checkSpw();
                var flag4 = checkEmail();
                if (flag1 && flag2 && flag3 && flag4) {
                    document.aform.submit();
                }
            }
        </script>
    </head>

    <body>

        <% 
   String user=(String)session.getAttribute("user");              //判断是否已登录，未实现
   boolean loginFlag=false; //false表示没有登录
   if(user !=null)
   {
      loginFlag=true;
   }
%>
            <form action="CustomerServlet" name="aform" method="post" class="container container-small">
                <h1>用户注册</h1>
                <div class="form-group">
                    <label for="cname" class="control-label">用户名</label>
                    <input name="cname" type="text" id="cname" class="form-control" placeholder="由小写英文字母、中文、数字组成" onblur="checkCname" <%=loginFlag? "disabled": ""%> />
                </div>
                <div class="form-group">
                    <label for="cpassword" class="control-label">密码</label>
                    <input name="cpassword" type="password" id="cpassword" class="form-control" placeholder="由小写英文字母数字组成，6位小于15位" onblur="checkCpw" <%=loginFlag? "disabled": ""%> />
                </div>
                <div class="form-group">
                    <label for="spw" class="control-label">重复密码</label>
                    <input type="password" class="form-control" placeholder="由小写英文字母数字组成，6位小于15位" name="spw" id="spw" onblur="checkSpw" <%=loginFlag? "disabled": ""%>>
                </div>
                <div class="form-group">
                    <label for="email" class="control-label">邮箱</label>
                    <input type="email" class="form-control" placeholder="请输入符合格式的邮箱地址" name="email" id="email" onblur="checkEmail" <%=loginFlag? "disabled": ""%> value="
                    <%=(request.getParameter("email")!=null)?request.getParameter("email"):""%>">
                </div>
                <input name="action" type="hidden" value="zhuce" />
                <button type="button" class="btn btn-block btn-primary" onclick="<%=(loginFlag)?" ":"checkSub() "%>">注册</button>
                <a href="javascript:history.back()">返回</a>
            </form>

    </body>
    <script>
        <% 
    if(loginFlag)
    {
  %>
        alert("已经登录的情况下不可以注册新用户，\n请注销后再执行此操作！");
        <%
    }
   %>
    </script>
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

    </html>