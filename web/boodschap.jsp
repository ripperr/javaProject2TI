<%-- 
    Document   : boodschap
    Created on : 21-mei-2013, 14:47:18
    Author     : robin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
   
        <h1>${titel}</h1>
        <p>${boodschap}</p>
        <p><a href="LokaalServlet?lokalen" style="color: #CC0000">Terug</a></p>
<%@ include file="footer.jsp" %>   
    </body>
</html>
