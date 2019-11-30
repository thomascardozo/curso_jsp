
<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
	type="beans.BeanCursoJsp" scope="page" />


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Curso JSP + Servlets + JDBC</title>

<link  rel="stylesheet" href="resources/css/estilo.css">

</head>

<body>

<a href="http://www.devlabstg.com/"><img alt="Inicio" title="Inicio"
		src="resources/img/inicio.jpg" width="80px" height="80px"></a>

	<div class="login-page">
	<center><h2>Projeto Java 1</h2></center><br/>
	<center><h1>JSP + Servlets + JDBC</h1></center>
	<center><span><b>USUARIO:</b> admin <br/> <b>SENHA:</b> admin<span></center><br/>
		<div class="form">
			<form action="LoginServlet" method="post" class="login-form">
				Login: <input type="text" id="login" name="login"> <br />
				Senha: <input type="password" id="senha" name="senha"> <br />
				<button type="submit" value="Logar">Logar</button>
			</form>
		</div>
		<center>		
		<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="window.open('https://www.google.com.br/', '_blank')">
							 Link Google
						</button>
					</div>		
		</center>
		
		
		
	</div>
</body>
</html>