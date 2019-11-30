package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanCategoria;
import dao.DaoCategoria;

@WebServlet("/salvarCategoria")
public class ServletsCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoCategoria daoCategoria = new DaoCategoria();

	public ServletsCategoria() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao") != null ? request.getParameter("acao") : "listartodos";
			String categoria = request.getParameter("categoria");

			if (acao.equalsIgnoreCase("delete")) {
				daoCategoria.delete(categoria);
				RequestDispatcher view = request
						.getRequestDispatcher("/cadastroCategoria.jsp");
				request.setAttribute("categorias", daoCategoria.listar());
				view.forward(request, response);
			} else if (acao.equalsIgnoreCase("editar")) {

				BeanCategoria beanCategoria = daoCategoria
						.consultar(categoria);

				RequestDispatcher view = request
						.getRequestDispatcher("/cadastroCategoria.jsp");
				request.setAttribute("categoria", beanCategoria);
				view.forward(request, response);
			} else if (acao.equalsIgnoreCase("listartodos")) {

				RequestDispatcher view = request
						.getRequestDispatcher("/cadastroCategoria.jsp");
				request.setAttribute("categorias", daoCategoria.listar());
				view.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {
			try {
				RequestDispatcher view = request
						.getRequestDispatcher("/cadastroCategoria.jsp");
				request.setAttribute("categorias", daoCategoria.listar());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {

			String id = request.getParameter("id");
			String nome = request.getParameter("nome");			

			try {

				String msg = null;
				boolean podeInserir = true;

				if (nome == null || nome.isEmpty()) {
					msg = "Nome deve ser informado";
					podeInserir = false;

				} else if (id == null || id.isEmpty()
						&& !daoCategoria.validarNome(nome)) {// QUANDO FOR CATEGORIA NOVA
					msg = "Categoria já existe com o mesmo nome!";
					podeInserir = false;

				}

				BeanCategoria categoria= new BeanCategoria();
				categoria.setNome(nome);
				categoria.setId(!id.isEmpty() ? Long.parseLong(id) : null);


				if (msg != null) {
					request.setAttribute("msg", msg);
				} else if (id == null || id.isEmpty()
						&& daoCategoria.validarNome(nome) && podeInserir) {
					daoCategoria.salvar(categoria);
					msg = "Categoria salva com sucesso";
					request.setAttribute("msg", msg);
				} else if (id != null && !id.isEmpty() && podeInserir) {
					daoCategoria.atualizar(categoria);
				}
				
				if (!podeInserir) {
					request.setAttribute("categoria", categoria);
				}

				RequestDispatcher view = request
						.getRequestDispatcher("/cadastroCategoria.jsp");
				request.setAttribute("categorias", daoCategoria.listar());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
