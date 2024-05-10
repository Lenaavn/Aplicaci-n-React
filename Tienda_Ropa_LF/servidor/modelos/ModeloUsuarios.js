import bbdd from "../database/db.js";

// Son tipos de datos extraidos de la bbdd ( atributo de sequelize )
import { DataTypes } from "sequelize"; 

const ModeloUsuario = bbdd.define ('Usuarios', {
    nombre_usuario: {type: DataTypes.STRING},
    nombre: {type: DataTypes.STRING},
    apellidos: {type: DataTypes.STRING},
    edad: {type: DataTypes.NUMBER},
    telefono: {type: DataTypes.INTEGER},
    email: {type: DataTypes.STRING},
    direccion: {type: DataTypes.STRING},
    contrasena: {type: DataTypes.STRING},
    fecha_creacion_cuenta: {type: DataTypes.DATE}

});

export default ModeloUsuario;