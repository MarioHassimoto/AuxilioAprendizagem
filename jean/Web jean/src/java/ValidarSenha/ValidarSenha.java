/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ValidarSenha;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jean
 */
public class ValidarSenha {
 
    
  /*   public boolean consultar (String login, String senha){
// Manda como parametro para ele duas variaveis para ele procurar no banco de dados!

            boolean autenticado = false;
            String sql;
            sql = "select login, senha from NOME_DA_SUA_TABELA where login = ? and senha = ?";
            PreparedStatement ps;

            ps = conexao.prepareStatement(sql);
            ps.setString(1, login);
            ps.setString(2, senha);

            ResultSet rs;
            rs = ps.executeQuery();

            if (rs.next()) {
                String loginBanco = rs.getString("NOME_DA_COLUNA_QUE_TEM_O_LOGIN");
                String senhaBanco = rs.getString("NOME_DA_COLUNA_QUE_TEM_A_SENHA");
                autenticado = true;
            }

            ps.close();
  

            return autenticado;

        } catch (SQLException ex) {
            System.out.println("Erro ao recuperar cliente/ senha.");
            Logger.getLogger(ConexaoDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException();
        */
}

    
    
