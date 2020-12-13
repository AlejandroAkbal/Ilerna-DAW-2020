<?php

$dbconnect = require_once('conexion.php');

$sql = "SELECT * FROM noticias;";

$query = mysqli_query($dbconnect, $sql);

if (!$query) {
    die(mysqli_error($dbconnect));
}

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
