const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config'),
    call_cent_employee = require('./call_cent_employee'),

    login_logout_activities = sequelize.define('login_logout_activities', {
        login_logout_id: {
            autoIncrement: true,
            allowNull: null,
            type: DataTypes.INTEGER,
            primaryKey: true,
            validate: {
                max: 11
            }
        },
        activityDate: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
        loginTime: {
            type: DataTypes.TEXT,
            allowNull: false
        },
        logoutTime: {
            type: DataTypes.TEXT,
            allowNull: true
        },
        activityStatus: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
            defaultValue: false
        },
        ipAddress: {
            type: DataTypes.TEXT,
            allowNull: false
        },
        emp_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references:
            {
                model: 'call_cent_employee',
                key: 'emp_id'
            }
        }
    }, {
        freezeTableName: true,
        sequelize,
        modelName: 'login_logout_activities',
        tableName: 'login/logout_activities',
        createdAt: false,
        updatedAt: false
    })

/**
 * Creating one to many relationship between 
 * Employee and login_logout_activities 
 */
call_cent_employee.hasMany(login_logout_activities, { foreignKey: 'emp_id' })
login_logout_activities.belongsTo(call_cent_employee, { targetKey: 'emp_id', foreignKey: 'emp_id' })



module.exports = login_logout_activities