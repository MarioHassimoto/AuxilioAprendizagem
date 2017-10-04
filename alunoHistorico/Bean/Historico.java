
package Bean;

import java.util.Date;

/**
 *
 * @author Mario
 */
public class Historico {
    private int cdhistorico;
    private String nomeAvaliacao;
    private double nota;
    private Date data;
    

    public int getCdhistorico() {
        return cdhistorico;
    }

    public void setCdhistorico(int cdhistorico) {
        this.cdhistorico = cdhistorico;
    }

    public String getNomeAvaliacao() {
        return nomeAvaliacao;
    }

    public void setNomeAvaliacao(String nomeAvaliacao) {
        this.nomeAvaliacao = nomeAvaliacao;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 47 * hash + this.cdhistorico;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Historico other = (Historico) obj;
        if (this.cdhistorico != other.cdhistorico) {
            return false;
        }
        return true;
    }
          
    
}
