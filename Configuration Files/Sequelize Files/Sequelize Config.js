const { Sequelize } = require('sequelize')
require('dotenv').config()
const sequelize = new Sequelize(process.env.database, process.env.user, '', {
    host: process.env.host,
    dialect: 'mysql'
});
try {
    sequelize.authenticate().then((res) => {
        console.log('Connection has been established successfully.')
    })
        .catch((error) => {
            console.log(error)
        })

} catch (error) {
    console.error('Unable to connect to the database:');
}







module.exports = sequelize