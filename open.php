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
<?php if (empty($_POST)) : ?>
  <h4>Matriz: <?= $_GET['table'] ?></h4>
  <form method="post" action="">
  <table style="border:0;">
    <tr>
      <?php
        $span = 0;
      ?>
      <?php  foreach ($rows[0] as $chave => $valor) :?>
        <th>
          <?= $chave ?>
        </th>
        <?php
          $span++;
        ?>
      <?php endforeach ;?>
    </tr>
    <?php for ($i = 0; $i < count($rows); $i++) : ?>
      <tr>
      <?php
        $col = 0;
      ?>    
      <?php  foreach ($rows[$i] as $chave => $valor) :?>
        <td>
          <?php if ($col == 0) : ?>
            <?= $valor ?>
          <?php elseif ($i == count($rows)-1) : ?>
            <input type="number" value="" name="peso-<?=$col?>" maxlength="2"/>  
          <?php else :?>
            <input type="number" value="" name="crit<?=$i+1?><?=$col?>" maxlength="2"/>
          <?php endif; ?>    
        </td>
        <?php
          $col++;
        ?>
      <?php endforeach ;?>
      </tr>
    <?php endfor ;?>
    <tr>
      <td style="text-align:center;" colspan=<?= $span ?>>
        <input type="submit" value="Salvar" style="padding-left:12px;padding-right:12px;" />&nbsp;
        <input type="button" value="Executar" style="padding-left:12px;padding-right:12px;" onclick="javascript:location.href='run.php?table=<?= $_GET['table'] ?>'"/>
      </td>
    </tr>
  </table>
  </form>
<?php else : ?>
    <pre>
    
    <?php print_r($_POST) ?>
    
    </pre>
<?php endif ; ?>
</body>
</html>