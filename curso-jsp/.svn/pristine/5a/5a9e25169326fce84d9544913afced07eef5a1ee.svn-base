<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Categorias</title>

<script src="resources/javascript/jquery.min.js" type="text/javascript"></script>
<script src="resources/javascript/jquery.maskMoney.min.js"
	type="text/javascript"></script>

<link rel="stylesheet" href="resources/css/cadastro.css">
</head>
<body>
	<a href="acessoliberado.jsp"><img alt="Inicio" title="Inicio"
		src="resources/img/inicio.jpg" width="80px" height="80px"></a>

	<a href="index.jsp"><img alt="Sair" title="Sair"
		src="resources/img/sair.jpg" width="80px" height="80px"></a>
	<center>
		<h1>Cadastro de Categorias</h1>
		<h3 style="color: orange;">${msg}</h3>
	</center>

	<form action="salvarCategoria" method="post" id="formProd"
		onsubmit="return validarCampos()? true : false;">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Código:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${categoria.id}" class="field-long"></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome" maxlength="20px"
							value="${categoria.nome}"></td>
					</tr>

					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"> <input
							type="submit" value="Cancelar"
							onclick="document.getElementById('formProd').action = 'salvarCategoria?acao=reset'"></td>
					</tr>
				</table>

			</li>
		</ul>
	</form>

	<div class="container">
		<table class="responsive-table">
			<caption>Lista de Categorias</caption>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Delete</th>
				<th>Editar</th>
			</tr>
			<c:forEach items="${categorias}" var="categoria">
				<tr>
					<td style="width: 150px"><c:out value="${categoria.id}">
						</c:out></td>
					<td style="width: 150px"><c:out value="${categoria.nome}">
						</c:out></td>
					
					<td><a href="salvarCategoria?acao=delete&categoria=${categoria.id}"><img
							src="resources/img/excluir.png" alt="excluir" title="Excluir" onclick="return confirm('Confirma a exclusão?')"
							width="20px" height="20px"> </a></td>
					<td><a href="salvarCategoria?acao=editar&categoria=${categoria.id}"><img
							alt="editar" title="Editar" src="resources/img/editar.png"
							width="20px" height="20px"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("nome").value == '') {
				alert('Informe o nome!');
				return false;
			} 
			return true;
		}
	</script>

</body>

</html>