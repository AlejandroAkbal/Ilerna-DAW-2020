<form id="form_usuario" action="#" method="post">

    <label for="titulo">Titulo</label>
    <input type="text" name="titulo" id="titulo" maxlength="60" required />

    <label for="contenido">Contenido</label>
    <textarea name="contenido" id="contenido" cols="30" rows="10" maxlength="300" required></textarea>

    <label for="autor">Autor</label>
    <input type="text" name="autor" id="autor" maxlength="20" required />

    <label for="hora_creacion">Hora de creacion</label>
    <input type="datetime" name="hora_creacion" id="hora_creacion" />

    <label for="likes">Likes</label>
    <input type="number" name="likes" id="likes" />


    <input type="reset" value="Resetear" />
    <input type="submit" value="Enviar" />
</form>

<style>
    #form_usuario {
        display: flex;
        flex-direction: column;
    }
</style>