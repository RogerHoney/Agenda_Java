package classe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.sql.Date;

import classe.ConnectionFactory;

public class ContatoDao {

	private Connection connection;
		public ContatoDao(){
			this.connection = new ConnectionFactory().getConnection();
		
		}
	
	public void adiciona(Contato contato){
		String sql = "insert into contatos" +
				"(nome,email,endereco,dataNascimento)" +
				" values(?,?,?,?)";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, contato.getNome());
			stmt.setString(2, contato.getEmail());
			stmt.setString(3, contato.getEndereco());
			stmt.setDate(4, new Date(
					contato.getDataNascimento().getTimeInMillis()));
			
			stmt.execute();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public List<Contato> getLista(){
		try{
			List<Contato> contatosArray = new ArrayList<Contato>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM contatos");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Contato contato = new Contato();
				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setEndereco(rs.getString("endereco"));
				
				
				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("dataNascimento"));
				contato.setDataNascimento(data);
				
				contatosArray.add(contato);
			}
			rs.close();
			stmt.close();
			return contatosArray;
		}catch (SQLException e){
			throw new RuntimeException(e);
		}
		
		
		
	}
}
