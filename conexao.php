<php?
// Definir as configurações de conexão
$host = "localhost"; // ou o endereço do seu servidor
$user = "root";      // seu usuário do MySQL
$password = " ";          // sua senha do MySQL (se houver)
$dbname = "hurti"; // nome do banco de dados

// Criar a conexão
$conn = new mysqli($host, $user, $pass, $dbname);

// Verificar a conexão
if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}
?>
