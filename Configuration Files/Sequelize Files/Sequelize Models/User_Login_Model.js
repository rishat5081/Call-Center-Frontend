const { Sequelize, DataTypes, Model } = require('sequelize'),
    sequelize = require('../Sequelize Config')
const User_call_Center_Info = require('./user_call_center_info')

class User_Login extends Model { }

User_Login.init({
    user_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        validate: {
            max: 11
        }
    },
    user_full_name: {
        type: DataTypes.TEXT,
        allowNull: false,
        // autoIncrement: false,
        ////defaultValue: 'saad sohail'
    },
    user_username: {
        type: DataTypes.TEXT,
        allowNull: false,
        ////defaultValue: 'saad1234'
    },
    user_email: {
        type: DataTypes.TEXT,
        allowNull: false,
        ////defaultValue: 'rishat.5081@gmail.com'
    },
    user_contact_Number: {
        type: DataTypes.TEXT,
        allowNull: false,
        ////defaultValue: 'saad1234'
    },
    user_password: {
        type: DataTypes.TEXT,
        allowNull: false,
        ////defaultValue: 'saad1234'
    },
    //this will take you the table of the database table in which the type of the user is defined....
    user_Type_user_type_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
            max: 11,
            isNumeric: true
        },
        ////defaultValue: 'saad1234',
        references: {
            model: 'user_type',
            key: 'user_type_id'
        }
        // references: "user_type",
        // referencesKey: "user_type_id"
    },
    //foreign key of the admin who add this user data
    user_added_Admin_id: {
        type: DataTypes.INTEGER,
        references: {
            model: 'user_added_admin',
            key: 'user_added_Admin_id'
        },
        // references: 'user_added_admin',
        // referencesKey: "user_added_Admin_id",
        allowNull: false,
        ////defaultValue: 'saad1234'
    },
    user_first_time_login: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        ////defaultValue: 'saad1234'
    },
},
    {
        freezeTableName: true,
        sequelize,
        modelName: 'User_Login',
        tableName: 'user_information',
        createdAt: false,
        updatedAt: false
    })

// one to many relationship 
User_Login.hasMany(User_call_Center_Info, { foreignKey: 'user_id' })

User_call_Center_Info.belongsTo(User_Login, { foreignKey: 'user_id', targetKey: "user_id" })


// fetching the results of the data of one to many relationship tables

// User_call_Center_Info.findAll({
//     include: [{
//         model: User_Login,
//         required: true
//     }], where: { "user_id": 1 }
// }).then((res) => console.log(res[0].dataValues))











// User_Login.findAll({ where: { user_email: "binfarooq@gmail.com" } })
//     .then((response) => {
//         console.log(response)
//     })
//     .catch((error) => {
//         console.log(error)
//     })




// User_Login.findOne({ attributes: ['user_id','user_full_name'], where: { user_id: 0 } })
// .then((res)=>console.log(res))

// select * from User_Login where user_id = 0 
// User_Login.findAll({ where: { user_id: 0 } })
//     .then((res) => console.log(res[0].dataValues))

















//adding the user data into the database table.... so noice and cleannnnn
// const aa = User_Login.create({
//     user_full_name: "Saad", user_username: "usernamee",
//     user_email: 'rishat.5081@gmail.com', user_contact_Number: '03221', user_password: 'saad1234',
//     user_Type_user_type_id: 1, user_added_Admin_id: 1
// }).then((res)=>console.log(res)).catch((err)=>console.log(err))




// the defined model is the class itself
//console.log(User_Login === sequelize.models.User_Login) // true

// let createTable_function = async () => {
//     await User_Login.sync({ force: true })
// }
// createTable_function().then((response) => {
//     console.log('Response', response)
// }).catch((error) => {
//     console.log('Error', error)
// })


// how to insert into Database
// const abc = User_Login.create({ username: 'SAAAAAAAAAAAAAAAAAAAAAAAAAAAD' })
// console.log(JSON.stringify(abc, null, 4))
// console.log(abc.username)


//const abc = User_Login.build({ username: 'SAAA.000000000000AD' })
//console.log(abc instanceof User_Login);




module.exports = User_Login