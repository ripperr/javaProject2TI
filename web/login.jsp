<%-- 
    Document   : index
    Created on : 23-apr-2013, 13:54:05
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
                    <form action="DocentServlet">
                        <input type="submit" value="Registreren" name="docentToevoegen" id="registreren"/>
                    </form>
                </section>
            </div>

            <!--end holder-->



        </div>
        <!--end container-->
<%@ include file="footer.jsp" %>
       
        <!-- Free template distributed by http://freehtml5templates.com -->   
    </body></html>
