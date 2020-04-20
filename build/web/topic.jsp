<%-- 
    Document   : topic
    Created on : Nov 12, 2019, 8:55:25 PM
    Author     : thaoq
--%>

<%@page import="model.Toppic"%>
<%@page import="model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Photomedia</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="homepage/css/bootstrap.min.css">
    <link rel="stylesheet" href="homepage/css/owl.carousel.min.css">
    <link rel="stylesheet" href="homepage/css/magnific-popup.css">
    <link rel="stylesheet" href="homepage/css/font-awesome.min.css">
    <link rel="stylesheet" href="homepage/css/themify-icons.css">
    <link rel="stylesheet" href="homepage/css/nice-select.css">
    <link rel="stylesheet" href="homepage/css/flaticon.css">
    <link rel="stylesheet" href="homepage/css/animate.css">
    <link rel="stylesheet" href="homepage/css/slicknav.css">
    <link rel="stylesheet" href="homepage/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    
    <%
            User account = (User) session.getAttribute("user");
            ArrayList<Post> listPost = (ArrayList<Post>) request.getAttribute("listPostByTopic");
            ArrayList<Toppic> listToppic = (ArrayList<Toppic>) request.getAttribute("listTopic");
    %>
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <header>
            <div class="header-area ">
                <div class="header_top">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-4 col-md-4 d-none d-md-block">
                                <div class="header_links ">
                                    <ul>
                                        <li><a href="#"> <i class="fa fa-facebook"></i> </a></li>
                                        <li><a class="twiter" href="#"> <i class="fa fa-twitter"></i> </a></li>
                                        <li><a class="insta" href="#"> <i class="fa fa-instagram"></i> </a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xl-4 col-md-4">
                                <div class="logo">
                                    <a href="homepage">
                                        <img src="homepage/img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>

                            <%if (account != null) {%>
                            <div class="col-xl-4 col-md-4 d-none d-md-block">
                                <div class="login_resiter">
                                    <p><a href="info?uid=<%=account.getId()%>"><i class="flaticon-user"></i><%=account.getDisplayName()%></a> | <a href="logout">Logout</a></p>
                                </div>
                            </div>
                            <% } else {%>
                            <div class="col-xl-4 col-md-4 d-none d-md-block">
                                <div class="login_resiter">
                                    <p><a href="login"><i class="flaticon-user"></i>login</a> | <a href="register">Resister</a></p>
                                </div>
                            </div>
                            <% }
                            %>


                        </div>
                    </div>
                </div>
                <div id="sticky-header" class="main-header-area white-bg">
                    <div class="container">
                        <!--                        <div class="row align-items-center">
                                                    <div class="col-xl-7 col-lg-7">
                                                        <div class="main-menu  d-none d-lg-block">
                                                            <nav>
                                                                <ul id="navigation">
                                                                                                                <li><a class="active" href="index.html">Home</a></li>
                                                                                                                <li><a href="category.html">catagory</a></li>
                                                                                                                <li><a href="about.html">About</a></li>
                                                                                                                <li><a href="#">pages <i class="ti-angle-down"></i></a>
                                                                                                                    <ul class="submenu">
                                                                                                                        <li><a href="elements.html">elements</a></li>
                                                                                                                        <li><a href="single-blog.html">single-blog</a></li>
                                                                                                                    </ul>
                                                                                                                </li>
                                                                                                                <li><a href="contact.html">Contact</a></li>
                                                                </ul>
                                                            </nav>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-5 col-lg-5">
                                                        <div class="get_serch">
                                                            <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="col-10">
                                                        <div class="mobile_menu d-block d-lg-none"></div>
                                                    </div>
                                                </div>-->

                        <div>

<!--                            <div  class="search_input" id="search_input_box">
                                <div class="container ">
                                    <div class="col-2"></div>
                                    <form class="d-flex justify-content-between search-inner col-10">
                                        <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                                        <button type="submit" class="btn"></button>
                                        <span class="ti-close" id="close_search" title="Close Search"></span>
                                    </form>
                                </div>
                            </div>-->
                        </div>
                    </div>>
                </div>
            </div>
        </header>
    <!-- header-end -->

    <!-- photography_slider_area_start -->
    <div class="photography_slider_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="photoslider_active owl-carousel">

                        <%for (Toppic t : listToppic) {%>
                        <a href="topic?tid=<%=t.getTid()%>">
                        <div style="width: 280px; height: 150px" class="single_photography">
                            <img src="images/<%=t.getImg()%>" alt="">
                            <div class="photo_title">
                                <h4><%=t.getName()%></h4>
                                
                            </div>
                        </div>
                                </a>

                        <%  }
                        %>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- photography_slider_area_end -->

    <!-- most_recent_blog_start -->
    <div class="most_recent_blog">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title mb-33">
                        <h3>Most Recent</h3>
                    </div>
                </div>
                <div class="col-xl-8 col-md-8">
                    <div class="row">

                        <%if (listPost != null) {
                                if (listPost.size() > 8) {
                                    for (int i = listPost.size() - 1; i >= listPost.size() - 8; i--) {%>
                                        <div class="col-xl-6 col-md-6">
                                            <div class="single_blog">
                                                <div class="blog_thumb">
                                                    <a href="post?pid=<%=listPost.get(i).getPid()%>">
                                                        <img src="images/<%=listPost.get(i).getImg()%>" alt="">
                                                    </a>

                                                </div>
                                                <div class="blog_meta">
                                                    <p><a href="post?pid=<%=listPost.get(i).getPid()%>"><%=listPost.get(i).getPostingDate()%></a></p>
                                                    <h3><a href="post?pid=<%=listPost.get(i).getPid()%>">
                                                            <%=listPost.get(i).getTitle()%>
                                                        </a></h3>
                                                </div>
                                            </div>
                                        </div>
                        <%         }
                                } 
                                else {
                                    for (int i = listPost.size() - 1; i >= 0; i--) {%>
                                        <div class="col-xl-6 col-md-6">
                                            <div class="single_blog">
                                                <div class="blog_thumb">
                                                    <a href="post?pid=<%=listPost.get(i).getPid()%>">
                                                        <img src="images/<%=listPost.get(i).getImg()%>" alt="">
                                                    </a>

                                                </div>
                                                <div class="blog_meta">
                                                    <p><a href="post?pid=<%=listPost.get(i).getPid()%>"><%=listPost.get(i).getPostingDate()%></a></p>
                                                    <h3><a href="post?pid=<%=listPost.get(i).getPid()%>">
                                                            <%=listPost.get(i).getTitle()%>
                                                        </a></h3>
                                                </div>
                                            </div>
                                        </div>
                        <%        }
                               }
                           }
                        %>


<!--                        <div class="col-xl-12">
                            <div class="btn_area text-center">
                                <a href="#" class="boxed-btn">Load More</a>
                            </div>
                        </div>-->
                    </div>
                </div>
                <div class="col-xl-4 col-md-4">
                    <div class="blog_right_side">
                        <div class="section_title mb-33">
                            <h3>Follow Us</h3>
                        </div>
                        <div class="foollow_links">
                            <ul class="d-flex align-items-center justify-content-between">
                                <li>
                                    <a href="#">
                                        <i class="fa fa-facebook"></i>
                                        <h2>142K</h2>
                                        <p>followers</p>
                                    </a>
                                </li>
                                <li>
                                    <a class="insta" href="#">
                                        <i class="fa fa-instagram"></i>
                                        <h2>142K</h2>
                                        <p>followers</p>
                                    </a>
                                </li>
                                <li>
                                    <a class="twitter" href="#">
                                        <i class="fa fa-twitter"></i>
                                        <h2>142K</h2>
                                        <p>followers</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="add_here text-center">
                            <a href="#">
                                    <img src="img/most_recent/googleAdd2.jpg" alt="">
                            </a>
                        </div>
                        <div class="section_title mb-33">
                            <h3>Tags</h3>
                        </div>
                        <div class="tags">
                            <ul>
                                <%for (Toppic t : listToppic) {%>
                                <li><a href="topic?tid=<%=t.getTid()%>"><%=t.getName() %></a></li>
                                   <% }
                                %>
                                
                               
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </div>
    <!-- most_recent_blog_end -->


    <!-- footer_start -->
    <footer class="footer">
        <div class="footer_area">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="footer_info text-center">
                            <div class="footer_logo text-center">
                                <a href="#">
                                    <img src="img/footer-logo.png" alt="">
                                </a>
                            </div>
                            <p class="footer_text">
                                Explore photo media blog to enrich your photography knowledge
                            </p>
                         
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
            <div class="copyright_text text-center">
                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            </div>
        </div>
    </footer>
    <!-- footer_end -->


    <!-- JS here -->
    <script src="homepage/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="homepage/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="homepage/js/popper.min.js"></script>
    <script src="homepage/js/bootstrap.min.js"></script>
    <script src="homepage/js/owl.carousel.min.js"></script>
    <script src="homepage/js/isotope.pkgd.min.js"></script>
    <script src="homepage/js/ajax-form.js"></script>
    <script src="homepage/js/waypoints.min.js"></script>
    <script src="homepage/js/jquery.counterup.min.js"></script>
    <script src="homepage/js/imagesloaded.pkgd.min.js"></script>
    <script src="homepage/js/scrollIt.js"></script>
    <script src="homepage/js/jquery.scrollUp.min.js"></script>
    <script src="homepage/js/wow.min.js"></script>
    <script src="homepage/js/nice-select.min.js"></script>
    <script src="homepage/js/jquery.slicknav.min.js"></script>
    <script src="homepage/js/jquery.magnific-popup.min.js"></script>
    <script src="homepage/js/plugins.js"></script>

    <!--contact js-->
    <script src="homepage/js/contact.js"></script>
    <script src="homepage/js/jquery.ajaxchimp.min.js"></script>
    <script src="homepage/js/jquery.form.js"></script>
    <script src="homepage/js/jquery.validate.min.js"></script>
    <script src="homepage/js/mail-script.js"></script>

    <script src="homepage/js/main.js"></script>

</body>

</html>
