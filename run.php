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
  <?php // índices de Concordância:
    $concordance = array();
    $size = count($matrix[0]);
    for ($i = 0; $i < count($matrix); $i++) {
      for ($j = 0; $j < count($matrix); $j++) {
        $sum  = 0;
        for ($k = 0; $k < count($matrix[$i]); $k++) {
          if ($i != $j) {
            if ($matrix[$i][$k] >= $matrix[$j][$k]) {
              $sum += $normal[$k];
            }
          }
        }
        $concordance[] = $sum;
      }
    }
    $matConcord = array(); 
    $row = -1;
    $col = 0;
    for ($i = 0; $i < count($concordance); $i++) {
      if ($i %($size+1) == 0) {
          $row++;
          $col = 0;  
      } else {
        $col++;
      }
      $matConcord[$row][$col] = $concordance[$i];
    }
?>
<h5>Matriz de Concordância:</h5>
<table style="border:0;">
  <tr>
    <th>&nbsp;</th>
    <?php for ($i = 0; $i < count($matConcord[0]); $i++) : ?>
      <th><?= "alt" . ($i+1) ?></th>
    <?php endfor ;?>
  </tr>
  <?php for ($i = 0; $i < count($matConcord); $i++) : ?>
    <tr>      
      <td><b>alt<?= ($i+1) ?></b></td>
      <?php for ($j = 0; $j < count($matConcord); $j++) : ?>
        <td style = "text-align:center;">
          <?php if ($i == $j) : ?>
            <span>-</span>
          <?php else :?>  
            <?= $matConcord[$i][$j] ?>
          <?php endif ; ?>  
        </td>
      <?php endfor ;?>
    </tr>
  <?php endfor ;?>    
</table>
<?php
  $omega = array();
  for ($i = 0; $i < count($matrix[0]); $i++) {
    $min = 99999999999;
    $max = -1;
    for ($j = 0; $j < count($matrix); $j++) {
      $current = $matrix[$j][$i];
      if ($current < $min) {
         $min = $current;
      }
      if ($current > $max) {
        $max = $current;
      }
      $omega[$i] = $max - $min;
    }
  }
?>
<h5>Calculo de ômega:</h5>
<ol>
  <?php for ($i = 0; $i < count($omega); $i++) : ?>
    <li>ômega (<?= $fields[$i+1] ?>): <?= $omega[$i] ?></li>
  <?php endfor; ?>
</ol>
<?php  // índices de Discordância:
  $discordance = array();
  $maxPositive = 0;
  for ($i = 0; $i < count($matrix); $i++) {
    for ($j = 0; $j < count($matrix); $j++) {
      $dif  = array();
      for ($k = 0; $k < count($matrix[$i]); $k++) {
        if ($i != $j) {
          for ($l = 0; $l < count($matrix[0]); $l++) {
            $dif[$l] = ($matrix[$j][$l] - $matrix[$i][$l]) / $omega[$l];
          }
        }
      }
      if (count($dif) > 0) {
        $maxPositive = max($dif);
        if ($maxPositive < 0) {
          $maxPositive = 0;
        }
        $discordance[] = $maxPositive;
      }
    }
  }
  $matDiscord = array(); 
  $row = -1;
  $col = 0;
  for ($i = 0; $i < count($discordance); $i++) {
    if ($i %($size) == 0) {
      $row++;
      $col = 0;  
    } else {
      $col++;
    }
    if ($row == $col) {
      $matDiscord[$row][$col] = "-";  
      $col++;
    }
    $matDiscord[$row][$col] = $discordance[$i];
  }
  $matDiscord[$row][$col +1] = "-";
?>
<h5>Matriz de Discordância:</h5>
<table style="border:0;">
  <tr>
    <th>&nbsp;</th>
    <?php for ($i = 0; $i < count($matDiscord[0]); $i++) : ?>
      <th><?= "alt" . ($i+1) ?></th>
    <?php endfor ;?>
  </tr>
  <?php for ($i = 0; $i < count($matDiscord); $i++) : ?>
    <tr>      
      <td><b>alt<?= ($i+1) ?></b></td>
      <?php for ($j = 0; $j < count($matDiscord); $j++) : ?>
        <td style = "text-align:center;">
          <?= $matDiscord[$i][$j] ?>
        </td>  
      <?php endfor ;?>
    </tr>
  <?php endfor ;?>    
</table>
    



</body>  
</html>
