const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config'),
    call_center_info = require('./call_center_info'),

    callee_Contact_data = sequelize.define('callee_Contact_data', {
        contact_ID: {
            primaryKey: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            validate:
            {
                max: 11
            }
        },
        contact_Name: {
            type: DataTypes.TEXT,
            allowNull: false
        },
        contact_Number:{
            type: DataTypes.TEXT,
            allowNull: false
        },
        contact_used_status: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
            defaultValue: false
        },
        call_cent_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: "call_Center_Info",
                key: "call_cent_id"
            }
        }
    }, {
        freezeTableName: true,
        sequelize,
        modelName: 'callee_Contact_data',
        tableName: 'contacts_lists',
        createdAt: false,
        updatedAt: false
    })

/**
 * Creating one to many relationship
 * relationship between call center information and also with the contact lists
 */

call_center_info.hasMany(callee_Contact_data, { foreignKey: 'call_cent_id' })

callee_Contact_data.belongsTo(call_center_info, { targetKey: 'call_cent_id', foreignKey: 'call_cent_id' })

/**
 * Creating one to many relationship 
 * between Call Center Contact lists and Employees
 */



module.exports = callee_Contact_data