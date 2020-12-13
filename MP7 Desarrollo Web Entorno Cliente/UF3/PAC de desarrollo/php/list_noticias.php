<?php
// Imports
require_once('conexion.php');
require_once('funciones_bd.php');

$db_connect = new DB_Connect();
$db_connect->create_connection();
$db_connection = $db_connect->get_connection();

$db_functions = new DB_Functions($db_connection);

// Code
$sql = "SELECT * FROM noticias;";

$query = $db_functions->run_sql($sql);

if (!(mysqli_num_rows($query) > 0)) {
    die("No records matching your query were found.");
}

echo
    "<table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Titulo</th>
                <th>Contenido</th>
                <th>Autor</th>
                <th>Hora de creacion</th>
                <th>Likes</th>
            </tr>
        </thead>
        <tbody>";

while ($row = mysqli_fetch_array($query)) {
    echo
        "   <tr>
                <td>{$row['id']}</td>
                <td>{$row['titulo']}</td>
                <td>{$row['contenido']}</td>
                <td>{$row['autor']}</td>
                <td>{$row['hora_creacion']}</td>
                <td>{$row['likes']}</td>
            </tr>";
}

echo "  </tbody>
    </table>";
