
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/upload_image.css">
        <script src="js/upload_image.js"></script>
    </head>
    <body>
        <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <div class="file-upload" style="width: 90%;">
            
            <div style="margin-bottom: 10%">
                <img style="max-width: 100%" src="images/<%=avatar %>" alt="your image" />
            </div>
            
            <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger('click')">Thay Đổi Ảnh</button>

            <div class="image-upload-wrap">
                <input class="file-upload-input" type="file" name="avatar" onchange="readURL(this);" accept="image/*" />
                <div class="drag-text">
                    <h3>
                        Kéo Và Thả một File Vào Đây
                    </h3>
                </div>
            </div>
            <div class="file-upload-content">
                <img class="file-upload-image" src="#" style="max-width: 100%"  alt="your image" />
                <div class="image-title-wrap">
                    <button type="button" onclick="removeUpload()" class="remove-image">Xóa Bỏ  <span class="image-title">Uploaded Image</span></button>
                </div>
            </div>
            
        </div>
    </body>
</html>
