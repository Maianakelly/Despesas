@import com.example.despesas.model.Despesas
@import java.util.List
@import java.text.NumberFormat
@import java.util.Locale
@import java.time.format.DateTimeFormatter

@param List<Despesas> despesas
@param double total

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Despesas</title>
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
    <h2>Despesas cadastradas</h2>

    <a href="/despesas/nova">+ Nova Despesa</a>

    @if (despesas.isEmpty()) {
    <p>Nenhuma despesa cadastrada ainda.</p>
    } @endif {
    <table>
        <thead>
        <tr>
            <th>Descrição</th>
            <th>Categoria</th>
            <th>Valor</th>
            <th>Data</th>
            <th>Pagamento</th>
            <th>Ação</th>
        </tr>
        </thead>
        <tbody>
        @for (int i = 0; i < despesas.size(); i++) {
        <tr>
            <td>${despesas.get(i).getDescricao()}</td>
            <td>${despesas.get(i).getCategoria().getNome()}</td>
            <td>${NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(despesas.get(i).getValor())}</td>
            <td>${despesas.get(i).getData().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))}</td>
            <td>${despesas.get(i).getFormaPagamento()}</td>
            <td>
                <form action="/despesas/excluir/${i}" method="post">
                    <button type="submit">Excluir</button>
                </form>
            </td>
        </tr>
        } @endfor
        </tbody>
    </table>

    <h3>Total: ${NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(total)}</h3>
    }
</main>

</body>
</html>