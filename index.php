<html lang="pt">
<head>
  <meta charset="UTF-8">
  <title>Electre</title>
</head>
<body>
<h1>Electre</h1>
<hr>
<?php
  $host = "localhost";
  $user = "root";
  $pass = "";
  $db   = "electre";
  $connection = new MySQLi($host, $user, $pass, $db);
  if ($connection->connect_errno) {
    die("Erro na conexão: ".mysqli_connect_error());
  }
  mysqli_set_charset($connection, "utf8");
  
  $sql = "SHOW TABLES FROM electre";
  $result = mysqli_query($connection, $sql);
  if (!$result) {
      die ("A listagem das tabelas falhou: " . mysqli_error($connection));
      exit;
  }
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