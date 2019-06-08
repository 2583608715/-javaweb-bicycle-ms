<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>

    <head>

    </head>

    <body>
        www.www.www.www.www
    </body>
    <% 
   String msg=(String)request.getAttribute("msg");
   if(msg!=null)
   {
%>
        <script>
            alert("<%=msg%>");
        </script>
        <%
   }
%>
            <script>
                $(window).load(function() {
                    $("#target").trigger("click");
                })
            </script>

    </html>