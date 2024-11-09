package br.com.quintinno.commerciumapi.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "TB_SITUACAO_FINANCEIRA")
@SequenceGenerator(name = "SQ_SITUACAO_FINANCEIRA", sequenceName = "SQ_SITUACAO_FINANCEIRA", allocationSize = 1, initialValue = 1)
public class SituacaoFinanceiraEntity implements Serializable {

    @SuppressWarnings("unused")
    private static final Long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_SITUACAO_FINANCEIRA")
    @Column(name = "CODE", nullable = false)
    private Long code;

    @Column(name = "DESCRICAO", length = 100, nullable = false)
    private String desrcicao;

    public SituacaoFinanceiraEntity() {}

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public String getDesrcicao() {
        return desrcicao;
    }

    public void setDesrcicao(String desrcicao) {
        this.desrcicao = desrcicao;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((code == null) ? 0 : code.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        SituacaoFinanceiraEntity other = (SituacaoFinanceiraEntity) obj;
        if (code == null) {
            if (other.code != null)
                return false;
        } else if (!code.equals(other.code))
            return false;
        return true;
    }

}
