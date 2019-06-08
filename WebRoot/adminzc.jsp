<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>

    <head>
        <title>管理员添加</title>
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
                <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
                <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script language="javascript">
                    function checkMname() {
                        var flag = false;
                        var mname = document.aform.mname.value;
                        if (mname == "") {
                            $("#msg").text("用户不能为空");
                            $("#target").trigger("click");
                        } else {
                            flag = true;
                        }
                        return flag;
                    }

                    function checkMpassword() {
                        var flag = false;
                        var mpassword = document.aform.mpassword.value;
                        var zzs = /^[a-z0-9A-Z]{6,15}$/;
                        if (mpassword == "") {
                            $("#msg").text("密码不能为空");
                            $("#target").trigger("click");
                        } else if (!zzs.test(mpassword)) {
                            $("#msg").text("密码格式错误");
                            $("#target").trigger("click");
                        } else {
                            flag = true;

                        }
                        return flag;
                    }

                    function checkMpw() {
                        var flag = false;
                        var mpassword = document.aform.mpassword.value;
                        var mpw = document.aform.mpw.value;
                        if (mpw == "") {
                            $("#msg").text("重复密码不能为空");
                            $("#target").trigger("click");
                        } else if (mpw != mpassword) {
                            $("#msg").text("输入的两次密码不匹配");
                            $("#target").trigger("click");
                        } else {
                            flag = true;

                        }
                        return flag;
                    }

                    function checkTJ() {
                        var flag1 = checkMname();
                        if (flag1) {
                            var flag2 = checkMpassword();
                            if (flag2) {
                                var flag3 = checkMpw();
                            }
                        }

                        if (flag1 && flag2 && flag3) {
                            document.aform.submit();
                        }
                    }
                </script>
    </head>

    <body>
        <br><br>

        <form action="AdminLogoutServlet" name="aform" method="post" class="container container-small">
            <h1>添加管理员</h1>
            <div class="form-group">
                <label for="mname" class="control-label">用户名</label>
                <input name="mname" type="text" id="mname" onblur="checkMname" class="form-control" placeholder="由小写英文字母、中文、数字组成" />
            </div>
            <div class="form-group">
                <label for="mpassword" class="control-label">密码</label>
                <input name="mpassword" type="password" id="mpassword" onblur="checkMpassword" class="form-control" placeholder="由小写英文字母数字组成，6位小于15位" />
            </div>
            <div class="form-group">
                <label for="mpw" class="control-label">重复密码</label>
                <input name="mpw" type="password" id="mpw" onblur="checkMpw" class="form-control" placeholder="由小写英文字母数字组成，6位小于15位">
            </div>
            <div class="form-group">
                <label for="quanxian" class="control-label">权限</label>
                <select name="quanxian" id="quanxian" class="form-control ">
				<option selected value="普通">普通
				<option value="超级">超级
		</select>
            </div>
            <input name="tianjia" type="button" class="btn btn-black" value="添加" onclick="checkTJ()" />
            <input name="action" type="hidden" value="tianjia" />

            <input class="btn btn-black  btn-black-ps" type="reset" id="zhuce" name="zhuce" value="重置" />

        </form>


        <button class="hidden" id="target" data-toggle="modal" data-target="#myModal">
                this is a modal!
             </button>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                             </button>
                        <h1 style="color:red" class="modal-title" id="myModalLabel">
                            ERROR
                        </h1>
                    </div>
                    <div id="msg" class="modal-body">
                        xxxx
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-black" data-dismiss="modal">确定
                             </button>
                        <button type="button" class="btn btn-black" data-dismiss="modal">
                                 取消
                             </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>


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