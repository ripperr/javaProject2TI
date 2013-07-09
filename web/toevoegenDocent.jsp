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
        <form action="DocentServlet" id="myform" name="myform">
            <table>
                <tr>
                    <th>Voornaam: </th>
                    <td><input type="text" name="voornaamDocent" id="voornaam" value="${docent.voornaam}"/>

                </tr>
                <tr>
                    <th>Familienaam: </th>
                    <td> <input type="text" name="familienaamDocent" id="familienaam" value="${docent.familienaam}"/>
                    </td>
                </tr>
                <tr>
                    <th>Email: </th>
                    <td><input type="text" name="emailDocent" id="email" value="${docent.email}"/></td>
                </tr>
                <tr>
                    <th>Nummer: </th>
                    <td>
                        <input type="text" name="nummerDocent" id="nummer" value="${docent.nummer}"/>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td><input type="submit" value="Docent toevoegen" name="docentToevoegenBevestigen" id="docentToevoegenBevestigen"/></td>
                </tr>
            </table>
            <input type="hidden" value="${docent.id}" name="docentId"/>
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
<script language="javascript">
    $(document).ready(
    function (){
        $("#pikame").PikaChoose();
        $("#datum").datepicker({dateFormat:"dd/mm/yy"});
    });
    function validatieOK(){
        var ok = true;
        if($("#nummer").val()==""){
            $("#nummer").addClass("ui-state-error");
            ok = false;
        }
        else{
            $("#nummer").removeClass("ui-state-error");
        }
        if($("#voornaam").val()==""){
            $("#voornaam").addClass("ui-state-error");
            ok = false;
        }
        else{
            $("#voornaam").removeClass("ui-state-error");
        }
        if($("#familienaam").val()==""){
            $("#familienaam").addClass("ui-state-error");
            ok = false;
        }
        else{
            $("#familienaam").removeClass("ui-state-error");
        }
        if($("#email").val()==""){
            $("#email").addClass("ui-state-error");
            ok = false;
        }
        else{
            $("#email").removeClass("ui-state-error");
        }
        return ok;
    }
    $("#myform").on('submit',function (e){
        if(validatieOK()){
            return true;
        }
        else{
            e.preventDefault();
 
        }
              
    });
</script>
</body> 
</html>
