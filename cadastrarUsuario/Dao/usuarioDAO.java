
package Dao;

import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mario
 */
public class usuarioDAO {
    
    public void salvar(Usuario usuario){
        try {
            Connection conexao = ConexaoBd.getConexao();
            PreparedStatement ps = conexao.prepareCall("INSERT INTO `usuario` (`cdUsuario`,`nome`,`email`,`senha`,`tipo`) VALUES (?,?,?,?,?)");
            
            ps.setInt(1, usuario.getCdUsuario());
            ps.setString(2, usuario.getNome());
            ps.setString(3, usuario.getEmail());
            ps.setInt(4, usuario.getSenha());
            ps.setString(5, usuario.getTipoUsuario());
            ps.execute();
            ConexaoBd.fecharConexao();
        } catch (SQLException ex) {
            Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Usuario> buscar(){
        try {
            Connection conexao = ConexaoBd.getConexao();
            PreparedStatement ps =conexao.prepareStatement("SELECT * FROM usuario");
            ResultSet resultSet = ps.executeQuery();
            List<Usuario> usuarios = new ArrayList<>();
            while(resultSet.next()){
                Usuario usuario = new Usuario();
                usuario.setCdUsuario(resultSet.getInt("cdusuario"));
                usuario.setNome(resultSet.getString("nome"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setSenha(resultSet.getInt("senha"));
                usuario.setTipoUsuario(resultSet.getString("tipo"));    
                usuarios.add(usuario);
            }
            return usuarios;
        } catch (SQLException ex) {
            Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
}
