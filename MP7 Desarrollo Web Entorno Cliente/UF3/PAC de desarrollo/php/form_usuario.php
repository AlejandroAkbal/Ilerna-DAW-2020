<form id="form_usuario" action="#" method="post">

    <label for="nombre">Nombre</label>
    <input type="text" name="nombre" id="nombre" maxlength="20" required />

    <label for="password">Password</label>
    <input type="password" name="password" id="password" maxlength="20" required />

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
        <option value="macho">Macho</option>
        <option value="hembra">Hembra</option>
    </select>

    <input type="reset" value="Resetear" />
    <input type="submit" value="Enviar" />
</form>

<style>
    #form_usuario {
        display: flex;
        flex-direction: column;
    }
</style>