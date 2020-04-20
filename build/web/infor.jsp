<%-- 
    Document   : infor
    Created on : Nov 5, 2019, 9:24:58 PM
    Author     : thaoq
--%>

<%@page import="model.Photo"%>
<%@page import="model.User"%>
<%@page import="model.User_Photo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/favicon.png" type="image/png">
        <title>MeetMe Personal</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="information/css/bootstrap.css">
        <link rel="stylesheet" href="information/vendors/linericon/style.css">
        <link rel="stylesheet" href="information/css/font-awesome.min.css">
        <link rel="stylesheet" href="information/vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="information/vendors/lightbox/simpleLightbox.css">
        <link rel="stylesheet" href="information/vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="information/vendors/animate-css/animate.css">
        <link rel="stylesheet" href="information/vendors/popup/magnific-popup.css">
        <link rel="stylesheet" href="information/vendors/flaticon/flaticon.css">
        <!-- main css -->
        <link rel="stylesheet" href="information/css/style.css">
        <link rel="stylesheet" href="information/css/responsive.css">

        <%
            User_Photo up = (User_Photo) request.getAttribute("user_photo");
            User u = up.getUser();
            Photo p = up.getPhoto();
            boolean canEdit=(Boolean)request.getAttribute("canEdit");
        %>


    </head>
    <body>

        <!--================Header Menu Area =================-->
        <header class="header_area">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container box_1620">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="homepage"><img src="information/img/logo.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Collect the nav links, forms, and other content for toggling -->

                    </div>
                </nav>
            </div>
        </header>
        <!--================Header Menu Area =================-->

        <!--================Home Banner Area =================-->
        <section class="home_banner_area">
            <div class="container box_1620">
                <div class="banner_inner d-flex align-items-center">
                    <div class="banner_content">
                        <div class="media">
                            <div class="d-flex">
                                <% if(canEdit){
                                    
                                %>
                                <a href="uploadImg?pid=<%=p.getId()%>&uid=<%=u.getId()%>"><img src="images/<%=p.getPhotoName()%>"  alt=""/></a>
                                <%}else{%>
                                <img src="images/<%=p.getPhotoName()%>"  alt=""/>
                                <%}%>
                            </div>
                            <div class="media-body">
                                <div class="personal_text">
                                    <h6>Hello Everybody, i am</h6>
                                    <h3><%=u.getDisplayName()%></h3>
                                    <h4>Junior UI/UX Developer</h4>
                                    <p><%=p.getTitle()%></p>
                                    <ul class="list basic_info">
                                        <li><a href="#"><i title="Birthday" class="lnr lnr-calendar-full"></i><%=u.getDob()%> </a></li>
                                        <li><a href="#"><i title="Hobbie" class="lnr lnr-star-empty"></i><%=u.getHobbies()%></a></li>
                                    </ul>
                                    <ul class="list personal_social">
                                          <% if(canEdit){
                                    
                                %>
                                 <li><a title="Update information" href="update"><i class="fa fa"></i><img src="images/icons/update.png" alt=""/></a></li>
                                <%}%>
                                    </ul>

                                </div>
                                    
                                   

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="information/js/jquery-3.3.1.min.js"></script>
        <script src="information/js/popper.js"></script>
        <script src="information/js/bootstrap.min.js"></script>
        <script src="information/js/stellar.js"></script>
        <script src="information/vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="information/vendors/nice-select/js/jquery.nice-select.min.js"></script>
        <script src="information/vendors/isotope/imagesloaded.pkgd.min.js"></script>
        <script src="information/vendors/isotope/isotope.pkgd.min.js"></script>
        <script src="information/vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="information/vendors/popup/jquery.magnific-popup.min.js"></script>
        <script src="information/js/jquery.ajaxchimp.min.js"></script>
        <script src="information/vendors/counter-up/jquery.waypoints.min.js"></script>
        <script src="information/vendors/counter-up/jquery.counterup.min.js"></script>
        <script src="information/js/mail-script.js"></script>
        <script src="information/js/theme.js"></script>
    </body>
</html>
