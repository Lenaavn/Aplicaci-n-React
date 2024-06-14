import ModeloProducto from '../modelos/ModeloProductos.js';

// Obtiene todos los productos
export const getAllProducts = async (req, res) => {
    try {
        const productos = await ModeloProducto.findAll();
        res.json(productos);
    } catch (error) {
        res.json({ message: error.message });
    }
}

// Crea un producto
export const creacionProducto = async (req, res) => {
    try {
        const newProduct = await ModeloProducto.create(req.body);
        res.json({
            'Mensaje': 'Producto Creado',
            'Producto': newProduct
        });
    } catch (error) {
        res.json({ message: error.message });
    }
}

// Actualiza un producto
export const ActuProducto = async (req, res) => {
    try {
        await ModeloProducto.update(req.body, {
            where: { id: req.params.id }
        });
        res.json({ 'Mensaje': 'Producto Actualizado' });
    } catch (error) {
        res.json({ message: error.message });
    }
}

// Obtiene un producto en específico
export const getProducto = async (req, res) => {
    try {
        const producto = await ModeloProducto.findAll({
            where: { id: req.params.id }
        });
        if (producto.length > 0) {
            res.json(producto[0]);
        } else {
            res.json({ message: 'Producto no encontrado' });
        }
    } catch (error) {
        res.json({ message: error.message });
    }
}

// Elimina un producto
export const borrarProducto = async (req, res) => {
    try {
        const rowsDeleted = await ModeloProducto.destroy({
            where: { id: req.params.id }
        });
        if (rowsDeleted > 0) {
            res.json({ 'Mensaje': 'Producto Eliminado' });
        } else {
            res.json({ message: 'Producto no encontrado' });
        }
    } catch (error) {
        res.json({ message: error.message });
    }
}
