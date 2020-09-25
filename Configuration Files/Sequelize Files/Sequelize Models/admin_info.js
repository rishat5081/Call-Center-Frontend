const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config')

class Admin_Info extends Model { }

Admin_Info.init({
    admin_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        validate: {
            max: 11
        }
    },
    admin_username: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    admin_email: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    admin_password: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    admin_contact_Number:
    {
        type: DataTypes.TEXT,
        allowNull: false
    }
},
    {
        freezeTableName: true,
        sequelize,
        modelName: 'Admin_Info',
        tableName: 'admin_Info',
        createdAt: false,
        updatedAt: false
    })
module.exports = Admin_Info