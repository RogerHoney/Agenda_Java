
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Contatos</title>
</head>
<body>
	<c:import url="cabecalho.jsp"/>
	<jsp:useBean id="dao" class="classe.ContatoDao"/>
	
	<table>
	<tr>
	<td>Nome</td>
	<td>Email</td>
	<td>Endereço</td>
	<td>Data de Nascimento</td>
	</tr>
	
	<!-- percorre contatos montaqndo as linhas da tabela -->
	<c:forEach var="contato" items="${dao.lista }">
		<tr>
		<td>${contato.nome}</td>
			<td>
			<c:if test="${not empty contato.email}">
				<a hef="mailto:${contato.email}">${contato.email}</a>
			</c:if>
			<c:if test="${empty contato.email}">
				E-mail não informado
			</c:if>
		</td>
		<td>${contato.endereco}</td>
			<td><fmt:formatDate value="${contato.dataNascimento.time }"pattern="dd/MM/yyyy"/></td>
		</tr>
	</c:forEach>
	</table>
	<c:import url="rodape.jsp"/>
</body>
</html>