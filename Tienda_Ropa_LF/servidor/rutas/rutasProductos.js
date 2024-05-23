import express from "express";
import { getAllProducts, creacionProducto, ActuProducto, getProducto, borrarProducto } from "../controladores/ControlProductos.js";

const rutas = express.Router();

rutas.get('/', getAllProducts);
rutas.get('/:id', getProducto);
rutas.post('/', creacionProducto);
rutas.put('/:id', ActuProducto);
rutas.delete('/:id', borrarProducto);

export default rutas;
