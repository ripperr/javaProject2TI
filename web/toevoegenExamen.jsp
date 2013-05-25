<%-- 
    Document   : toevoegen
    Created on : 09-mei-2013, 15:00
    Author     : robin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
            <!--start holder-->

            <div class="holder_content">

                <section class="group1">
                    <h3>Examen toevoegen</h3>


                </section>
            </div>
            <!--end holder-->

            <!--start holder-->
            <div class="holder_content">

                <section class="group1">
                    <form action="ManageServlet" id="myform">
                        <table>
                            <tr>
                                <th>Docent: </th>
                                <td><select name="docentExamen" id="docent">
                                        <c:forEach var="docent" items="${sessionScope.docenten}" >
                                            <c:choose>
                                                <c:when test="${docent.id != examen.docent.id}">
                                                    <option value="${docent.id}">${docent.voornaam} ${docent.familienaam}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${docent.id}" selected="selected">${docent.voornaam} ${docent.familienaam}</option>

                                                </c:otherwise>
                                            </c:choose>


                                        </c:forEach>
                                    </select></td>
                                <td><form action="DocentServlet">
                                        <input type="submit" value="Nieuwe docent toevoegen" name="docentToevoegen"/>
                                    </form></td>
                            </tr>
                            <tr>
                                <th>Vak: </th>
                                <td> <select name="vakExamen" id="vak">
                                        <c:forEach var="vak" items="${sessionScope.vakken}" >
                                            <c:choose>
                                                <c:when test="${vak.id != examen.vak.id}">
                                                    <option value="${vak.id}">${vak.nummer} ${vak.naam}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${vak.id}" selected="selected">${vak.nummer} ${vak.naam}</option>

                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select></td>
                            </tr>
                            <tr>
                               
                                <th>Datum: </th>
                                <td><input type="text" name="datumExamen" id="datum" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${examen.datum.time}" type="date" />"/></td>
                            </tr>
                            <tr>
                                <th>Lokaal: </th>
                                <td>
                                    <select name="lokaalExamen" id="lokaal">
                                        <c:forEach var="lokaal" items="${lokalen}" >
                                            <c:choose>
                                                <c:when test="${lokaal.id != examen.lokaal.id}">
                                                    <option value="${lokaal.id}">${lokaal.nummer}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${lokaal.id}" selected="selected">${lokaal.nummer}</option>

                                                </c:otherwise>

                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Soort examen: </th>
                                <td>
                                    <select name="soortExamen" id="soort">
                                        <c:forEach var="soort" items="${sessionScope.soorten}" >
                                            
                                                <c:choose>
                                                    <c:when test="${soort != examen.soort}">
                                                        <option value="${soort}">${soort}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${soort}" selected="selected">${soort}</option>


                                                    </c:otherwise>

                                                </c:choose>
                                            



                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Examen toevoegen" name="toevoegenExamenBevestigen" id="toevoegenExamenBevestigen"/></td>
                            </tr>
                        </table>
                            <input type="hidden" value="${examen.id}" name="examenId"/>
                    </form>
                </section>
            </div>

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
                $("#datum").datepicker({dateFormat:"dd/mm/yy"});
            });
            function validatieOK(){
                ok = true;
                if($("#datum").val()==""){
                    $("#datum").addClass("ui-state-error");
                    ok = false;
                }
                else{
                    $("#datum").removeClass("ui-state-error");
                }
                return ok;
            }
             $("myform").submit(function (e){
               e.preventDefault();
               if(validatieOK()){
                   $("myform").submit();
               }
            });
        </script>
</html>
