<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<!--start holder-->

<div class="holder_content">

    <section class="group1">
        <h3>Overzicht docenten ${titel}</h3>

        <table>
            <form id="toevoegen" id="toevoegen" action="DocentServlet" method="get">
                <tr>
                    <td><input type="submit" value="Docent toevoegen" name="toevoegenDocent"/></td>
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
