<?php

$dbconnect = require_once('conexion.php');

$sql = "SELECT * FROM usuarios;";

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
