<%-- 
    Document   : displayImage
    Created on : 31/03/2020, 12:17:13
    Author     : Adaulan 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <title>Display Image</title>
    </head>
    <body>
        <h1></h1>
        <form method="Post" action="${pageContext.request.contextPath}/DownloadImage">
        <img src="${imagem}" alt="imagemTeste">
        <button type="submit"> Confirm </button>
        </form>
    </body>
</html>
