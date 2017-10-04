
package Bean;

import Dao.historicoDAO;
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
public class HistoricoBean {
    private Historico historico = new Historico();
    private List<Historico> aluno = new ArrayList<>();
    private historicoDAO alunoDAO = new historicoDAO();

    public void adicionar(){
        aluno.add(historico);
        new historicoDAO().salvar(historico);
        historico = new Historico();
    }
    
    public void listar(){
        aluno = alunoDAO.buscar();
    }
    
    public Historico getHistorico() {
        return historico;
    }

    public void setHistorico(Historico historico) {
        this.historico = historico;
    }

    public List<Historico> getAluno() {
        return aluno;
    }

    public void setAluno(List<Historico> aluno) {
        this.aluno = aluno;
    }
    
    
}
