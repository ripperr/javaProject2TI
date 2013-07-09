<%-- 
    Document   : boodschap
    Created on : 21-mei-2013, 14:47:18
    Author     : robin
    
    This file is part of javaProject2TI.

    javaProject2TI is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    javaProject2TI is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with javaProject2TI.  If not, see <http://www.gnu.org/licenses/>.

--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
   
        <h1>${titel}</h1>
        <p>${boodschap}</p>
        <p><a href="ManageServlet?home" style="color: #CC0000">Terug</a></p>
<%@ include file="footer.jsp" %>   
    </body>
</html>
