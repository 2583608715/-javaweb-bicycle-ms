<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <%@ page import="com.zyl.bicycle.dao.*" %>
        <%@ page import="com.zyl.bicycle.domain.*" %>

            <html>

            <head>
                <link rel="stylesheet" href="css/bootstrap3.css">
                <style>
                    .well {
                        padding-left: 150px;
                    }
                </style>
            </head>

            <body>
                <div class="well">
                    <div class="list-group side-bar">
                        <div class="list-group-item active">请选择服务点</div>
                        <%ServicerDao sd=new ServicerDao(); 
                        List<Servicer> list=sd.list("from Servicer s");
                        if(list!=null){
                         for(Servicer s : list){%>

                            <a class="list-group-item" href="BikeSortPageServlet?servicer=<%=s.getId()%>" target="mainFrame">
                                <font>
                                    <%=s.getName() %>
                                </font>
                            </a>

                            <%}
                        } %>

                    </div>




            </body>

            </html>