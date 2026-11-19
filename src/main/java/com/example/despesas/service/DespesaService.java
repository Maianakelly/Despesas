package com.example.despesas.service;

import com.example.despesas.model.Categoria;
import com.example.despesas.model.Despesas;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DespesaService {
    private List<Categoria> categorias = new ArrayList<>();
    private List<Despesas> despesas = new ArrayList<>();

    private int proximoId = 1;

    public List<Categoria> getCategorias() {
        return categorias;
    }

    public List<Despesas> getDespesas() {
        return despesas;
    }

    public void adicionarCategoria(String nome, String descricao, Double limite) {

        Categoria categoria = new Categoria(
                proximoId++,
                nome,
                descricao,
                limite
        );

        categorias.add(categoria);
    }

    public Categoria buscarCategoria(int id) {

        for (Categoria categoria : categorias) {
            if (categoria.getId() == id) {
                return categoria;
            }
        }

        return null;
    }

    public void adicionarDespesa(String descricao, double valor,
                                 java.time.LocalDate data,
                                 String formaPagamento,
                                 int categoriaId) {

        Categoria categoria = buscarCategoria(categoriaId);

        if (categoria != null) {

            Despesas despesa = new Despesas(
                    descricao,
                    valor,
                    data,
                    formaPagamento,
                    categoria
            );

            despesas.add(despesa);
        }
    }

    public double calcularTotal() {

        double total = 0;

        for (Despesas despesa : despesas) {
            total += despesa.getValor();
        }

        return total;
    }

    public int contarDespesasCategoria(int categoriaId) {

        int quantidade = 0;

        for (Despesas despesa : despesas) {

            if (despesa.getCategoria().getId() == categoriaId) {
                quantidade++;
            }
        }

        return quantidade;
    }

    public void excluirDespesa(int indice) {

        if (indice >= 0 && indice < despesas.size()) {
            despesas.remove(indice);
        }
    }
}
