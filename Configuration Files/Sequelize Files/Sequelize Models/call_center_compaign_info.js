const { DataTypes, Model } = require('sequelize'),
    call_center_info = require('./call_center_info'),
    sequelize = require('../Sequelize Config')


class call_center_compaign_info extends Model { }

call_center_compaign_info.init({
    campaign_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
        validate: {
            max: 11
        }
    },
    campaign_name: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    campaign_country: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    campaign_start_Date: {
        type: DataTypes.TEXT,
        allowNull: false
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
    tableName: 'call_center_campaign_info',
    createdAt: false,
    updatedAt: false
})

call_center_info.hasMany(call_center_compaign_info, { foreignKey: 'call_cent_id' })

call_center_compaign_info.belongsTo(call_center_info, { foreignKey: 'call_cent_id', targetKey: "call_cent_id" })



module.exports = call_center_compaign_info


