const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config'),
    call_cent_employee = require('./call_cent_employee'),
    call_center_info = require('./call_center_info'),

    Employee_Notification = sequelize.define('Employee_Notification', {
        id: {
            primaryKey: true,
            allowNull: false,
            autoIncrement: true,
            type: DataTypes.INTEGER,
            validate: {
                max: 11
            }
        },
        notification_text: {
            allowNull: false,
            type: DataTypes.TEXT
        },
        notification_status: {
            allowNull: false,
            type: DataTypes.TEXT
        },
        emp_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references:
            {
                model: 'call_cent_employee',
                key: 'emp_id'
            }
        },
        call_cent_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references:
            {
                model: 'call_Center_Info',
                key: 'call_cent_id'
            }
        }

    },
        {
            freezeTableName: true,
            sequelize,
            modelName: 'Employee_Notification',
            tableName: 'employees_notification',
            createdAt: false,
            updatedAt: false

        })

call_cent_employee.hasMany(Employee_Notification, { foreignKey: 'emp_id' })
Employee_Notification.belongsTo(call_cent_employee, { targetKey: 'emp_id', foreignKey: 'emp_id' })

module.exports = Employee_Notification