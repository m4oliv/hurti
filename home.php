<?php
// Iniciar a sessão
session_start();

// Verificar se o usuário está logado (se a sessão 'username' existe)
if (!isset($_SESSION['email'])) {
    // Se o usuário não estiver logado, redirecionar para a página de login
    header("Location: login.php");
    exit();  // Certifique-se de que o script pare de ser executado após o redirecionamento
}

// Se o usuário estiver logado, recuperar o nome de usuário
$email = $_SESSION['email'];
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bem-vindo</title>
    <link rel="stylesheet" href="styles.css">  <!-- Arquivo CSS -->
</head>
<body>
    <div class="container">
        <h1>Bem-vindo, <?php echo htmlspecialchars($email); ?>!</h1>
        <p>Você está logado com sucesso.</p>
        <a href="logout.php">Sair</a>
    </div>
</body>
</html>
