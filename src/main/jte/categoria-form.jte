
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nova Categoria</title>
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
    <h2>Nova Categoria</h2>
    <p>Preencha os dados para cadastrar uma categoria.</p>

    <form action="/categorias" method="post">
        <label>Nome *</label>
        <input type="text" name="nome" placeholder="Ex: Alimentação" required>

        <label>Descrição</label>
        <input type="text" name="descricao" placeholder="Ex: Mercado, RU, lanches">

        <label>Limite de alerta (R$)</label>
        <input type="number" name="limite" step="0.01" placeholder="Ex: 400.00">

        <button type="submit">Salvar categoria</button>
        <a href="/categorias">Cancelar</a>
    </form>
</main>

</body>
</html>
