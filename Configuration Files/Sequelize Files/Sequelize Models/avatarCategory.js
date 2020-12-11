const {
    DataTypes,
    Model
} = require('sequelize'),
    sequelize = require('../Sequelize Config'),
    call_center_compaign_info = require('./call_center_compaign_info'),

    avatarCategory_Modal = sequelize.define('avatarCategory_Modal', {
        avatar_category_id: {
            autoIncrement: true,
            allowNull: null,
            type: DataTypes.INTEGER,
            primaryKey: true,
            validate: {
                max: 11
            }
        },
        avatarCategory_name: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
        created_on: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
        deletedStatus: {
            type: DataTypes.BOOLEAN,
            defaultValue: 0,
            allowNull: false,
        },
        compaign_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'call_center_compaign_info',
                key: 'compaign_id'
            }
        }
    }, {
        freezeTableName: true,
        sequelize,
        modelName: 'avatarCategory_Modal',
        tableName: 'avatarcategory',
        createdAt: false,
        updatedAt: false
    })

/**
 * Creating one to many relationship between 
 * Employee and login_logout_activities 
 */
call_center_compaign_info.hasMany(avatarCategory_Modal, {
    foreignKey: 'compaign_id'
})
avatarCategory_Modal.belongsTo(call_center_compaign_info, {
    targetKey: 'compaign_id',
    foreignKey: 'compaign_id'
})



module.exports = avatarCategory_Modal