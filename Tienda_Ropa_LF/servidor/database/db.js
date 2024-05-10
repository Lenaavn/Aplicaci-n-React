import { Sequelize } from 'sequelize';

const bbdd = new Sequelize ('Tienda_Ropa_LF', 'root', 'root', {
    host:'localhost',
    dialect:'mysql'
});

export default bbdd;

