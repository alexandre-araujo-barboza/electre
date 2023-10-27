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
  if (!isset($_GET['table'])) {
    echo '<span style="color:red;">Consulta inválida!</span>';
    exit;
  }
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
          <?php else :?>
            <?php if ($rows[$i]['alternativa'] == 'meta') : ?>
              <select name="crit<?=$i+1?><?=$col?>">
                <option value="1" <?= $rows[$i][$chave] == 1 ? 'selected' : '' ?>>MAX</option>
                <option value="-1" <?= $rows[$i][$chave] == -1 ? 'selected' : '' ?>>MIN</option>
              </select>  
            <?php else : ?>
              <input type="number" step="any" name="crit<?=$i+1?><?=$col?>" value="<?= $valor ?>"/>
            <?php endif; ?>    
          <?php endif; ?>    
        </td>
        <?php
          $col++;
        ?>
      <?php endforeach ;?>
      </tr>
    <?php endfor ;?>
    <tr>
      <td style="text-align:center;" colspan=<?= $span ?>><br />
        <input type="submit" value="Salvar" style="padding-left:12px;padding-right:12px;" />&nbsp;
        <input type="button" value="Executar" style="padding-left:12px;padding-right:12px;" onclick="javascript:location.href='run.php?table=<?= $_GET['table'] ?>'"/>
      </td>
    </tr>
  </table>
  </form>
<?php else : ?>
  <?php
    for ($i = 0; $i < count($rows); $i++) {
      $j = 0;
      $sql = "UPDATE modelo_" . $_GET['table'] . " SET ";
      foreach ($rows[$i] as $chave => $valor) {
        $key = 'crit' . ($i+1) . ($j+1);
        if ($chave != 'alternativa') {
          $sql .= "`" . $chave . "` = " . $_POST[$key] . ",";
          $j++;
        } 
      }
      $sql = substr($sql, 0, -1);  
      $sql .= " WHERE alternativa = '" . $rows[$i]['alternativa'] . "'";
      $result = mysqli_query($connection, $sql);
      if (!$result) {
        die("A alteração falhou: ".mysqli_error($connection));
      }     
    }  
  ?>
  <h5>Alteração da matriz efetuada com êxito!</h5>
  <a href="index.php">voltar ao índice</a>
<?php endif ; ?>
</body>
</html>