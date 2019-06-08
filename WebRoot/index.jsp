<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>

    <head>
        <title>自行车租赁中心</title>

        <style>
            #box {
                min-width: 960px;
            }
        </style>

    </head>
    <div class="well">
        <frameset id="box" frameborder="no" rows="20%,*">
            <frame name="topFrame" scrolling="NO" noresize width="20%" src="top.jsp">
                <frameset frameborder="no" cols="20%,*">
                    <frame name="leftFrame" scrolling="no" noresize src="left.jsp">
                        <frame name="mainFrame" scrolling="YES" src="pagination.jsp">
                </frameset>
        </frameset>
    </div>



    <body>
    </body>

    </html>