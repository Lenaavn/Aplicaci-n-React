import bbdd from "../database/db.js";
import { DataTypes } from "sequelize";

// Definición del modelo Producto
const ModeloProducto = bbdd.define('Producto', {
    nombre: { type: DataTypes.STRING },
    marca: { type: DataTypes.STRING },
    precio: { type: DataTypes.DECIMAL(10, 2) },
    stock: { type: DataTypes.INTEGER },
    color: { type: DataTypes.STRING },
    categoria: { type: DataTypes.STRING }
});

// Definición del modelo PrendaSuperior
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

// Definición del modelo PrendaInferior
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

// Definición del modelo Accesorio
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

// Definición del modelo Zapatillas
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

// Establecer las relaciones explícitas
ModeloProducto.hasOne(PrendaSuperior, { foreignKey: 'id' });
PrendaSuperior.belongsTo(ModeloProducto, { foreignKey: 'id' });

ModeloProducto.hasOne(PrendaInferior, { foreignKey: 'id' });
PrendaInferior.belongsTo(ModeloProducto, { foreignKey: 'id' });

ModeloProducto.hasOne(Accesorio, { foreignKey: 'id' });
Accesorio.belongsTo(ModeloProducto, { foreignKey: 'id' });

ModeloProducto.hasOne(Zapatillas, { foreignKey: 'id' });
Zapatillas.belongsTo(ModeloProducto, { foreignKey: 'id' });

export { ModeloProducto, PrendaSuperior, PrendaInferior, Accesorio, Zapatillas };
