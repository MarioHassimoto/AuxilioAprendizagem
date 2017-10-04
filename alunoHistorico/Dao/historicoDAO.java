
package Dao;

import Bean.Historico;
import java.sql.Connection;
import java.sql.Date;
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
public class historicoDAO {
    
    public void salvar(Historico historico){
        try {
            Connection conexao = ConexaoBd.getConexao();
            PreparedStatement ps = conexao.prepareCall("INSERT INTO `historico` (`nomeavaliacao`,`nota`,`data`) VALUES (?,?,?)");
            ps.setString(1, historico.getNomeAvaliacao());
            ps.setDouble(2, historico.getNota());
            ps.setDate(3, new Date(historico.getData().getTime()));
            ps.execute();
            ConexaoBd.fecharConexao();
        } catch (SQLException ex) {
            Logger.getLogger(historicoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Historico> buscar(){
        try {
            Connection conexao = ConexaoBd.getConexao();
            PreparedStatement ps =conexao.prepareStatement("SELECT * FROM historico");
            ResultSet resultSet = ps.executeQuery();
            List<Historico> historicos = new ArrayList<>();
            while(resultSet.next()){
                Historico historico = new Historico();
                historico.setCdhistorico(resultSet.getInt("cdhistorico"));
                historico.setNomeAvaliacao(resultSet.getString("nomeAvaliacao"));
                historico.setNota(resultSet.getDouble("nota"));
                historico.setData(resultSet.getDate("data"));
                historicos.add(historico);
            }
            return historicos;
        } catch (SQLException ex) {
            Logger.getLogger(historicoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
    
}

