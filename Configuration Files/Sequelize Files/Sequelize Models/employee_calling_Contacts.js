const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config'),
    call_cent_employee = require('./call_cent_employee'),
    Contacts_lists = require('./Contacts_lists'),

    employee_calling_Contacts = sequelize.define('employee_calling_Contacts', {
        emp_calling_id: {
            autoIncrement: true,
            allowNull: null,
            type: DataTypes.INTEGER,
            primaryKey: true,
            validate: {
                max: 11
            }
        },
        time: {
            type: DataTypes.TEXT,
            allowNull: false
        },
        date: {
            type: DataTypes.TEXT,
            allowNull: false
        },
        callingStatus: {
            type: DataTypes.TEXT,
            allowNull: false,
            defaultValue: "null"
        },
        callingTime: {
            type: DataTypes.TEXT,
            allowNull: false,
            defaultValue: "null"
        },
        callingDate: {
            type: DataTypes.TEXT,
            allowNull: false,
            defaultValue: "null"
        },
        callMinutes: {
            type: DataTypes.TEXT,
            allowNull: false,
            defaultValue: "null"
        },
        callSeconds: {
            type: DataTypes.TEXT,
            allowNull: false,
            defaultValue: "null"
        },
        status: {
            allowNull: false,
            defaultValue: false,
            type: DataTypes.BOOLEAN
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
        contact_ID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references:
            {
                model: 'callee_Contact_data',
                key: 'contact_ID'
            }
        }
    },
        {
            freezeTableName: true,
            sequelize,
            modelName: 'employee_calling_Contacts',
            tableName: 'employee_calling_Contacts',
            createdAt: false,
            updatedAt: false
        })

/**
 * Creating one to many relationship
 * employee and calling database table 
 * this table is responsible when user press button to add the contacts
 * all the contacts from the callee_contact_data to this table 
 * it will hold the numbers and its status
 */

call_cent_employee.hasMany(employee_calling_Contacts, { foreignKey: 'emp_id' })
employee_calling_Contacts.belongsTo(call_cent_employee, { targetKey: 'emp_id', foreignKey: 'emp_id' })


/**
 * Creating one to many relationship
 * contact lists and calling database table 
 * it will redirect the contact of the callee 
 * 
 */

Contacts_lists.hasMany(employee_calling_Contacts, { foreignKey: 'contact_ID' })
employee_calling_Contacts.belongsTo(Contacts_lists, { targetKey: 'contact_ID', foreignKey: 'contact_ID' })


module.exports = employee_calling_Contacts