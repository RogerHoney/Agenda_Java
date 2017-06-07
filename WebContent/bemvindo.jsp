<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bem Vindo!</title>
</head>
<body>
<%--comentário em jsp aqui: nossa primeira página JSP --%>

<h1>Agenda</h1>
<h2><%String mensagem = "Bem vindo ao sistema de agenda"; %>
	<%out.println(mensagem); %>
</h2><br/>
<%String desenvolvido = "Desenvolvido por Mim"; %>
<%=desenvolvido %>
<br/>
<%System.out.println("Tudo foi executado!"); %>

</body>
</html>