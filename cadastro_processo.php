<?php
// Incluir a conexão com o banco de dados
include('conexao.php');

// Verificar se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obter os dados do formulário
    $nome = $_POST['name'];
    $arroba = $_POST['arroba'];
    $email = $_POST['email'];
    $senha = $_POST['password'];

    // Validar se os campos não estão vazios
    if (empty($nome) || empty($email) || empty($senha)) {
        echo "Por favor, preencha todos os campos.";
        exit();
    }

    // Verificar se o email já está cadastrado
    $sql = "SELECT * FROM usuario WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "Esse email já está cadastrado. Tente outro.";
        exit();
    }

    // Criptografar a senha
    $senha_criptografada = password_hash($senha, PASSWORD_BCRYPT);

    // Inserir o novo usuário no banco de dados
    $sql = "INSERT INTO usuario (nome, arroba, email, senha) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $nome, $email, $senha_criptografada);

    if ($stmt->execute()) {
        echo "Cadastro realizado com sucesso!";
    } else {
        echo "Erro ao cadastrar: " . $stmt->error;
    }

    // Fechar a conexão
    $stmt->close();
    $conn->close();
}
?>
