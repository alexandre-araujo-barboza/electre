<!DOCTYPE html>
<html lang="pt">
<head>
  <meta charset="UTF-8">
  <meta name="author" content="Alexandre Araujo Barbosa">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Electre</title>
</head>
<body>
<h1>Electre</h1>
<hr>
<?php
  require 'credentials.php';
  $connection = new MySQLi($host, $user, $pass, $db);
  if ($connection->connect_errno) {
    die("Erro na conexão: ".mysqli_connect_error());
  }
  mysqli_set_charset($connection, "utf8");
  $sql = "SHOW TABLES FROM " . $db;
  $result = mysqli_query($connection, $sql);
  if (!$result) {
      die ("A listagem das tabelas falhou: " . mysqli_error($connection));
  }
  echo "<h4>Lista de Matrizes:</h4>";
  echo "<ol>";
  while ($row = mysqli_fetch_row($result)) {
    $table = substr($row[0], 7);
    echo '<li><a href = "open.php?table=' . $table . '">'. $table . "</a></li>\n";
  }
  echo "</ol>";
  mysqli_free_result($result);
?>
<input type="button" onclick="javascript:location.href='create.php'" value="Nova" />
</body>
</html>