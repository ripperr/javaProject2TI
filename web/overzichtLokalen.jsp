<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


            <!--start holder-->

            <div class="holder_content">

                <section class="group1">
                    <h3>Overzicht lokalen ${titel}</h3>

                    <table>
                        <form id="toevoegen" id="toevoegen" action="LokaalServlet" method="get">
                            <tr>
                                <td><input type="submit" value="Lokaal toevoegen" name="toevoegenLokaal"/></td>
                            </tr>
                        </form>

                    </table>
                    <table border="1">
                        <tr>
                            <th>Nummer: </th>
                            <th>AantalPlaatsen: </th>
                            <th>Soort: </th>
                            <th>Whiteboard: </th>
                            <th>Laptop: </th>
                            <th>Info: </th>
                        </tr>
                        <c:forEach var="lokaal" items="${lokalen}" >

                            <tr>
                                <td>${lokaal.nummer}</td>

                                <td>${lokaal.aantalPlaatsen}</td>
                                <c:choose>
                                    <c:when test="${lokaal.class.simpleName eq 'GewoonLokaal'}">
                                        <td>Gewoon Lokaal</td>
                                        <td>${lokaal.isWhiteBoard() ? 'Aanwezig':'Niet Aanwezig'}</td>
                                        <td>Niet van toepassing</td>
                                        <td>Niet van toepassing</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>Computer Lokaal</td>
                                        <td>Niet van toepassing</td>
                                        <td>${lokaal.isLaptop() ? 'Laptop vereist':'Laptop niet vereist'}</td>
                                        <td>${lokaal.info}</td>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>


                                    <c:when test="${sessionScope.ingelogd!=null}">
                                        <td><a href="LokaalServlet?wijzigenLokaal=${lokaal.id}"><img src="images/edit.png" width="25" height="20"/></a></td>
                                        <td><a onclick="return confirm('Ben je zeker dat je dit lokaal wil deleten?')" href="LokaalServlet?deleteLokaal=${lokaal.id}"><img src="images/delete.png" width="25" height="20"/></a></td>
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
            function validatieOK(){
                ok = true;
                var timestamp = Date.parse($("input[name='datum']").val()) 

                if (!isNaN(timestamp) == false) { 
                    $("#datepicker").addClass("ui-state-error");
                    ok = false;
                } 
                else{
                    $("#datepicker").removeClass("ui-state-error");
                }
                return ok;
            }
            $(function()
            {
                
                $("#datepickerSubmit").click(function(e){
                    e.preventDefault();
                    if(validatieOK()){
                        $("#zoekenOpDatum").submit();
                    }
                });
            });
            $(document).ready(
            
            function (){
                $("#pikame").PikaChoose();
               
            });
        </script>
</html>
