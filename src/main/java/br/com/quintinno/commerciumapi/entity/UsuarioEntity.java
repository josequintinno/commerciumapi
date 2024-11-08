package br.com.quintinno.commerciumapi.entity;

import java.time.LocalDate;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(schema = "public", name = "TB_USUARIO")
@SequenceGenerator(name = "SQ_USUARIO", sequenceName = "SQ_USUARIO", allocationSize = 1, initialValue = 1)
public class UsuarioEntity implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_PESSOA")
    @Column(name = "CODE", nullable = false)
    private Long code;

    @OneToOne
    @JoinColumn(name = "ID_PESSOA", nullable = false)
    private PessoaEntity pessoaEntity;

    // @ManyToMany(fetch = FetchType.LAZY)
    // @JoinTable(
    //     name = "TB_USUARIO_ACESSO",
    //     uniqueConstraints = @UniqueConstraint(columnNames = {"ID_USUARIO", "ID_ACESSO"}, name = "unique_acesso_user"),
    //     joinColumns = @JoinColumn(name = "ID_USUARIO", referencedColumnName = "CODE"),
    //     inverseJoinColumns = @JoinColumn(name = "ID_ACESSO", referencedColumnName = "CODE")
    // )
    // private List<AcessoEntity> acessoEntityList = new ArrayList<>();

    @Column(name = "IDENTIFICADOR", length = 100, nullable = false)
    private String identificador;

    @Column(name = "SENHA", length = 100, nullable = false)
    private String senha;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_CADASTRO", nullable = false)
    private LocalDate dataCadastro;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_ATUALIZACAO")
    private LocalDate dataAtualizacao;

    @Column(name = "USUARIO_ATUALIZACAO", length = 50)
    private String usuarioAtualizacao;

    public UsuarioEntity() { 
        this.dataCadastro = LocalDate.now();
    }

    @Override
    public String getUsername() {
        return this.identificador;
    }

    @Override
    public String getPassword() {
        return this.senha;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public PessoaEntity getPessoaEntity() {
        return pessoaEntity;
    }

    public void setPessoaEntity(PessoaEntity pessoaEntity) {
        this.pessoaEntity = pessoaEntity;
    }

    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
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
        UsuarioEntity other = (UsuarioEntity) obj;
        if (code == null) {
            if (other.code != null)
                return false;
        } else if (!code.equals(other.code))
            return false;
        return true;
    }

}
