<!--
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
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<!--start holder-->

<div class="holder_content">

    <section class="group1">
        <h3>Overzicht docenten ${titel}</h3>

        <table>
            <form id="toevoegen" id="toevoegen" action="DocentServlet" method="get">
                <tr>
                    <td><input type="submit" value="Docent toevoegen" name="docentToevoegen"/></td>
                </tr>
            </form>

        </table>
        <table border="1">
            <tr>
                <th>Nummer: </th>
                <th>Voornaam: </th>
                <th>Familienaam: </th>
                <th>Email: </th>
            </tr>
            <c:forEach var="docent" items="${docenten}" >

                <tr>
                    <td>${docent.nummer}</td>

                    <td>${docent.voornaam}</td>
                    <td>${docent.familienaam}</td>
                    <td>${docent.email}</td>
                    <c:choose>
                        <c:when test="${sessionScope.ingelogd!=null}">
                            <td><a href="DocentServlet?wijzigenDocent=${docent.id}"><img src="images/edit.png" width="25" height="20"/></a></td>
                            <td><a onclick="return confirm('Ben je zeker dat je deze docent wil deleten?')" href="DocentServlet?deleteDocent=${docent.id}"><img src="images/delete.png" width="25" height="20"/></a></td>
                        </c:when>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>

    </section>
</div>
<!--end holder-->

<!--start holder-->


<!--end holder-->



</div>
<!--end container-->

<!--start footer-->
<%@ include file="footer.jsp" %>
<!--end footer-->
<!-- Free template distributed by http://freehtml5templates.com -->   

</body>
<script language="javascript">
   
    $(document).ready(
            
    function (){
        $("#pikame").PikaChoose();
               
    });
</script>
</html>
