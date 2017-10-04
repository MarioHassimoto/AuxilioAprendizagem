
package Bean;

import Dao.usuarioDAO;
import Model.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author Mario
 */
@ManagedBean
@SessionScoped
public class usuarioBean {
    
    private Usuario usuario = new Usuario();
    private List<Usuario> usuarios = new ArrayList<>();
    private usuarioDAO usuarioDao = new usuarioDAO();
    
    public void adicionar(){
        usuarios.add(usuario);
        new usuarioDAO().salvar(usuario);
        usuario = new Usuario();
    }
    
     public void listar(){
        usuarios = usuarioDao.buscar();
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(List<Usuario> usuarios) {
        this.usuarios = usuarios;
    }
    
    
}
