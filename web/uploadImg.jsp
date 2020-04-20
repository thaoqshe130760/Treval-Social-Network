<%-- 
    Document   : uploadImg
    Created on : Nov 7, 2019, 8:51:12 PM
    Author     : thaoq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {margin: 0; padding: 0; box-sizing: border-box;}
            body {background: #f6f6f6; color: #444; font-family: 'Roboto', sans-serif; font-size: 16px; line-height: 1;}
            .container {max-width: 1100px; padding: 0 20px; margin:0 auto;}
            .panel {margin: 100px auto 40px; max-width: 500px; text-align: center;}
            .button_outer {background: #83ccd3; border-radius:30px; text-align: center; height: 50px; width: 200px; display: inline-block; transition: .2s; position: relative; overflow: hidden;}
            .btn_upload {padding: 17px 30px 12px; color: #fff; text-align: center; position: relative; display: inline-block; overflow: hidden; z-index: 3; white-space: nowrap;}
            .btn_upload input {position: absolute; width: 100%; left: 0; top: 0; width: 100%; height: 105%; cursor: pointer; opacity: 0;}
            .file_uploading {width: 100%; height: 10px; margin-top: 20px; background: #ccc;}
            .file_uploading .btn_upload {display: none;}
            .processing_bar {position: absolute; left: 0; top: 0; width: 0; height: 100%; border-radius: 30px; background:#83ccd3; transition: 3s;}
            .file_uploading .processing_bar {width: 100%;}
            .success_box {display: none; width: 50px; height: 50px; position: relative;}
            .success_box:before {content: ''; display: block; width: 9px; height: 18px; border-bottom: 6px solid #fff; border-right: 6px solid #fff; -webkit-transform:rotate(45deg); -moz-transform:rotate(45deg); -ms-transform:rotate(45deg); transform:rotate(45deg); position: absolute; left: 17px; top: 10px;}
            .file_uploaded .success_box {display: inline-block;}
            .file_uploaded {margin-top: 0; width: 50px; background:#83ccd3; height: 50px;}
            .uploaded_file_view {max-width: 300px; margin: 40px auto; text-align: center; position: relative; transition: .2s; opacity: 0; border: 2px solid #ddd; padding: 15px;}
            .file_remove{width: 30px; height: 30px; border-radius: 50%; display: block; position: absolute; background: #aaa; line-height: 30px; color: #fff; font-size: 12px; cursor: pointer; right: -15px; top: -15px;}
            .file_remove:hover {background: #222; transition: .2s;}
            .uploaded_file_view img {max-width: 100%;}
            .uploaded_file_view.show {opacity: 1;}
            .error_msg {text-align: center; color: #f00}
        </style>
        
        <%
            String pid = (String) request.getAttribute("pid");
            String uid = (String) request.getAttribute("uid");
        %>
        
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <main class="main_full">
            <form action="uploadImg" method="post">
                <div class="container">
                    <div class="panel">
                        <div class="button_outer">
                            <div class="btn_upload">

                                <input type="file" id="upload_file" name="img">
                                Upload Image



                            </div>
                            <div class="processing_bar"></div>
                            <div class="success_box"></div>
                        </div>
                    </div>
                    <div class="error_msg"></div>
                    <div class="uploaded_file_view" id="uploaded_view">
                        <span class="file_remove">X</span>
                    </div>
                </div>
                Description<input type="text" name="title" value="" />
                <input type="submit" value="Upload" />
            </form>
        </main>


        <script>
            var btnUpload = $("#upload_file"),
                    btnOuter = $(".button_outer");
            btnUpload.on("change", function (e) {
                var ext = btnUpload.val().split('.').pop().toLowerCase();
                if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                    $(".error_msg").text("Not an Image...");
                } else {
                    $(".error_msg").text("");
                    btnOuter.addClass("file_uploading");
                    setTimeout(function () {
                        btnOuter.addClass("file_uploaded");
                    }, 1000);
                    var uploadedFile = URL.createObjectURL(e.target.files[0]);
                    setTimeout(function () {
                        $("#uploaded_view").append('<img src="' + uploadedFile + '" />').addClass("show");
                    }, 1500);
                }
            });
            $(".file_remove").on("click", function (e) {
                $("#uploaded_view").removeClass("show");
                $("#uploaded_view").find("img").remove();
                btnOuter.removeClass("file_uploading");
                btnOuter.removeClass("file_uploaded");
            });
        </script>
    </body>
</html>
