const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config')

class callee_contact_data_modal extends Model { }

callee_contact_data_modal.init({
    callee_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        validate: {
            max: 11
        }
    },
    callee_name: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    callee_phoneNumber: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    callee_gender: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    callee_country: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    callee_status: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    emp_id: {
        type: DataTypes.INTEGER,
        autoIncrement: false,
        allowNull: false,
        references: {
            model: "call_cent_employee",
            key: "emp_id"
        }
    }
},
    {
        freezeTableName: true,
        sequelize,
        modelName: 'callee_contact_data_modal',
        tableName: 'callee_contact_data',
        createdAt: false,
        updatedAt: false
    })


    module.exports = callee_contact_data_modal