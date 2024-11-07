package br.com.quintinno.commerciumapi.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(schema = "public", name = "TB_PESSOA_JURIDICA")
public class PessoJuridicaEntity extends PessoaEntity {

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_NASCIMENTO")
    private LocalDate dataFundacao;

    public PessoJuridicaEntity() {}

    public LocalDate getDataFundacao() {
        return dataFundacao;
    }

    public void setDataFundacao(LocalDate dataFundacao) {
        this.dataFundacao = dataFundacao;
    }

}
