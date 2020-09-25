const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config')

class call_cent_employee extends Model { }

call_cent_employee.init({
    emp_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
        validate: {
            max: 11
        }
    },
    emp_fullName: {
        allowNull: false,
        type: DataTypes.TEXT
    },
    emp_username: {
        allowNull: false,
        type: DataTypes.TEXT
    },
    emp_email: {
        allowNull: false,
        type: DataTypes.TEXT
    },
    emp_password: {
        allowNull: false,
        type: DataTypes.TEXT
    },
    emp_role: {
        allowNull: false,
        type: DataTypes.TEXT
    },
    emp_timing: {
        allowNull: false,
        type: DataTypes.TEXT
    },
    emp_salary: {
        allowNull: false,
        type: DataTypes.TEXT
    },
    emp_commission: {
        allowNull: false,
        type: DataTypes.TEXT
    },
    emp_target: {
        allowNull: false,
        type: DataTypes.INTEGER
    },
    call_cent_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: "call_center_info",
            key: "call_cent_id"
        }
    },
    compaign_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: "call_cent_compaign_info",
            key: "compaign_id"
        }
    }
}, {
    freezeTableName: true,
    updatedAt: false,
    createdAt: false,
    sequelize,
    modelName: 'call_cent_employee',
    tableName: 'call_center_employees',
})

module.exports = call_cent_employee