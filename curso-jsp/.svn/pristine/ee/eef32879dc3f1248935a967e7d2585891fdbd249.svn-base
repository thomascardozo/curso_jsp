package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanCategoria;
import beans.BeanProdutoCursoJsp;
import connection.SingleConnection;

public class DaoProduto {

	private Connection connection;

	public DaoProduto() {
		connection = SingleConnection.getConnection();
	}

	public void salvar(BeanProdutoCursoJsp produto) {

		try {

			String sql = "insert into produto(nome, quantidade, valor, categoria_id) values (?, ?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, produto.getNome());
			insert.setInt(2, produto.getQuantidade());
			insert.setDouble(3, produto.getValor());
			insert.setLong(4, produto.getCategoria_id());
			insert.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	public List<BeanProdutoCursoJsp> listar() throws Exception {
		List<BeanProdutoCursoJsp> listar = new ArrayList<BeanProdutoCursoJsp>();

		String sql = "select * from produto";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {

			BeanProdutoCursoJsp beanProdutoCursoJsp = new BeanProdutoCursoJsp();
			beanProdutoCursoJsp.setId(resultSet.getLong("id"));
			beanProdutoCursoJsp.setNome(resultSet.getString("nome"));
			beanProdutoCursoJsp.setQuantidade(resultSet.getInt("quantidade"));
			beanProdutoCursoJsp.setValor(resultSet.getDouble("valor"));
			beanProdutoCursoJsp.setCategoria_id(resultSet.getLong("categoria_id"));
			listar.add(beanProdutoCursoJsp);
		}

		return listar;
	}
	
	public List<BeanCategoria> listarCategorias() throws Exception {
		List<BeanCategoria> retorno = new ArrayList<BeanCategoria>();

		String sql = "select * from categoria";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {

			BeanCategoria beanCategoria = new BeanCategoria();
			beanCategoria.setId(resultSet.getLong("id"));
			beanCategoria.setNome(resultSet.getString("nome"));
			retorno.add(beanCategoria);
		}

		return retorno;
	}

	public void delete(String id) {

		try {
			String sql = "delete from produto where id = '" + id + "'";
			PreparedStatement preparedStatement = connection
					.prepareStatement(sql);
			preparedStatement.execute();

			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}

	}

	public BeanProdutoCursoJsp consultar(String id) throws Exception {
		String sql = "select * from produto where id='" + id + "'";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			BeanProdutoCursoJsp beanProdutoCursoJsp = new BeanProdutoCursoJsp();
			beanProdutoCursoJsp.setId(resultSet.getLong("id"));
			beanProdutoCursoJsp.setNome(resultSet.getString("nome"));
			beanProdutoCursoJsp.setQuantidade(resultSet.getInt("quantidade"));
			beanProdutoCursoJsp.setValor(resultSet.getDouble("valor"));
			beanProdutoCursoJsp.setCategoria_id(resultSet.getLong("categoria_id"));
			
			return beanProdutoCursoJsp;
		}

		return null;
	}
	
	//valida se ja existe algum outro codigo de produto com o mesmo numero 
	public boolean validarNome(String nome) throws Exception {
		String sql = "select count(1) as qtd from produto where nome='" + nome + "'";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			
			return resultSet.getInt("qtd") <= 0;/*Return true*/
		}

		return false;
	}


	public void atualizar(BeanProdutoCursoJsp produto) {
		try {
			String sql = "update produto set nome = ?, quantidade = ?, valor = ?, categoria_id = ?  where id = "
					+ produto.getId();

			PreparedStatement preparedStatement = connection
					.prepareStatement(sql);
			preparedStatement.setString(1, produto.getNome());
			preparedStatement.setInt(2, produto.getQuantidade());
			preparedStatement.setDouble(3, produto.getValor());
			preparedStatement.setLong(4, produto.getCategoria_id());
			preparedStatement.executeUpdate();
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
}
