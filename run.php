<html lang="pt">
<head>
  <meta charset="UTF-8">
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
  $table = "modelo_" . $_GET['table'];
  $sql = "SELECT * FROM " . $table;
  $result = mysqli_query($connection, $sql);
  if (!$result) {
    $die = "A consulta falhou: ".mysqli_error($connection);
  } else {
    $rows = array();
    $i = 0;
    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
      $rows[$i] = $row;
      $i++;
    }
    mysqli_free_result($result);
  }
?>
<h4>Matriz: <?= $_GET['table'] ?></h4>
<?php
  $matrix = array();
  $fields = array();
?>
<table style="border:0;">
  <tr>
    <?php  foreach ($rows[0] as $chave => $valor) :?>
      <th>
        <?= $chave ?>
        <?php 
         $fields[] = $chave;
        ?>
      </th>
    <?php endforeach ;?>
  </tr>
  <?php for ($i = 0; $i < count($rows); $i++) : ?>
    <tr>
    <?php
      $col = 0;
    ?>    
    <?php  foreach ($rows[$i] as $chave => $valor) :?>
      <td>
        <?= $valor ?>  
        <?php
          if ($col > 0) {
            $matrix[$i][$col-1] = $valor; 
          }
        ?>
      </td>
      <?php
        $col++;
      ?>
    <?php endforeach ;?>
    </tr>
  <?php endfor ;?>
</table>
  <h5>Normalização dos pesos:</h5>
  <?php 
    $weight = array_pop($matrix);
    $sum    = array_sum($weight);
    $normal = array();
    echo "<ol>";
    for ($i = 0 ; $i < count($weight); $i++) {
      $normal[$i] = $weight[$i] / $sum;
      echo "<li>Peso (" . $fields[$i+1]. "): " . $normal[$i] . "</li>";
    }
    echo "</ol>";
  ?> 
</body>  
</html>
