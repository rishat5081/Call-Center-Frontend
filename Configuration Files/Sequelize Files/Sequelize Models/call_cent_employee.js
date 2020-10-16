const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config'),
    call_center_info = require('./call_center_info'),
    call_center_compaign = require('./call_center_compaign_info'),
    did_Number_info_Modal = require('./did_Number_info')

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
    emp_deleted: {
        allowNull: false,
        type: DataTypes.BOOLEAN,
        defaultValue: false
    },
    emp_isPaused: {
        allowNull: false,
        type: DataTypes.BOOLEAN,
        defaultValue: false
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
    },
    did_Num_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: "did_Number_Info_modal",
            key: "did_Num_id"
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

//creating one to many relationship of 
// call center have many employees
call_center_info.hasMany(call_cent_employee, { foreignKey: 'call_cent_id' })

call_cent_employee.belongsTo(call_center_info, {
    foreignKey: 'call_cent_id', targetKey: 'call_cent_id'
})



//creating relationship of call center compaigns 
// one compaign have many employees

call_center_compaign.hasMany(call_cent_employee, { foreignKey: 'compaign_id' })

call_cent_employee.belongsTo(call_center_compaign, { foreignKey: 'compaign_id' })


/**
 * Creating One to One Relationship with the
 * DID Number because one employee can only have access
 * to one DID Number
 */
did_Number_info_Modal.hasOne(call_cent_employee, { foreignKey: "did_Num_id" })
call_cent_employee.belongsTo(did_Number_info_Modal, { targetKey: "did_Num_id", foreignKey: "did_Num_id" })

module.exports = call_cent_employee