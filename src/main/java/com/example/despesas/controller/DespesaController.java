package com.example.despesas.controller;


import com.example.despesas.model.Categoria;
import com.example.despesas.service.DespesaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class DespesaController {
    private final DespesaService service;

    public DespesaController(DespesaService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String inicio(Model model) {

        model.addAttribute("quantidadeCategorias",
                service.getCategorias().size());

        model.addAttribute("quantidadeDespesas",
                service.getDespesas().size());

        model.addAttribute("total",
                service.calcularTotal());

        return "index";
    }

    @GetMapping("/categorias/nova")
    public String novaCategoria() {
        return "categoria-form";
    }

    @PostMapping("/categorias")
    public String salvarCategoria(
            @RequestParam String nome,
            @RequestParam(required = false) String descricao,
            @RequestParam(required = false) Double limite) {

        service.adicionarCategoria(nome, descricao, limite);

        return "redirect:/categorias";
    }

    @GetMapping("/categorias")
    public String listarCategorias(Model model) {

        model.addAttribute("categorias",
                service.getCategorias());

        Map<Integer, Integer> quantidades = new HashMap<>();

        for (Categoria categoria : service.getCategorias()) {

            quantidades.put(
                    categoria.getId(),
                    service.contarDespesasCategoria(categoria.getId())
            );
        }

        model.addAttribute("quantidades", quantidades);

        return "categorias";
    }

    @GetMapping("/despesas/nova")
    public String novaDespesa(Model model) {

        model.addAttribute("categorias",
                service.getCategorias());

        return "despesa-form";
    }

    @PostMapping("/despesas")
    public String salvarDespesa(
            @RequestParam String descricao,
            @RequestParam double valor,
            @RequestParam java.time.LocalDate data,
            @RequestParam String formaPagamento,
            @RequestParam int categoriaId) {

        service.adicionarDespesa(
                descricao,
                valor,
                data,
                formaPagamento,
                categoriaId
        );

        return "redirect:/despesas";
    }

    @GetMapping("/despesas")
    public String listarDespesas(Model model) {

        model.addAttribute("despesas",
                service.getDespesas());

        model.addAttribute("total",
                service.calcularTotal());

        return "despesas";
    }

    @PostMapping("/despesas/excluir/{indice}")
    public String excluirDespesa(@PathVariable int indice) {

        service.excluirDespesa(indice);

        return "redirect:/despesas";
    }
}

