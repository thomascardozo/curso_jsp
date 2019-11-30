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

/*
 * Classe DaoTelefone
 * Classe Que Provê os Métodos e Validações Para Manipular Dados, e Acesso e Manipulação do BD
 */
public class DaoCategoria {

	private Connection connection;
		
		/*
		 * Construtor DaoTelefone()
		 * Recebe um Objeto connection da Classe SingleConnection
		 */
		public DaoCategoria() {
			connection = SingleConnection.getConnection();
		}
		
		/*
		 * Método salvar()
		 * Responsável Por Fazer a Inserção de Dados (INSERT) no BD
		 * @param BeanTelefone telefone = Objeto Telefone da Classe BeanTelefone
		 */
		public void salvar(BeanCategoria categoria) {
			try {
				String sql = "INSERT INTO categoria (nome) VALUES (?)";
				PreparedStatement insert = connection.prepareStatement(sql);
				insert.setString(1, categoria.getNome());
				
				insert.execute();
				connection.commit();
			} catch(Exception e) {
				e.printStackTrace();
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		
		/*
		 * Método listar()
		 * Responsável Por Listar Todos os Telefones do Sistema
		 */
		
		public List<BeanCategoria> listar() throws Exception {
			List<BeanCategoria> listar = new ArrayList<BeanCategoria>();

			String sql = "select * from categoria";

			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {

				BeanCategoria beanCategoria = new BeanCategoria();
				beanCategoria.setId(resultSet.getLong("id"));
				beanCategoria.setNome(resultSet.getString("nome"));
				
				listar.add(beanCategoria);
			}
			return listar;
		}
		
		public List<BeanCategoria> listar(Long categoriaId) throws Exception {
			List<BeanCategoria> listar = new ArrayList<BeanCategoria>();
			String sql = "SELECT * FROM categoria WHERE id = "+ categoriaId;
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
				while(resultSet.next()) {
					BeanCategoria categoria = new BeanCategoria();
					categoria.setId(resultSet.getLong("id"));
					categoria.setNome(resultSet.getString("nome"));					
					listar.add(categoria);
				}
				return listar;
		}
		
		
		public BeanCategoria consultar(String id) throws Exception {
			String sql = "select * from categoria where id='" + id + "'";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				BeanCategoria beanCategoria = new BeanCategoria();
				beanCategoria.setId(resultSet.getLong("id"));
				beanCategoria.setNome(resultSet.getString("nome"));
				return beanCategoria;
			}
			return null;
		}
		
		//valida se ja existe alguma outra categoria com o mesmo nome 
		public boolean validarNome(String nome) throws Exception {
			String sql = "select count(1) as qtd from categoria where nome='" + nome + "'";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				
				return resultSet.getInt("qtd") <= 0;/*Return true*/
			}

			return false;
		}
		
		public void atualizar(BeanCategoria categoria) {
			try {
				String sql = "update categoria set nome = ? where id = "
						+ categoria.getId();

				PreparedStatement preparedStatement = connection
						.prepareStatement(sql);
				preparedStatement.setString(1, categoria.getNome());
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
		
		
		/*
		 * Método delete()
		 * Responsável Por Fazer a Exclusão (Delete) no BD
		 * @param String id = Atributo ID do Telefone
		 */
		public void delete(String id) {
			try {
				String sql = "DELETE FROM categoria WHERE id = '"+ id +"'";
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.execute();
				connection.commit();
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
}