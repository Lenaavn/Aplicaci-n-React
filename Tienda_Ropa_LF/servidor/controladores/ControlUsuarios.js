import ModeloUsuario from "../modelos/ModeloUsuarios.js";

// Obtiene todos los usuarios
export const getAllUsers = async (req, res) => {
    try {
        const usuarios = await ModeloUsuario.findAll();
        res.json(usuarios);
    } catch (error) {
        res.json({ message: error.message });
    }
}

// Crea un usuario
export const creacionUsuario = async (req, res) => {
    try {
        await ModeloUsuario.create(req.body);
        res.json({
            'Mensaje': 'Usuario Creado'
        });
    } catch (error) {
        res.json({ message: error.message });
    }
}

// Actualiza el usuario
export const actuUsuario = async (req, res) => {
    try {
        await ModeloUsuario.update(req.body, {
            where: { id: req.params.id }
        });
        res.json({
            'Mensaje': 'Usuario Actualizado'
        });
    } catch (error) {
        res.json({ message: error.message });
    }
}

// Obtiene un usuario en específico
export const getUsuario = async (req, res) => {
    try {
        const usuario = await ModeloUsuario.findAll({
            where: { id: req.params.id }
        });
        if (usuario.length > 0) {
            res.json(usuario[0]);
        } else {
            res.json({ message: 'Usuario no encontrado' });
        }
    } catch (error) {
        res.json({ message: error.message });
    }
}

