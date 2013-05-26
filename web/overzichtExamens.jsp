<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!--end intro-->



<!--start holder-->

<div class="holder_content">

    <section class="group1">
        <h3>Overzicht examens ${titel}</h3>
        <div><p>Zoeken : 
            <form action="ManageServlet" method="get">
                <select name="zoeken" id="zoeken">
                    <option value="0">--Kies optie--</option>
                    <option value="1">Op datum</option>
                    <option value="2">Op docent</option>
                    <option value="3">Op vak</option>
                    <option value="4">Op computer lokaal</option>
                    <option value="5">Op gewoon lokaal</option>
                    <option value="6">Op soort</option>

                </select>
            </form>

            <span id="zoekenForms">

                <form class="searchForm" id="zoekenOpDatum" action="ManageServlet" method="get">
                    <input type="text" name="datum" id="datepicker" />
                    <input type="submit" name="zoeken" value="zoeken" id="datepickerSubmit"/>
                </form>

                <form class="searchForm" id="zoekenOpDocent" action="ManageServlet" method="get">
                    <select name="docent" id="docent">
                        <c:forEach var="docent" items="${sessionScope.docenten}" >
                            <option value="${docent.id}">${docent.voornaam} ${docent.familienaam}</option>


                        </c:forEach>
                    </select>
                    <input type="submit" name="zoeken" value="zoeken"/>
                </form>

                <form class="searchForm" id="zoekenOpVak" action="ManageServlet" method="get">
                    <select name="vak" id="vak">
                        <c:forEach var="vak" items="${sessionScope.vakken}" >
                            <option value="${vak.id}">${vak.nummer} ${vak.naam}</option>


                        </c:forEach>
                    </select>
                    <input type="submit" name="zoeken" value="zoeken"/>
                </form>

                <form class="searchForm" id="zoekenOpComputerLokaal" action="ManageServlet" method="get">
                    <select name="lokaal" id="lokaal">
                        <c:forEach var="computerLokaal" items="${sessionScope.computerLokalen}" >
                            <option value="${computerLokaal.id}">${computerLokaal.nummer}</option>


                        </c:forEach>
                    </select>
                    <input type="submit" name="zoeken" value="zoeken"/>
                </form>

                <form class="searchForm" id="zoekenOpGewoonLokaal" action="ManageServlet" method="get">
                    <select name="lokaal" id="lokaal">
                        <c:forEach var="gewoonLokaal" items="${sessionScope.gewoonLokalen}" >
                            <option value="${gewoonLokaal.id}">${gewoonLokaal.nummer}</option>


                        </c:forEach>
                    </select>
                    <input type="submit" name="zoeken" value="zoeken"/>
                </form>

                <form class="searchForm" id="zoekenOpSoort" action="ManageServlet" method="get">
                    <select name="soort" id="soort">
                        <c:forEach var="soort" items="${sessionScope.soorten}" >
                            <option value="${soort}">${soort}</option>


                        </c:forEach>
                    </select>
                    <input type="submit" name="zoeken" value="zoeken"/>
                </form>
            </span>
            </p>
        </div>
        <c:choose>
            <c:when test="${sessionScope.ingelogd!=null}">
                <table>
                    <form id="toevoegen" id="toevoegen" action="ManageServlet" method="get">
                        <tr>
                            <td><input type="submit" value="Examen toevoegen" name="toevoegenExamen"/></td>
                        </tr>
                    </form>

                </table>
            </c:when>
        </c:choose>
        <table border="1">
            <tr>
                <th>Vaknaam: </th>
                <th>Docent: </th>
                <th>Datum: </th>
                <th>Lokaal: </th>
                <th>Soort examen:</th>
            </tr>
            <c:forEach var="examen" items="${examens}" >

                <tr>
                    <td>${examen.vak.naam}</td>

                    <td>${examen.docent.voornaam} ${examen.docent.familienaam}</td>

                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${examen.datum.time}" type="date" /></td>

                    <td>${examen.lokaal.nummer}</td>

                    <td>${examen.soort}</td>
                    <c:choose>
                        <c:when test="${sessionScope.ingelogd!=null}">
                            <td><a href="ManageServlet?wijzigenExamen=${examen.id}"><img src="images/edit.png" width="25" height="20"/></a></td>
                            <td><a onclick="return confirm('Ben je zeker dat je dit examen wil deleten?')" href="ManageServlet?deleteExamen=${examen.id}"><img src="images/delete.png" width="25" height="20"/></a></td>
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

<%@ include file="footer.jsp" %>
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
            if(validatieOK()){
                return true;
            }
            else{
                e.preventDefault();
 
            } 
        });
    });
    $(document).ready(
            
    function (){
        $("#pikame").PikaChoose();
        $(".searchForm").hide();
        $( "#zoeken").change(function(){
            $(".searchForm").hide();    

            x=$(this).val();
            switch(x)
            {
                case '1':
                    $("#zoekenOpDatum").show();
                    $("#datepicker").datepicker({dateFormat: "dd/mm/yy"});
                            
                    break;
                case '2':
                    $("#zoekenOpDocent").show();
                    break;
                case '3':
                    $("#zoekenOpVak").show();
                    break;
                case '4':
                    $("#zoekenOpComputerLokaal").show();
                    break;
                case '5':
                    $("#zoekenOpGewoonLokaal").show();
                    break;
                case '6':
                    $("#zoekenOpSoort").show();
                    break;
            }
                   
        }
                  
       
    ); });
</script>
</html>
