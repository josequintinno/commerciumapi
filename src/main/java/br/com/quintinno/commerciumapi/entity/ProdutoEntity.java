package br.com.quintinno.commerciumapi.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.UUID;

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
@Table(schema = "public", name = "TB_PRODUTO")
@SequenceGenerator(name = "SQ_PRODUTO", sequenceName = "SQ_PRODUTO", allocationSize = 1, initialValue = 1)
public class ProdutoEntity implements Serializable {

    @SuppressWarnings("unused")
    private static final Long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_PRODUTO")
    @Column(name = "CODE", nullable = false)
    private Long code;

    @Column(name = "HASH", unique = true, nullable = false)
    private UUID hash;

    @ManyToOne
    @JoinColumn(name = "ID_CATEGORIA_PRODUTO")
    private CategoriaProdutoEntity categoriaProdutoEntity;

    @Column(name = "NOME", unique = true, nullable = false)
    private String nome;

    @Column(name = "DESCRICAO_BREVE", unique = true, nullable = false)
    private String descricaoBreve;

    @Column(name = "DESCRICAO_LONGA")
    private String descricaoLonga;

    @Column(name = "VALOR", nullable = false)
    private BigDecimal valor;

    @Column(name = "QUANTIDADE", nullable = false)
    private Integer quantidade;

    public ProdutoEntity() {}

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public UUID getHash() {
        return hash;
    }

    public void setHash(UUID hash) {
        this.hash = hash;
    }

    public CategoriaProdutoEntity getCategoriaProdutoEntity() {
        return categoriaProdutoEntity;
    }

    public void setCategoriaProdutoEntity(CategoriaProdutoEntity categoriaProdutoEntity) {
        this.categoriaProdutoEntity = categoriaProdutoEntity;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricaoBreve() {
        return descricaoBreve;
    }

    public void setDescricaoBreve(String descricaoBreve) {
        this.descricaoBreve = descricaoBreve;
    }

    public String getDescricaoLonga() {
        return descricaoLonga;
    }

    public void setDescricaoLonga(String descricaoLonga) {
        this.descricaoLonga = descricaoLonga;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
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
        ProdutoEntity other = (ProdutoEntity) obj;
        if (code == null) {
            if (other.code != null)
                return false;
        } else if (!code.equals(other.code))
            return false;
        return true;
    }

}
