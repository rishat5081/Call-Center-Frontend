const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config'),
    call_cent_employee = require('./call_cent_employee'),
    call_Center_Info = require('./call_center_info'),
    call_Center_Compaign = require('./call_center_compaign_info')

class did_Number_Info_modal extends Model { }

did_Number_Info_modal.init({
    did_Num_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        validate: {
            max: 11
        }
    },
    did_Num_number: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    call_cent_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: "call_Center_Info",
            key: "call_cent_id"
        }
    },
    compaign_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: "call_center_compaign_info",
            key: "compaign_id"
        }
    }
},
    {
        freezeTableName: true,
        sequelize,
        modelName: 'did_Number_Info_modal',
        tableName: 'did_Numbers_info',
        createdAt: false,
        updatedAt: false
    })


/**
 * Creating one to many relationship
 * One call center have many DID Numbers 
 * Like there are many compaigns going on in one Call center
 */

call_Center_Info.hasMany(did_Number_Info_modal, { foreignKey: "call_cent_id" })
did_Number_Info_modal.belongsTo(call_Center_Info, { targetKey: "call_cent_id", foreignKey: "call_cent_id" })

/**
 * Creating one to many relationship
 * One compaign have did Number 
 * Compaign can have many did numbers 
 */
call_Center_Compaign.hasMany(did_Number_Info_modal, { foreignKey: "compaign_id" })
did_Number_Info_modal.belongsTo(call_Center_Compaign, { targetKey: "compaign_id", foreignKey: "compaign_id" })

module.exports = did_Number_Info_modal