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
                    <h3>Docent toevoegen</h3>


                </section>
            </div>
            <!--end holder-->

            <!--start holder-->
            <div class="holder_content">

                <section class="group1">
                    <form action="ManageServlet">
                        <table>
                            <tr>
                                <th>Voornaam: </th>
                                <td><input type="text" name="voornaamDocent" id="voornaam"/>
                                    
                            </tr>
                            <tr>
                                <th>Familienaam: </th>
                                <td> <input type="text" name="familienaamDocent" id="familienaam"/>
                                    </td>
                            </tr>
                            <tr>
                                <th>Email: </th>
                                <td><input type="text" name="emailDocent" id="email"/></td>
                            </tr>
                            <tr>
                                <th>Nummer: </th>
                                <td>
                                    <input type="text" name="nummerDocent" id="nummer"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Docent toevoegen" name="docentToevoegenBevestigen"/></td>
                            </tr>
                        </table>
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
        </script>
</html>
