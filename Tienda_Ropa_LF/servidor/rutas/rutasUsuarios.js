import express from "express";
import { getAllUsers, creacionUsuario, actuUsuario, getUsuario } from "../controladores/ControlUsuarios.js";

const rutas = express.Router();

rutas.get('/', getAllUsers)
rutas.get('/:id', getUsuario)
rutas.post('/', creacionUsuario)
rutas.put('/:id', actuUsuario)

export default rutas;