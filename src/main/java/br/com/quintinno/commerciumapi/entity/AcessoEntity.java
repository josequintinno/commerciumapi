package br.com.quintinno.commerciumapi.entity;

import java.time.LocalDate;

import org.springframework.security.core.GrantedAuthority;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(schema = "public", name = "TB_ACESSO")
@SequenceGenerator(name = "SQ_ACESSO", sequenceName = "SQ_ACESSO", allocationSize = 1, initialValue = 1)
public class AcessoEntity implements GrantedAuthority {

    @SuppressWarnings("unused")
    private static final Long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_ACESSO")
    @Column(name = "CODE", nullable = false)
    private Long code;

    @Column(name = "DESCRICAO", length = 100, nullable = false)
    private String descricao;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_CADASTRO", nullable = false)
    private LocalDate dataCadastro;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_ATUALIZACAO")
    private LocalDate dataAtualizacao;

    @Column(name = "USUARIO_ATUALIZACAO", length = 50)
    private String usuarioAtualizacao;

    public AcessoEntity() {
        this.dataCadastro = LocalDate.now();
    }

    @Override
    public String getAuthority() {
        return this.descricao;
    }

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String desrcicao) {
        this.descricao = desrcicao;
    }

    public LocalDate getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(LocalDate dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public LocalDate getDataAtualizacao() {
        return dataAtualizacao;
    }

    public void setDataAtualizacao(LocalDate dataAtualizacao) {
        this.dataAtualizacao = dataAtualizacao;
    }

    public String getUsuarioAtualizacao() {
        return usuarioAtualizacao;
    }

    public void setUsuarioAtualizacao(String usuarioAtualizacao) {
        this.usuarioAtualizacao = usuarioAtualizacao;
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
        AcessoEntity other = (AcessoEntity) obj;
        if (code == null) {
            if (other.code != null)
                return false;
        } else if (!code.equals(other.code))
            return false;
        return true;
    }

}
