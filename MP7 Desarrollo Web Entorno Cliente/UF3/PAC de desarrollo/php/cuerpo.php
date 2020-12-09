<?php

$dbconnect = require_once('conexion.php');

$sql = "SELECT * FROM noticias ORDER BY hora_creacion DESC LIMIT 5;";

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
                <th>Titulo</th>
                <th>Contenido</th>
                <th>Autor</th>
                <th>Fecha</th>
                <th>Likes</th>
            </tr>
        </thead>
        <tbody>";

while ($row = mysqli_fetch_array($query)) {
    echo
        "   <tr>
                <td>{$row['titulo']}</td>
                <td>{$row['contenido']}</td>
                <td>{$row['autor']}</td>
                <td>{$row['hora_creacion']}</td>
                <td>{$row['likes']}</td>
            </tr>";
}

echo "  </tbody>
    </table>";
