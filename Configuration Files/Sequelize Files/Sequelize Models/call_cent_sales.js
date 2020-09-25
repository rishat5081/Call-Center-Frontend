const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config')

class call_cent_sales extends Model { }

call_cent_sales.init({
    sales_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    sale_status: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    sale_amount: {
        type: DataTypes.FLOAT,
        allowNull: false
    },
    sale_date: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    compaign_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: "call_center_compaign_info",
            key: "compaign_id"
        }
    }
}, {
    freezeTableName: true,
    updatedAt: false,
    createdAt: false,
    sequelize,
    modelName: 'call_cent_sales',
    tableName: 'call_center_sales',
})
module.exports = call_cent_sales