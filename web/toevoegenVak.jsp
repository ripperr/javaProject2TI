<%-- 
    Document   : toevoegen
    Created on : 09-mei-2013, 15:00
    Author     : robin
--%>

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
        <h3>Docent toevoegen</h3>


    </section>
</div>
<!--end holder-->

<!--start holder-->
<div class="holder_content">

    <section class="group1">
        <form action="VakServlet" id="myform">
            <table>
                <tr>
                    <th>Nummer: </th>
                    <td><input type="text" name="nummerVak" id="nummer" value="${vak.nummer}"/>

                </tr>
                <tr>
                    <th>Naam: </th>
                    <td> <input type="text" name="naamVak" id="naam" value="${vak.naam}"/>
                    </td>
                </tr>


                <tr>
                    <td></td>
                    <td><input type="submit" value="Vak toevoegen" name="vakToevoegenBevestigen" id="vakToevoegenBevestigen"/></td>
                </tr>
            </table>
            <input type="hidden" value="${vak.id}" name="vakId"/>
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
</body> <script language="javascript">
    $(document).ready(
    function (){
        $("#pikame").PikaChoose();
        $("#datum").datepicker({dateFormat:"dd/mm/yy"});
    });
    function validatieOK(){
        ok = true;
        if($("#nummer").val()==""){
            $("#nummer").addClass("ui-state-error");
            ok = false;
        }
        else{
            $("#nummer").removeClass("ui-state-error");
        }
        if($("#naam").val()==""){
            $("#naam").addClass("ui-state-error");
            ok = false;
        }
        else{
            $("#naam").removeClass("ui-state-error");
        }
        return ok;
        
    }
    $("#myform").submit(function (e){
        if(validatieOK()){
            return true;
        }
        else{
            e.preventDefault();
 
        }
    });
</script>
</html>
