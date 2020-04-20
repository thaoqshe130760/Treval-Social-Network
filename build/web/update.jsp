<%-- 
    Document   : update
    Created on : Nov 10, 2019, 11:50:49 PM
    Author     : thaoq
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="register/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="register/css/style.css">
    
 <%
     User u = (User) session.getAttribute("user");
 %>
    
</head>
<body>

    <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form action="update" method="POST" id="signup-form" class="signup-form">
                        <h2 class="form-title">Update Information</h2>
                        <div class="form-group">
                            Display name<input type="text" class="form-input" name="name" id="name" placeholder="Display name" value="<%=u.getDisplayName() %>"/>
                        </div>
                        <div class="form-group">
                            Birthday<input type="date" class="form-input" name="dob" id="name" placeholder="Birthday" value="<%=u.getDob() %>"/>
                        </div>
                        <div class="form-group">
                            Hobbies<input type="text" class="form-input" name="hobbies" id="name" placeholder="Hobbies" value="<%=u.getHobbies() %>"/>
                        </div>

                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Update"/>
                        </div>
                    </form>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="register/vendor/jquery/jquery.min.js"></script>
    <script src="register/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
