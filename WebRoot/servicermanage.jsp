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
                <title>自行车管理</title>
                <script language="javascript" src="script/trim.js"></script>
                <link href="script/style.css" rel="stylesheet" type="text/css" />
                <script language="javascript">
                    function qingkong() {
                        document.all.servicername.value = "";
                        document.all.serviceraddress.value = "";
                        document.all.servicertel.value = "";
                    }

                    function checkAddGoods() {
                        var servicername = document.all.servicername.value;
                        var address = document.all.serviceraddress.value;
                        var tel = document.all.servicertel.value;

                        if (servicername == "") {
                            alert("服务站名称不能为空！！");
                            return;
                        }
                        if (address == "") {
                            alert("服务站地址不能为空！！");
                            return;
                        }
                        if (tel == "") {
                            alert("服务站电话不能为空！！");
                            return;
                        }
                        document.form.submit();
                    }
                </script>
                <link rel="stylesheet" href="css/bootstrap3.css">
                <link rel="stylesheet" href="css/main.css">
    </head>

    <body>
        <br><br>
        <form action="ServicerServlet" name="form" method="post" class="container container-small">
            <h1>添加服务站</h1>
            <div class="form-group">
                <label for="servicername" class="control-label">服务站名称 </label>
                <input type="text" name="servicername" id="servicername" class="form-control" />
            </div>
            <div class="form-group">
                <label for="serviceraddress" class="control-label">服务站地址</label>
                <input type="text" name="serviceraddress" id="serviceraddress" class="form-control">
            </div>
            <div class="form-group">
                <label for="servicertel" class="control-label">服务站电话</label>
                <input type="text" name="servicertel" id="servicertel" class="form-control">
            </div>
            <input name="action" type="hidden" value="add" />

            <input class="btn btn-black" type="button" value="提交" onclick="checkAddGoods()" />

            <input class="btn btn-black" type="reset" onclick="qingkong()" />
        </form>
    </body>
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

    </html>