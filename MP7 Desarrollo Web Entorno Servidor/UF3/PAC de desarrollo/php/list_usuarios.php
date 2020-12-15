<?php
    $title = "Lista de usuarios";
    require_once("html_top.php");
?>    
    
    <?php
    // Imports
    require_once('conexion.php');
    require_once('funciones_bd.php');

    $db_connect = new DB_Connect();
    $db_connect->create_connection();
    $db_connection = $db_connect->get_connection();

    $db_functions = new DB_Functions($db_connection);

    // Code
    $sql = "SELECT * FROM usuarios;";

    $query = $db_functions->run_sql($sql);

    if (!(mysqli_num_rows($query) > 0)) {
        die("No records matching your query were found.");
    }

    echo
        "<table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Contraseña</th>
                    <th>Email</th>
                    <th>Edad</th>
                    <th>Fecha de nacimiento</th>
                    <th>Direccion</th>
                    <th>Codigo postal</th>
                    <th>Provincia</th>
                    <th>Genero</th>
                </tr>
            </thead>
            <tbody>";

    while ($row = mysqli_fetch_array($query)) {
        echo
            "   <tr>
                    <td>{$row['id']}</td>
                    <td>{$row['nombre']}</td>
                    <td>{$row['contraseña']}</td>
                    <td>{$row['email']}</td>
                    <td>{$row['edad']}</td>
                    <td>{$row['fecha_nacimiento']}</td>
                    <td>{$row['direccion']}</td>
                    <td>{$row['codigo_postal']}</td>
                    <td>{$row['provincia']}</td>
                    <td>{$row['genero']}</td>
                </tr>";
    }

    echo "  </tbody>
        </table>";
    ?>

<?php
    require_once("html_bottom.php");
?>