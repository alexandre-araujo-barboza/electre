<html lang="pt">
<head>
  <meta charset="UTF-8">
  <meta name="author" content="Alexandre Araujo Barbosa">
  <title>Electre</title>
</head>
<body>
<h1>Electre</h1>
<hr>    
<?php if (empty($_POST)) : ?>
  <form method="post" action="">
  <h4>Tamanho da matriz:</h4>
  <table style="border:0;">
    <tr>
      <td>    
        <label for="rows">Linhas:</label>
      </td>
      <td>    
        <label for="colss">Colunas:</label>
      </td>
    </tr>
    <tr>
      <td>    
        <input id="rows" name="rows" type="number" min="2" max="8" />
      </td>
      <td>    
        <input id="cols" name="cols" type="number" min="2" max="8" />
      </td>
    </tr>
    <tr>
      <td style="text-align:center;" colspan=2>
        <input type="submit" value="OK" style="padding-left:12px;padding-right:12px;" />    
      </td>
    </tr>        
  </table>  
  </form>
<?php else : ?>
  <?php if (isset($_POST['rows']) && isset($_POST['cols'])) : ?>
    <form method="post" action="" accept-charset="UTF-8">
    <h4>Propriedades da matriz:</h4>
    <table style="border:0;">
      <tr>
        <td>
          <ol>linhas (Alternativas)
          <?php for ($i=0, $j=1; $i < $_POST['rows']; $i++, $j++) : ?>
            <li>Alt<?= $j ?>:&nbsp;<input type="text" name="L<?= $j ?>" maxlength="32" />
          <?php endfor ; ?> 
          </ol>
        </td>     
        <td>
          <ol>colunas (Critérios)
          <?php for ($i=0, $j=1; $i < $_POST['cols']; $i++, $j++) : ?>
            <li>Crit<?= $j ?>:&nbsp;<input type="text" name="C<?= $j ?>" maxlength="32"/>
          <?php endfor ; ?>
          </ol>
        </td>     
      </tr>
      <tr>
        <td style="text-align:center;" colspan=2>
          Nome da Tabela:&nbsp;<input type="text" name="title" maxlength="16"/>    
        </td>
      </tr>
      <tr>
        <td style="text-align:center;" colspan=2>
          <br /><input type="submit" value="OK" style="padding-left:12px;padding-right:12px;" />    
        </td>
      </tr>
    </table>
    </form>
  <?php elseif (isset($_POST['title'])) : ?>
    <?php
      require 'credentials.php';
      $connection = new MySQLi($host, $user, $pass, $db);
      if ($connection->connect_errno) {
        die("Erro na conexão: ".mysqli_connect_error());
      }
      mysqli_set_charset($connection, "utf8");
      $name = "modelo_" . strtolower($_POST['title']);
      $sql =  'CREATE TABLE `' . $name . '` (';
      $sql .= '`alternativa` varchar(32) NOT NULL ';
      foreach ($_POST as $chave => $valor) {
        if (substr($chave, 0, 1) == "C") {
          $sql .= ', `' . strtolower($valor) . '` float(7,4) default 0';
        }
      }
      $sql .= ') ENGINE=InnoDB DEFAULT CHARSET=utf8;';
      $result = mysqli_query($connection, $sql);
      if (!$result) {
        die("A criação da tabela falhou: ".mysqli_error($connection));
      } else {
        foreach ($_POST as $chave => $valor) {
          if (substr($chave, 0, 1) == "L") {
            $sql  = "INSERT INTO " . $name . "(alternativa) VALUES ('" . strtolower($valor) . "')";
            $result = mysqli_query($connection, $sql);
            if (!$result) {
              die("A inclusão das alternativas falhou: ".mysqli_error($connection));
            }
          }
        }
        $sql  = "INSERT INTO " . $name . "(alternativa) VALUES ('peso')";
        $result = mysqli_query($connection, $sql);
        if (!$result) {
          die("A inclusão do peso falhou: ".mysqli_error($connection));
        }    
      }
    ?>
    <h5>Criação da matriz efetuada com êxito!</h5>
    <a href="index.php">voltar ao índice</a>
  <?php endif ; ?>
<?php endif ; ?>
</body>
</html>
