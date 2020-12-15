<?php
  $title = "Formulario usuario";
  require_once("html_top.php");
?>

  <style>
      #form_usuario {
          display: flex;
          flex-direction: column;
      }
  </style>

  <form id="form_usuario" action="" method="post">

      <label for="nombre">Nombre</label>
      <input type="text" name="nombre" id="nombre" maxlength="20" required />

      <label for="password">Password</label>
      <input type="password" name="contraseña" id="contraseña" maxlength="20" required />

      <label for="email">Email</label>
      <input type="email" name="email" id="email" maxlength="20" />

      <label for="edad">Edad</label>
      <input type="number" name="edad" id="edad" min="1" max="100" required />

      <label for="fecha_nacimiento">Fecha de nacimiento</label>
      <input type="date" name="fecha_nacimiento" id="fecha_nacimiento" required />

      <label for="direccion">Direccion</label>
      <input type="text" name="direccion" id="direccion" maxlength="30" required />

      <label for="codigo_postal">Codigo postal</label>
      <input type="number" name="codigo_postal" id="codigo_postal" max="999999" required />

      <label for="provincia">Provincia</label>
      <input type="text" name="provincia" id="provincia" maxlength="30" required />

      <label for="genero">Genero</label>
      <select name="genero" id="genero" required>
          <option value="hombre">Hombre</option>
          <option value="mujer">Mujer</option>
      </select>

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
      $nombre = $contraseña = $email = $edad = $fecha_nacimiento = $direccion = $codigo_postal = $provincia = $genero = "";
      $error_message_required_form_data = "Please, enter data on all required forms.";

      if (!empty($_POST["nombre"])) {
        $nombre = "\"{$_POST["nombre"]}\"";
      } else {
          die($error_message_required_form_data);
      }

      if (!empty($_POST["contraseña"])) {
        $contraseña = "\"{$_POST["contraseña"]}\"";
      } else {
          die($error_message_required_form_data);
      }

      if (!empty($_POST["email"])) {
        $email = "\"{$_POST["email"]}\"";
      } else {
          $email = "NULL";
      }

      if (!empty($_POST["edad"])) {
        $edad = "\"{$_POST["edad"]}\"";
      } else {
          die($error_message_required_form_data);
      }

      if (!empty($_POST["fecha_nacimiento"])) {
        $fecha_nacimiento = "\"{$_POST["fecha_nacimiento"]}\"";
      } else {
          die($error_message_required_form_data);
      }

      if (!empty($_POST["direccion"])) {
        $direccion = "\"{$_POST["direccion"]}\"";
      } else {
          die($error_message_required_form_data);
      }

      if (!empty($_POST["codigo_postal"])) {
        $codigo_postal = "\"{$_POST["codigo_postal"]}\"";
      } else {
          die($error_message_required_form_data);
      }

      if (!empty($_POST["provincia"])) {
        $provincia = "\"{$_POST["provincia"]}\"";
      } else {
          die($error_message_required_form_data);
      }

      if (!empty($_POST["genero"])) {
        $genero = "\"{$_POST["genero"]}\"";
      } else {
          die($error_message_required_form_data);
      }
      
      // Code
      $sql = "INSERT INTO usuarios (nombre, contraseña, email, edad, fecha_nacimiento, direccion, codigo_postal, provincia, genero) VALUES ({$nombre}, {$contraseña}, {$email}, {$edad}, {$fecha_nacimiento}, {$direccion}, {$codigo_postal}, {$provincia}, {$genero});";

      $query = $db_functions->run_sql($sql);

      echo "Data successfully sent.";
  }
  ?>

<?php
  require_once("html_bottom.php");
?>