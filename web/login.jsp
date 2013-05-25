<%-- 
    Document   : index
    Created on : 23-apr-2013, 13:54:05
    Author     : robin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
            <!--end intro-->



            <!--start holder-->

            <div class="holder_content">

                <section class="group1">
                    <h3>Inloggen</h3>


                </section>
            </div>
            <!--end holder-->

            <!--start holder-->
            <div class="holder_content">

                <section class="group1">
                    <form action="LoginServlet">

                        <table>
                            <tr>
                                <td><label for="gebruikersnaam">gebruikersnaam:</label></td>
                                <td><input type="text" name="gebruikersnaam" value="" id="gebruikersnaam" size="30" class="login"  /></td>
                            </tr>
                            <tr>
                                <td><label for="wachtwoord">wachtwoord:</label></td>
                                <td><input type="password" name="wachtwoord" value="" id="wachtwoord" size="30" class="login"  /></td>
                            </tr>
                            <tr>
                                <td><input type="submit" name="inloggen" value="Log in" id = "inloggen" /></td>
                                <td></td>
                            </tr>
                        </table>


                    </form>
                </section>
            </div>

            <!--end holder-->



        </div>
        <!--end container-->
<%@ include file="footer.jsp" %>
       
        <!-- Free template distributed by http://freehtml5templates.com -->   
    </body></html>
