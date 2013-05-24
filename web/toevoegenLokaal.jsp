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
            function(){
                $("#pikame").PikaChoose();
                    $("#datum").datepicker({dateFormat:"dd/mm/yy"});
                    $(".printenGewoonLokaal").hide();
                    $(".printenComputerLokaal").hide();   
                $("input[name='soortLokaal']:radio").click(
                function()
                {
                    if($('.soortLokaal:checked').val()=='GewoonLokaal'){
                        $(".printenComputerLokaal").hide();

                        $(".printenGewoonLokaal").show();

                    }
                    else{
                        $(".printenComputerLokaal").show();

                        $(".printenGewoonLokaal").hide();
                    }
                    
                });
                
            }
        );
             
          
        
            
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
            <tr>

            <section class="group1">
                <form action="LokaalServlet">
                    <table>
                        <tr>
                            <th>Nummer: </th>
                            <td> <input type="text" name="nummer" id="nummer" value="${lokaal.nummer}" /></td>

                        </tr>
                        <tr>
                            <th>Aantal plaatsen: </th>
                            <td><input type="text" name="aantalPlaatsen" id="aantalPlaatsen" value="${lokaal.aantalPlaatsen}" /></td>
                        </tr>

                        <tr>
                            <th>Type: </th>

                            <td>

                                <c:forEach var="lokaalType" items="${lokaalTypes}" >
                                    <c:choose>
                                        <c:when test="${lokaalType eq lokaal.class.simpleName}">
                                            <input type="radio" name="soortLokaal"  class="soortLokaal" value="${lokaalType}" selected="selected">
                                            ${lokaalType}
                                        </c:when>
                                        <c:otherwise>
                                            <input type="radio" name="soortLokaal"  class="soortLokaal" value="${lokaalType}" />
                                            ${lokaalType}
                                        </c:otherwise>

                                    </c:choose>
                                </c:forEach>
                            </td>
                        </tr>
                        <tr class="printenGewoonLokaal">

                            <th>Whiteboard aanwezig</th>
                            <td>
                                <select name="whiteboard" id="whiteboard">
                                    <c:choose>
                                        <c:when test ="${lokaal.class.simpleName eq 'GewoonLokaal'}">
                                            <c:when test="${lokaal.isWhiteBoard()}">
                                                <option value="0">Nee</option>
                                                <option value="1" selected="selected">Ja</option>

                                            </c:when>
                                            <c:otherwise>
                                                <option value="0" selected="selected">Nee</option>
                                                <option value="1">Ja</option>
                                            </c:otherwise>

                                        </c:when>
                                        <c:otherwise>
                                            <option value="0">Nee</option>
                                            <option value="1" >Ja</option>

                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </td>


                        </tr>
                        <tr class="printenComputerLokaal">

                            <th>Laptop aanwezig</th>
                            <td>
                                <select name="laptop" id="laptop">
                                    <c:choose>
                                        <c:when test ="${lokaal.class.simpleName eq 'ComputerLokaal'}">
                                            <c:when test="${lokaal.Islaptop()}">
                                                <option value="0">Niet aanwezig</option>
                                                <option value="1" selected="selected">Aanwezig</option>

                                            </c:when>
                                            <c:otherwise>
                                                <option value="0" selected="selected">Niet aanwezig</option>
                                                <option value="1">Aanwezig</option>
                                            </c:otherwise>

                                        </c:when>
                                        <c:otherwise>
                                            <option value="0">Niet aanwezig</option>
                                            <option value="1">Aanwezig</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                        </tr>
                        <tr class="printenComputerLokaal">
                            <th>Info</th>
                            <td>
                                <c:choose>
                                    <c:when test ="${lokaal.class.simpleName eq 'ComputerLokaal'}">
                                        <input type="text" name="info" value="${lokaal.info}" id="info"/>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" name="info" id="info"/>

                                    </c:otherwise>
                                </c:choose>
                            </td>

                        </tr>




                    </table>

            </section>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Lokaal toevoegen" name="toevoegenLokaalBevestigen"/></td>
        </tr>
    </table>
    <input type="hidden" value="${lokaal.id}" name="lokaalId"/>
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
