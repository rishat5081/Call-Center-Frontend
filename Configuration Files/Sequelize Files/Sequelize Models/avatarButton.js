const {
    DataTypes,
    Model
} = require('sequelize'),
    sequelize = require('../Sequelize Config'),
    avatarCategory_Modal = require('./avatarCategory'),

    avatar_button_modal = sequelize.define('avatar_button_modal', {
        avatar_btn_id: {
            autoIncrement: true,
            allowNull: null,
            type: DataTypes.INTEGER,
            primaryKey: true,
            validate: {
                max: 11
            }
        },
        btn_text: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
        deletedStatus: {
            type: DataTypes.BOOLEAN,
            defaultValue: 0,
            allowNull: false,
        },
        avatar_category_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'avatarCategory_Modal',
                key: 'avatar_category_id'
            }
        }
    }, {
        freezeTableName: true,
        sequelize,
        modelName: 'avatar_button_modal',
        tableName: 'avatarbuttons',
        createdAt: false,
        updatedAt: false
    })

/**
 * Creating one to many relationship between 
 * Employee and login_logout_activities 
 */
avatarCategory_Modal.hasMany(avatar_button_modal, {
    foreignKey: 'avatar_category_id'
})
avatar_button_modal.belongsTo(avatarCategory_Modal, {
    targetKey: 'avatar_category_id',
    foreignKey: 'avatar_category_id'
})



module.exports = avatar_button_modal