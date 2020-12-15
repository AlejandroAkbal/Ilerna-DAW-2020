<?php
  $title = "Formulario noticias";
  require_once("html_top.php");
?>

  <style>
      #form_usuario {
          display: flex;
          flex-direction: column;
      }
  </style>

  <form id="form_usuario" action="" method="post">

      <label for="titulo">Titulo</label>
      <input type="text" name="titulo" id="titulo" maxlength="60" required />

      <label for="contenido">Contenido</label>
      <textarea name="contenido" id="contenido" cols="30" rows="10" maxlength="300" required></textarea>

      <label for="autor">Autor</label>
      <input type="text" name="autor" id="autor" maxlength="20" required />

      <label for="hora_creacion">Datetime de creacion</label>
      <input type="datetime" name="hora_creacion" id="hora_creacion" />

      <label for="likes">Likes</label>
      <input type="number" name="likes" id="likes" />


      <input type="reset" value="Resetear" />
      <input type="submit" value="Enviar" />
  </form>

  <?php
  // Imports
  require_once('conexion.php');
  require_once('funciones_bd.php');

  $db_connect = new DB_Connect();
  $db_connect->create_connection();
  $db_connection = $db_connect->get_connection();

  $db_functions = new DB_Functions($db_connection);


  if ($_SERVER["REQUEST_METHOD"] == "POST") {
      $titulo = $contenido = $autor = $hora_creacion = $likes = "";
      $error_message_required_form_data = "Please, enter data on all required forms.";

      if (!empty($_POST["titulo"])) {
        $titulo = "\"{$_POST["titulo"]}\"";
      } else {
          die($error_message_required_form_data);
      }

      if (!empty($_POST["contenido"])) {
        $contenido = "\"{$_POST["contenido"]}\"";
      } else {
          die($error_message_required_form_data);
      }

      if (!empty($_POST["autor"])) {
        $autor = "\"{$_POST["autor"]}\"";
      } else {
          die($error_message_required_form_data);
      }

      if (!empty($_POST["hora_creacion"])) {
        $hora_creacion = "\"{$_POST["hora_creacion"]}\"";
      } else {
          $hora_creacion = "DEFAULT";
      }

      if (!empty($_POST["likes"])) {
        $likes = "\"{$_POST["likes"]}\"";
      } else {
          $likes = "DEFAULT";
      }
      
      // Code
      $sql = "INSERT INTO noticias (titulo, contenido, autor, hora_creacion, likes) VALUES ({$titulo}, {$contenido}, {$autor}, {$hora_creacion}, {$likes});";

      $query = $db_functions->run_sql($sql);

      echo "Data successfully sent.";
  }
  ?>

<?php
  require_once("html_bottom.php");
?>