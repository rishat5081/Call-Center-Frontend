const { Sequelize, DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config')

class User_call_Center_Info extends Model { }

User_call_Center_Info.init({
    user_call_center_request_id: {
        autoIncrement: true,
        type: DataTypes.INTEGER,
        primaryKey: true,
        validate: {
            max: 11,
            isNumeric: true
        }
    },
    callCenterName: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    no_Of_Seat: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
            max: 11,
            isNumeric: true
        }
    },
    nameofCompaing: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    nameOfCountry: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    inbound_outbound_select: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    callback_Dialing_YES_checkBox: {
        type: DataTypes.TINYINT,
        allowNull: false,
        autoIncrement: false,
        validate: {
            max: 1
        }
    },
    numberOf_Callback: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
            max: 11,
            isNumeric: true
        }
    },
    user_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'user_information',
            key: 'user_id'
        },
        validate: {
            max: 11,
            isNumeric: true
        }
    }
}, {
    freezeTableName: true,
    sequelize,
    modelName: 'User_call_Center_Info',
    tableName: 'user_call_center_info',
    createdAt: false,
    updatedAt: false
})


module.exports = User_call_Center_Info