<%-- 
    Document   : index
    Created on : 23-apr-2013, 13:54:05
    Author     : robin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        <li><a href="/2TI3_Cominotto_Robin_project2013/DocentServlet?docent=overzicht">Docenten</a></li>
                        <li><a href="/2TI3_Cominotto_Robin_project2013/LokaalServlet?lokalen=overzicht">Lokaal</a></li>
                        <li><a href="/2TI3_Cominotto_Robin_project2013/ManageServlet?docent=regeling">Vak</a></li>



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
                    <h3>Home</h3>


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
