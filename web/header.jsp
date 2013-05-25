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
                        <li><a href="/2TI3_Cominotto_Robin_project2013/ManageServlet?home=home">Home</a></li>
                        <li><a href="/2TI3_Cominotto_Robin_project2013/ManageServlet?examen=regeling">Examenregeling</a></li>

                        <c:choose>
                            <c:when test="${sessionScope.ingelogd!=null}">
                                <li><a href="/2TI3_Cominotto_Robin_project2013/DocentServlet?docenten=overzicht">Docenten</a></li>
                                <li><a href="/2TI3_Cominotto_Robin_project2013/LokaalServlet?lokalen=overzicht">Lokalen</a></li>
                                <li><a href="/2TI3_Cominotto_Robin_project2013/VakServlet?vakken=regeling">Vakken</a></li>
                                <li>Ingelogd als ${sessionScope.ingelogd.voornaam} ${sessionScope.ingelogd.familienaam}</li>
                            </c:when>
                        </c:choose>




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