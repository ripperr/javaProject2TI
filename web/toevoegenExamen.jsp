<%-- 
    Document   : toevoegen
    Created on : 09-mei-2013, 15:00
    Author     : robin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thomas More Examenregeling - Toevoegen</title>
        <link rel="icon" href="images/favicon.gif" type="image/x-icon"/>
        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
         <![endif]-->

        <link rel="shortcut icon" href="images/favicon.gif" type="image/x-icon"/> 
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link type="text/css" href="css/css3.css" rel="stylesheet" />
        <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-lightness/jquery-ui.css" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/jquery.pikachoose.js"></script>
        <script language="javascript">
            $(document).ready(
            function (){
                $("#pikame").PikaChoose();
                $("#datum").datepicker({dateFormat:"dd/mm/yy"});
            });
        </script>



    </head>
    <body>

        <!--start container-->
        <div id="container">

            <!--start header-->

            <header>

                <!--start logo-->


                <!--end logo-->

                <!--start menu-->

                <nav>
                    <ul>
                        <li><a href="/2TI3_Cominotto_Robin_project2013/ManageServlet?home=home" class="current">Home</a>

                        </li>
                        <li><a href="/2TI3_Cominotto_Robin_project2013/ManageServlet?examen=regeling">Examenregeling</a></li>


                    </ul>
                </nav>
                <!--end menu-->


                <!--end header-->
            </header>


            <!--start intro-->

            <div id="intro">


                <header class="group_bannner_left">
                    <hgroup>
                        <h1>Examenregeling </h1>
                        <h2>“Robin Cominotto 2TI3k“ 
                        </h2>
                    </hgroup>
                </header>
            </div>
            <!--end intro-->



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
                    <form action="ManageServlet">
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
                                <td><form action="ManageServlet">
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
                                <td><input type="submit" value="Examen toevoegen" name="toevoegenExamenBevestigen"/></td>
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
        <footer>
            <div class="container">  
                <div id="FooterTwo"> © 2013 Robin Cominotto 2TI3k </div>
                <div id="FooterTree"> Valid html5, design and code by <a href="http://www.marijazaric.com">marija zaric - creative simplicity</a>   </div> 
            </div>
        </footer>
        <!--end footer-->
        <!-- Free template distributed by http://freehtml5templates.com -->   
    </body></html>
