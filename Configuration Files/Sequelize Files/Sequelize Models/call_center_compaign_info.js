const { DataTypes, Model } = require('sequelize'),
    call_center_info = require('./call_center_info'),

    sequelize = require('../Sequelize Config')


class call_center_compaign_info extends Model { }

call_center_compaign_info.init({
    compaign_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
        validate: {
            max: 11
        }
    },
    compaign_name: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    compaign_country: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    compaign_start_Date: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    compaign_type: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    compaign_deleted: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false
    },
    call_cent_id: {
        type: DataTypes.INTEGER,
        references: {
            model: "call_Center_Info",
            key: "call_cent_id"
        },
        allowNull: false
    }
}, {
    freezeTableName: true,
    sequelize,
    modelName: 'call_center_compaign_info',
    tableName: 'call_center_compaign_info',
    createdAt: false,
    updatedAt: false
})

call_center_info.hasMany(call_center_compaign_info, { foreignKey: 'call_cent_id' })

call_center_compaign_info.belongsTo(call_center_info, { foreignKey: 'call_cent_id', targetKey: "call_cent_id" })






module.exports = call_center_compaign_info




// SELECT * FROM `contacts_lists`WHERE contact_used_status = 0 LIMIT 4
