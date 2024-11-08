package br.com.quintinno.commerciumapi.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "TB_PRODUTO_ARQUIVO")
@SequenceGenerator(name = "SQ_PRODUTO_ARQUIVO", sequenceName = "SQ_PRODUTO_ARQUIVO", allocationSize = 1, initialValue = 1)
public class ProdutoArquivoEntity implements Serializable {

    @SuppressWarnings("unused")
    private static final Long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_PRODUTO_ARQUIVO")
    @Column(name = "CODE", nullable = false)
    private Long code;

    @ManyToOne
    @JoinColumn(name = "ID_PRODUTO", unique = true, nullable = false)
    private ProdutoEntity produtoEntity;

    @ManyToOne
    @JoinColumn(name = "ID_ARQUIVO", unique = true, nullable = false)
    private ArquivoEntity arquivoEntity;

    public ProdutoArquivoEntity() {}

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public ProdutoEntity getProdutoEntity() {
        return produtoEntity;
    }

    public void setProdutoEntity(ProdutoEntity produtoEntity) {
        this.produtoEntity = produtoEntity;
    }

    public ArquivoEntity getArquivoEntity() {
        return arquivoEntity;
    }

    public void setArquivoEntity(ArquivoEntity arquivoEntity) {
        this.arquivoEntity = arquivoEntity;
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
        ProdutoArquivoEntity other = (ProdutoArquivoEntity) obj;
        if (code == null) {
            if (other.code != null)
                return false;
        } else if (!code.equals(other.code))
            return false;
        return true;
    }

}
