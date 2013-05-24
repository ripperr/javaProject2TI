<%@page import="info.toegepaste.www.entity.GewoonLokaal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thomas More Examenregeling - Home</title>
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
        <footer>
            <div class="container">  
                <div id="FooterTwo"> © 2013 Robin Cominotto 2TI3k </div>
                <div id="FooterTree"> Valid html5, design and code by <a href="http://www.marijazaric.com">marija zaric - creative simplicity</a>   </div> 
            </div>
        </footer>
        <!--end footer-->
        <!-- Free template distributed by http://freehtml5templates.com -->   
    </body></html>
