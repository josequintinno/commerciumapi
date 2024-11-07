package br.com.quintinno.commerciumapi.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.ConstraintMode;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "TB_ENDERECO")
@SequenceGenerator(name = "SQ_ENDERECO", sequenceName = "SQ_ENDERECO", allocationSize = 1, initialValue = 1)
public class EnderecoEntity implements Serializable {

    @SuppressWarnings("unused")
    private static final Long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_ENDERECO")
    @Column(name = "CODE", nullable = false)
    private Long code;

    @ManyToOne
    @JoinColumn(name = "ID_TIPO_ENDERECO", nullable = false)
    private TipoEnderecoEntity tipoEnderecoEntity;
    
    @ManyToOne(targetEntity = PessoaEntity.class)
    @JoinColumn(name = "ID_PESSOA", foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "PK_ENDERECO_PESSOA"), nullable = false)
    private PessoaEntity pessoaEntity;

    @ManyToOne
    @JoinColumn(name = "ID_CIDADE", nullable = false)
    private CidadeEntity cidadeEntity;

    @Column(name = "DESCRICAO", length = 100, nullable = false)
    private String descricao;

    @Column(name = "NUMERO", length = 10, nullable = false)
    private String numero;

    @Column(name = "BAIRRO", length = 100)
    private String bairro;

    @Column(name = "CEP", length = 10, nullable = false)
    private String cep;

    @Column(name = "COMPLEMENTO", length = 200)
    private String complemento;

    public EnderecoEntity() {}

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public TipoEnderecoEntity getTipoEnderecoEntity() {
        return tipoEnderecoEntity;
    }

    public void setTipoEnderecoEntity(TipoEnderecoEntity tipoEnderecoEntity) {
        this.tipoEnderecoEntity = tipoEnderecoEntity;
    }

    public PessoaEntity getPessoaEntity() {
        return pessoaEntity;
    }

    public void setPessoaEntity(PessoaEntity pessoaEntity) {
        this.pessoaEntity = pessoaEntity;
    }

    public CidadeEntity getCidadeEntity() {
        return cidadeEntity;
    }

    public void setCidadeEntity(CidadeEntity cidadeEntity) {
        this.cidadeEntity = cidadeEntity;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
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
        EnderecoEntity other = (EnderecoEntity) obj;
        if (code == null) {
            if (other.code != null)
                return false;
        } else if (!code.equals(other.code))
            return false;
        return true;
    }

}
