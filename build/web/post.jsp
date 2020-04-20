<%-- 
    Document   : post
    Created on : Nov 10, 2019, 11:44:48 AM
    Author     : thaoq
--%>

<%@page import="model.Like"%>
<%@page import="model.Toppic"%>
<%@page import="model.User"%>
<%@page import="model.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Post"%>
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
        <link rel="shortcut icon" type="image/x-icon" href="homepage/img/favicon.png">
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
            Post p = (Post) request.getAttribute("post");
            ArrayList<Comment> listCmt = (ArrayList<Comment>) request.getAttribute("listCmt");
            ArrayList<Like> listLike = (ArrayList<Like>) request.getAttribute("listLike");
            User u = (User) request.getAttribute("user");
            User account = (User) session.getAttribute("user");
            ArrayList<Toppic> listToppic = (ArrayList<Toppic>) request.getAttribute("listToppic");
            ArrayList<Post> listPost = (ArrayList<Post>) request.getAttribute("listPost");
            String name = (String) request.getAttribute("username");
            boolean checkLike = (Boolean) request.getAttribute("checkLike");

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
                                <!--                             <div class="header_links ">
                                                                 <ul>
                                                                     <li><a href="#"> <i class="fa fa-facebook"></i> </a></li>
                                                                     <li><a class="twiter" href="#"> <i class="fa fa-twitter"></i> </a></li>
                                                                     <li><a class="insta" href="#"> <i class="fa fa-instagram"></i> </a></li>
                                                                 </ul>
                                                             </div>-->
                            </div>
                            <div class="col-xl-4 col-md-4">
                                <div class="logo">
                                    <a href="homepage">
                                        <img src="homepage/img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-4 col-md-4 d-none d-md-block">
                                <div class="login_resiter">
                                    <p><a href="info?uid=<%=account.getId()%>"><i class="flaticon-user"></i><%=account.getDisplayName()%></a> | <a href="logout">Logout</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header-end -->



        <!--================Blog Area =================-->
        <section class="blog_area single-post-area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 posts-list">
                        <div class="single-post">
                            <div class="feature-img">
                                <img class="img-fluid" src="images/<%=p.getImg()%>" alt="">
                            </div>
                            <div class="blog_details">
                                <h2>
                                    <%=p.getTitle()%>
                                </h2>

                                <p class="excert">
                                    <%=p.getText()%><br>
                                <ul class="blog-info-link mt-3 mb-4">
                                    <li><a href="info?uid=<%=p.getUid()%>"><i class="fa fa-user"></i> <%=name%></a></li>
                                </ul>
                                </p>

                                <!--                     <div class="quote-wrapper">
                                                        <div class="quotes">
                                                           MCSE boot camps have its supporters and its detractors. Some people do not understand why you
                                                           
                                                        </div>
                                                     </div>-->

                            </div>
                        </div>


                        <div class="comments-area">
                            <%
                                if(!checkLike){
                            %>
                            <form class="form-contact comment_form" action="like" id="commentForm" method="GET">
                                <input type="hidden" name="pid" value="<%=p.getPid()%>" />
                                <div class="form-group">
                                    <button name="submit" type="submit" class="button button-contactForm btn_1 boxed-btn">Like</button>
                                </div>
                            </form>
                            <%}else{%>
                             <form class="form-contact comment_form" action="like" id="commentForm" method="POST">
                                 <input type="hidden" name="pid" value="<%=p.getPid()%>" />
                                <div class="form-group">
                                    <button name="submit" type="submit" class="button button-contactForm btn_1 boxed-btn">DisLike</button>
                                </div>
                            </form>
                            <%}%>
                            <h4><%=listLike.size()%> Likes</h4>
                            <h4><%=listCmt.size()%> Comments</h4>

                            <%for (Comment c : listCmt) {%>

                            <div class="comment-list">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="homepage/img/comment/comment_1.png" alt="">
                                        </div>
                                        <div class="desc">
                                            <p class="comment">
                                                <%=c.getText()%>
                                            </p>
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <h5>
                                                        <a href="info?uid=<%=p.getUid()%>"><%=account.getDisplayName()%></a>
                                                    </h5>
                                                    <p class="date"><%=c.getCommentTime()%> </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <% }
                            %>



                        </div>


                        <div class="comment-form">
                            <h4>Leave a Reply</h4>
                            <form class="form-contact comment_form" action="comment" id="commentForm">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9"
                                                      placeholder="Write Comment"></textarea>
                                            <input type="hidden" name="pid" value="<%=p.getPid()%>" />
                                        </div>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <button name="submit" type="submit" class="button button-contactForm btn_1 boxed-btn">Post Comment</button>
                                </div>
                            </form>
                        </div>
                    </div>




                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <!--                  <aside class="single_sidebar_widget search_widget">
                                                 <form action="#">
                                                    <div class="form-group">
                                                       <div class="input-group mb-3">
                                                          <input type="text" class="form-control" placeholder='Search Keyword'
                                                             onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'">
                                                          <div class="input-group-append">
                                                             <button class="btn" type="button"><i class="ti-search"></i></button>
                                                          </div>
                                                       </div>
                                                    </div>
                                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                                       type="submit">Search</button>
                                                 </form>
                                              </aside>-->

                            <aside class="single_sidebar_widget popular_post_widget">
                                <h3 class="widget_title">Recent Post</h3>

                                <%if (listPost.size() > 6) {
                             for (int i = listPost.size() - 1; i > listPost.size() - 6; i--) {%>
                                <div class="media post_item">
                                    <img style="width: 80px; height: 80px;" src="images/<%=listPost.get(i).getImg()%>" alt="post">
                                    <div class="media-body">
                                        <a href="post?pid=<%=listPost.get(i).getPid()%>">
                                            <h3><%=listPost.get(i).getTitle()%></h3>
                                        </a>
                                        <p><%=listPost.get(i).getPostingDate()%></p>
                                    </div>
                                </div>
                                <%           }
                      } else {
                          for (int i = listPost.size() - 1; i > 0; i--) {%>
                                <div class="media post_item">
                                    <img style="width: 80px; height: 80px;" src="images/<%=listPost.get(i).getImg()%>" alt="post">
                                    <div class="media-body">
                                        <a href="post?pid=<%=listPost.get(i).getPid()%>">
                                            <h3><%=listPost.get(i).getTitle()%></h3>
                                        </a>
                                        <p><%=listPost.get(i).getPostingDate()%></p>
                                    </div>
                                </div>
                                <%     }
                                    }
                                %>





                            </aside>
                            <aside class="single_sidebar_widget tag_cloud_widget">
                                <h4 class="widget_title">Tag Clouds</h4>
                                <ul class="list">


                                    <li>
                                        <%for (Toppic t : listToppic) {%>

                                        <a href="topic?tid=<%=t.getTid()%>"><%=t.getName()%></a>

                                        <%  }
                                        %>


                                    </li>



                                </ul>
                            </aside>


                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================ Blog Area end =================-->

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
                                <div class="header_links">
                                    <ul>
                                        <li><a href="#"> <i class="fa fa-facebook"></i> </a></li>
                                        <li><a class="twiter" href="#"> <i class="fa fa-twitter"></i> </a></li>
                                        <li><a class="insta" href="#"> <i class="fa fa-instagram"></i> </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer_bottom ">
                <div class="container">
                    <div class="footer_border">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="footer_links text-center">
                                    <ul>
                                        <li><a href="index.html">home</a></li>
                                        <li><a href="catagory.html">category</a></li>
                                        <li><a href="about.html">about</a></li>
                                        <li><a href="contact.html">contact</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="copyright_text text-center">
                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --> </p>
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
