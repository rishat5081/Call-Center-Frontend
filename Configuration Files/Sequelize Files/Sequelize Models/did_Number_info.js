const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config')

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
            model: "",
            key: "call_cent_id"
        }
    },
    emp_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references:
        {
            model: "",
            key: "emp_id"
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

    module.exports = did_Number_Info_modal