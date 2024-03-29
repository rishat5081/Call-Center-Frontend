const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config'),
    call_center_compaign = require('./call_center_compaign_info'),
    call_cent_employee = require('./call_cent_employee')

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
    },
    emp_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: "call_cent_employee",
            key: "emp_id"
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


call_center_compaign.hasMany(call_cent_sales, { foreignKey: "compaign_id" })

call_cent_sales.belongsTo(call_center_compaign, { foreignKey: "compaign_id", targetKey: "compaign_id" })

call_cent_employee.hasMany(call_cent_sales, { foreignKey: "emp_id" })

call_cent_sales.belongsTo(call_cent_employee, { foreignKey: "emp_id", targetKey: "emp_id" })



module.exports = call_cent_sales