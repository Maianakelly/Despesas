@import java.text.NumberFormat
@import java.util.Locale

@param int quantidadeCategorias
@param int quantidadeDespesas
@param double total

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minhas Despesas</title>
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
    <h2>Para onde foi meu dinheiro?</h2>
    <p>Cadastre categorias e registre cada gasto do mês.</p>

    <section class="resumo">
        <div>
            <h3>${quantidadeCategorias}</h3>
            <p>Categorias</p>
        </div>
        <div>
            <h3>${quantidadeDespesas}</h3>
            <p>Despesas</p>
        </div>
        <div>
            <h3>${NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(total)}</h3>
            <p>Total do mês</p>
        </div>
    </section>

    <a href="/categorias/nova">1º Criar categoria</a>
    <a href="/despesas/nova">2º Registrar despesa</a>
</main>

</body>
</html>

