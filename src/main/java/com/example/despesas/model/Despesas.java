package com.example.despesas.model;

import java.time.LocalDate;

public class Despesas {
    private String descricao;
    private double valor;
    private LocalDate data;
    private String formaPagamento;
    private com.example.despesas.model.Categoria categoria;

    public Despesas(String descricao, double valor,
                   LocalDate data, String formaPagamento,
                   com.example.despesas.model.Categoria categoria) {

        this.descricao = descricao;
        this.valor = valor;
        this.data = data;
        this.formaPagamento = formaPagamento;
        this.categoria = categoria;
    }

    public String getDescricao() {
        return descricao;
    }

    public double getValor() {
        return valor;
    }

    public LocalDate getData() {
        return data;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public com.example.despesas.model.Categoria getCategoria() {
        return categoria;
    }

}
