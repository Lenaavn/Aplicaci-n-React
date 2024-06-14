import Express from 'express';
import cors from 'cors';
import db from './database/db.js';
import productRoutes from './rutas/rutasProductos.js';
import userRoutes from './rutas/rutasUsuarios.js';
import { pay } from './rutas/pay.js';
import ModeloProducto from './modelos/ModeloProdutos.js'

const app = Express();

app.use(cors());
app.use(Express.json());
app.use('/productos', productRoutes);
app.use('/usuarios', userRoutes);
app.use('/pago', pay);

const PORT = process.env.PORT || 3001;

app.listen(PORT, async () => {
    try {
        await db.authenticate();
        console.log('Conexión exitosa a la base de datos');
        const productos = await ModeloProducto.findAll({
            attributes: ['id', 'stock', 'stockMin', 'nombre']
        });
        let productosStock = {};
        let productosStockMinimo = {};
        productos.forEach(producto => {
            productosStock[producto.dataValues.id] = producto.dataValues.stock;
            productosStockMinimo[producto.dataValues.id] = { stockMin: producto.dataValues.stockMin, nombre: producto.dataValues.nombre };
        });
        console.log(productosStockMinimo);
        // Exporta los objetos una vez obtenidos
        module.exports = { productosStock, productosStockMinimo };
    } catch (error) {
        console.error(`Error de conexión a la base de datos: ${error}`);
    }
    console.log(`Servidor en ejecución en el puerto ${PORT}`);
});
