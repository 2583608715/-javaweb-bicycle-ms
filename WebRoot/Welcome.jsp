<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>

    <head>

        <link rel="stylesheet" href="css/welcome.css" media="screen" type="text/css" />

    </head>

    <body>

        <h1 class="text"><span>Welcome You!</span></h1>
        <div style="text-align:center;clear:both;">

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


    </html>