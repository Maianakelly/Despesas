@import com.example.despesas.model.Categoria
@import com.example.despesas.model.Categoria
@import java.text.NumberFormat
@import java.util.List
@import java.util.Locale
@import java.util.Map

@param List<Categoria> categorias
@param Map<Integer, Integer> quantidades

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categorias</title>
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
    <h2>Categorias cadastradas</h2>

    <a href="/categorias/nova">+ Nova Categoria</a>

    @if (categorias.isEmpty()) {
    <p>Nenhuma categoria cadastrada ainda.</p>
    } @endif {
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Descrição</th>
            <th>Limite</th>
            <th>Qtd. despesas</th>
        </tr>
        </thead>
        <tbody>
        @for (Categoria c : categorias) {
        <tr>
            <td>${c.getId()}</td>
            <td>${c.getNome()}</td>
            <td>${c.getDescricao()}</td>
            <td>
                @if (c.getLimite() != null) {
                ${NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(c.getLimite())}
                } @endif {
                —
                }
            </td>
            <td>${quantidades.get(c.getId())}</td>
        </tr>
        } @endfor
        </tbody>
    </table>
    }
</main>

</body>
</html>