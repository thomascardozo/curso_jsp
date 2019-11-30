<%@page import="beans.BeanCursoJsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/cadastro.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<title>Cadastro de Usu�rio</title>
</head>
<body>
	<a href="acessoliberado.jsp"><img alt="Inicio" title="Inicio"
		src="resources/img/inicio.jpg" width="50px" height="50px"></a>
	<a href="index.jsp"><img alt="Sair" title="Sair"
		src="resources/img/sair.jpg" width="50px" height="50px"></a>

	<center>
		<h1>Cadastro de Usu�rio</h1>
		<h3 style="color: orange">${msg}</h3>
	</center>
	<form action="salvarUsuario" method="post" id="formUser"
		onsubmit="return validarCampos()? true : false;"
		enctype="multipart/form-data">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>ID:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}" /></td>
						<td>CEP:</td>
						<td><input type="text" id="cep" name="cep" value=""
							onblur="consultarCep()" maxlength="9" value="${user.cep}" /></td>
					</tr>
					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}" maxlength="10" /></td>
						<td>Rua:</td>
						<td><input type="text" id="rua" name="rua"
							value="${user.rua}" maxlength="50" /></td>
					</tr>
					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha"
							value="${user.senha}" maxlength="10" /></td>
						<td>Bairro:</td>
						<td><input type="text" id="bairro" name="bairro"
							value="${user.bairro}" maxlength="50" /></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${user.nome}" maxlength="50" placeholder="Informe o nome" /></td>
						<td>Cidade:</td>
						<td><input type="text" id="cidade" name="cidade"
							value="${user.cidade}" maxlength="50" /></td>
					</tr>

					<tr>
						<td>IBGE:</td>
						<td><input type="text" id="ibge" name="ibge"
							value="${user.ibge}" maxlength="20" /></td>

						<td>Ativo:</td>
						<td><input type="checkbox" id="ativo" name="ativo"
							<%if (request.getAttribute("user") != null) {

				BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
				if (user.isAtivo()) {
					out.print(" ");
					out.print("checked=\"checked\"");
					out.print(" ");
				}
			}%>>
						</td>
					</tr>

					<tr>

						<td>Perfil:</td>
						<td><select id="perfil" name="perfil"
							style="width: 185px; height: 30px;">
								<option value="nao_informado">[--SELECIONE--]</option>

								<option value="administrador"
									<%if (request.getAttribute("user") != null) {

				BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
				if (user.getPerfil().equalsIgnoreCase("administrador")) {
					out.print(" ");
					out.print("selected=\"selected\"");
					out.print(" ");
				}
			}%>>Administrador</option>

								<option value="secretario"
									<%if (request.getAttribute("user") != null) {

				BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
				if (user.getPerfil().equalsIgnoreCase("secretario")) {
					out.print(" ");
					out.print("selected=\"selected\"");
					out.print(" ");
				}
			}%>>Secret�rio(a)</option>

								<option value="gerente"
									<%if (request.getAttribute("user") != null) {

				BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
				if (user.getPerfil().equalsIgnoreCase("gerente")) {
					out.print(" ");
					out.print("selected=\"selected\"");
					out.print(" ");
				}
			}%>>Gerente</option>

								<option value="funcionario"
									<%if (request.getAttribute("user") != null) {

				BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
				if (user.getPerfil().equalsIgnoreCase("funcionario")) {
					out.print(" ");
					out.print("selected=\"selected\"");
					out.print(" ");
				}
			}%>>Funcion�rio</option>
						</select></td>

						<td>Curriculo:</td>
						<td><input type="file" name="curriculo" value="curriculo">
						</td>

					</tr>


					<tr>
						<td>Sexo:</td>
						<td><input type="radio" name="sexo"
							<%if (request.getAttribute("user") != null) {

								BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
				if (user.getSexo().equalsIgnoreCase("masculino")) {
					out.print(" ");
					out.print("checked=\"checked\"");
					out.print(" ");
				}

			}%>
							value="masculino">Masculino</input> <input type="radio"
							name="sexo"
							<%if (request.getAttribute("user") != null) {

			    BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
				if (user.getSexo().equalsIgnoreCase("feminino")) {
					out.print(" ");
					out.print("checked=\"checked\"");
					out.print(" ");
				}

			}%>
							value="feminino">Feminino</input></td>

						<td>Foto:</td>
						<td><input type="file" name="foto"></td>

					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar" style="width: 173px;" /></td>
						<td></td>
						<td><input type="submit" style="width: 173px;"
							value="Cancelar"
							onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'" /></td>
					</tr>

				</table>
			</li>
		</ul>
	</form>

	<form method="post" action="servletPesquisa" style="width: 90%">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Descri��o</td>
						<td><input type="text" id="descricaoconsulta" name="descricaoconsulta"></td>
						<td><input type="submit" value="Pesquisar"></td>
					</tr>
				</table>
			</li>
		</ul>
	</form>
	<div class="container">
		<table class="responsive-table">
			<caption>Lista de usu�rios</caption>
			<tr>
				<th>Id</th>
				<th>Foto</th>
				<th>Curriculo</th>
				<th>Nome</th>
				<th>Telefone</th>
				<th>Delete</th>
				<th>Editar</th>
			</tr>
			<c:forEach items="${usuarios}" var="user">
				<tr>
					<td><c:out value="${user.id}" /></td>

					<c:if test="${user.fotoBase64Miniatura.isEmpty() == false}">
						<td><a
							href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}"><img
								src='<c:out value="${user.fotoBase64Miniatura}"/>'
								alt="Imagem User" title="Imagem User" width="32px" height="32px" />
						</a></td>
					</c:if>
					<c:if test="${user.fotoBase64Miniatura == null}">
						<td><img alt="Imagem User" src="resources/img/user-icon.jpg"
							width="32px" height="32px" onclick="alert('N�o possui imagem')">
						</td>
					</c:if>

					<c:if test="${user.curriculoBase64.isEmpty() == false}">
						<td><a
							href="salvarUsuario?acao=download&tipo=curriculo&user=${user.id}"><img
								alt="Curriculo" src="resources/img/pdf.png" width="32px"
								height="32px"> </a></td>
					</c:if>
					<c:if
						test="${user.curriculoBase64 == null || user.curriculoBase64.isEmpty() == true}">
						<td><img alt="Curriculo" src="resources/img/pdf.png"
							width="32px" height="32px"
							onclick="alert('N�o possui curriculo')"></td>
					</c:if>

					<td><c:out value="${user.nome}" /></td>
					<td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img
							src="resources/img/telefone.png" alt="Telefones"
							title="Telefones" width="32px" height="32px" /></a></td>
					<td><a href="salvarUsuario?acao=delete&user=${user.id}"
						onclick="return confirm('Confirmar a exclus�o?');"><img
							src="resources/img/icon.png" alt="Excluir" title="Excluir"
							width="32px" height="32px" /></a></td>
					<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img
							src="resources/img/editar.png" alt="Editar" title="Editar"
							width="32px" height="32px" /></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("login").value == '') {
				alert("Informe o Login!");
				return false;
			} else if (document.getElementById("senha").value == '') {
				alert("Informe a Senha!");
				return false;
			} else if (document.getElementById("nome").value == '') {
				alert("Informe o Nome!");
				return false;
			} else if (document.getElementById("telefone").value == '') {
				alert("Informe o Telefone!");
				return false;
			}
			return true;
		}

		function consultarCep() {
			var cep = $("#cep").val();

			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {
							$("#rua").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#cidade").val(dados.localidade);
							$("#estado").val(dados.uf);
							$("#ibge").val(dados.ibge);
						} else {
							$("#cep").val('');
							$("#rua").val('');
							$("#bairro").val('');
							$("#cidade").val('');
							$("#estado").val('');
							$("#ibge").val('');
							alert("CEP n�o encontrado.");
						}
					});
		}
	</script>
</body>
</html>