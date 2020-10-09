const { DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config')


class call_Center_Info extends Model { }

call_Center_Info.init({
    call_cent_id: {
        autoIncrement: true,
        type: DataTypes.INTEGER,
        primaryKey: true,
        validate: {
            max: 11,
            isNumeric: true
        }
    },
    call_cent_Name: {
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
    inbound_outbound: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    call_Center_deleted: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false
    },
    callback_dialing: {
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
            model: 'call_cent_user_info',
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
    modelName: 'call_Center_Info',
    tableName: 'call_center_info',
    createdAt: false,
    updatedAt: false
})



module.exports = call_Center_Info