package br.com.quintinno.commerciumapi.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(schema = "public", name = "TB_PESSOA_FISICA")
public class PessoaFisicaEntity extends PessoaEntity {

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_NASCIMENTO")
    private LocalDate dataNascimento;

    public PessoaFisicaEntity() {}

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(LocalDate dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

}
