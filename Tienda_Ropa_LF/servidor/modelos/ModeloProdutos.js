import bbdd from "../database/db.js";
import { DataTypes } from "sequelize";

const ModeloProducto = bbdd.define('Producto', {
    nombre: { type: DataTypes.STRING },
    marca: { type: DataTypes.STRING },
    precio: { type: DataTypes.DECIMAL(10, 2) },
    stock: { type: DataTypes.INTEGER },
    color: { type: DataTypes.STRING },
    categoria: { type: DataTypes.STRING }
});

const PrendaSuperior = bbdd.define('Prenda_Superior', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: ModeloProducto,
            key: 'id'
        }
    },
    tipo_manga: { type: DataTypes.STRING }
});

const PrendaInferior = bbdd.define('Prenda_Inferior', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: ModeloProducto,
            key: 'id'
        }
    },
    tipo_longitud: { type: DataTypes.STRING }
});

const Accesorio = bbdd.define('Accesorio', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: ModeloProducto,
            key: 'id'
        }
    },
    tipo: { type: DataTypes.STRING }
});

const Zapatillas = bbdd.define('Zapatillas', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: ModeloProducto,
            key: 'id'
        }
    },
    capsula_aire: { type: DataTypes.TINYINT }
});

export default { ModeloProducto, PrendaSuperior, PrendaInferior, Accesorio, Zapatillas };
