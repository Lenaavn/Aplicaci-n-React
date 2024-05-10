import ModeloUsuario from "../modelos/ModeloUsuarios.js";

// Obtiene todos los usuarios
export const getAllUsers = async (req, res) => {
    try {
        const usuarios = await ModeloUsuario.findAll()
        res.json(usuarios)
    } catch (error) {
        res.json( {message: error.message})
    }
}

// Crea un usuario
export const creacionUsuario = async (req, res) => {
    try {
        await ModeloUsuario.create(req.body)
        res.json({
            'Mensaje': 'Usuario Creado'
        })
    } catch (error) {
        res.json( {message: error.message})
    }
}

// Actualiza el usuario
export const actuUsuario = async (req, res) => {
    try {
        await ModeloUsuario.update(req.body, {
            where: {id: req.params.id}
        })
        res.json({
            'Mensaje': 'Usuario Actualizado'
        })
    } catch (error) {
        res.json( {message: error.message})
    }
} 

// Obtiene un usuario en especifico
export const getUsuario = async (req, res) => {
    try {
        const usuario = await ModeloUsuario.findAll({
            where: {id:req.params.id}
        })
        res.json(user[0])
    } catch (error) {
        res.json( {message: error.message})
    }
}
