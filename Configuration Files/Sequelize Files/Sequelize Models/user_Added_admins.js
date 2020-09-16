const { Sequelize, DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config'),
    User_login_Information = require('./User_Login_Model')

class user_added_Admins extends Model { }

user_added_Admins.init({

    user_added_Admin_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        validate: {
            max: 11
        }
    },
    user_added_Admin_name: {
        type: DataTypes.TEXT,
        allowNull: false,
        autoIncrement: false,
        // defaultValue: 'Admin saad sohail'
    },
    user_added_Admin_email: {
        type: DataTypes.TEXT,
        allowNull: false,
        autoIncrement: false,
        // defaultValue: 'saadsohail@gmial.com'
    }
},
    {
        freezeTableName: true,
        sequelize,
        modelName: 'user_added_Admins',
        tableName: 'user_added_admin',
        createdAt: false,
        updatedAt: true
    })

    // user_added_Admins.findAll().then((res)=>{
    //     console.log(res)
    // })

// user_added_Admins.hasOne(User_login_Information)
