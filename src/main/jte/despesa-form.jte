@import com.example.despesas.model.Categoria
@import java.util.List

@param List<Categoria> categorias

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nova Despesa</title>
    <link rel="stylesheet" href="/css/estilo.css">
</head>
<body>

<header>
    <h1>💰 Minhas Despesas</h1>
    <nav>
        <a href="/">Início</a>
        <a href="/categorias">Categorias</a>
        <a href="/categorias/nova">Nova Categoria</a>
        <a href="/despesas">Despesas</a>
        <a href="/despesas/nova">Nova Despesa</a>
    </nav>
</header>

<main>
    <h2>Nova Despesa</h2>
    <p>Informe os dados do gasto.</p>

    @if (categorias.isEmpty()) {
    <p>Você ainda não possui categorias cadastradas.</p>
    <p>Cadastre uma categoria primeiro para registrar uma despesa.</p>
    <a href="/categorias/nova">Cadastrar categoria</a>
    } @endif {
    <form action="/despesas" method="post">

        <label>Descrição *</label>
        <input type="text" name="descricao" placeholder="Ex: Almoço RU" required>

        <label>Valor (R$) *</label>
        <input type="number" name="valor" step="0.01" min="0.01" placeholder="Ex: 4.50" required>

        <label>Data *</label>
        <input type="date" name="data" required>

        <label>Categoria *</label>
        <select name="categoriaId" required>
            <option value="">Selecione uma categoria</option>
            @for (Categoria c : categorias) {
            <option value="${c.getId()}">
                ${c.getId()} - ${c.getNome()}
            </option>
            } @endfor
        </select>

        <p>Forma de pagamento:</p>

        <label>
            <input type="radio" name="formaPagamento" value="Pix" required>
            Pix
        </label>

        <label>
            <input type="radio" name="formaPagamento" value="Cartão">
            Cartão
        </label>

        <label>
            <input type="radio" name="formaPagamento" value="Dinheiro">
            Dinheiro
        </label>

        <br><br>

        <button type="submit">Salvar despesa</button>
        <a href="/despesas">Cancelar</a>
    </form>
    }
</main>

</body>
</html>
