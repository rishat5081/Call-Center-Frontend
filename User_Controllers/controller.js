const User_Login = require('../Configuration Files/Sequelize Files/Sequelize Models/User_Login_Model'),
    User_call_Center_Info = require('../Configuration Files/Sequelize Files/Sequelize Models/user_call_center_info'),
    bcrypt = require('bcrypt'),
    salt_For_Change_Password = 10

require('dotenv').config()
module.exports = (app) => {





    //change user password route 
    app.post('/change_User_Passowrd/:user_id', (req, res) => {
        console.log(req.body.new_Password)
        const hash_Password = bcrypt.hashSync(req.body.new_Password, salt_For_Change_Password)
        console.log(hash_Password)
        const response = User_Login.update({ user_password: hash_Password }
            , {
                where: {
                    user_id: req.session.passport.user.user_id
                }
            })
            .then((res) => {
                return res
            })
            .catch((err) => {
                return err
            })
        // res.locals.messages = req.flash('success', 'Password is Changed Successfully')

        response.then((ress) => {
            if (!ress[0])
                res.json({ type: 'danger', message: 'Oops!! Password is Not Changed' })

            else
                res.json({ type: 'success', message: 'Password is Changed Successfully' })

        })


        // if (response)
        //      res.json({ type: 'success', message: 'Password is Changed Successfully' })
        // else
        //     res.json({ type: 'danger', message: 'Oops!! Password is Not Changed' })

    })

    app.post('/change_Call_Center_Name', (req, res) => {
        console.log(req.body.new_Call_CenterName)
        const response = User_call_Center_Info.update({ callCenterName: req.body.new_Call_CenterName }
            , {
                where: {
                    user_id: req.session.passport.user.user_id
                }
            })
            .then()
            .then((res) => {
                return res
            })
            .catch((err) => {
                return err
            })


        response.then((response) => {
            if (response[0]) {
                res.send({ new_callCenter_Name: req.body.new_Call_CenterName, type: 'success', message: 'Successfully! Call Center Name Changed' })
            }
        })
            .catch((error) => {
                res.send({ type: 'danger', message: 'Sorry! There is an error with system.' })
            })
        //console.log(response)
    })





    // User_Login.update({ user_password: 1 }
    //     , {
    //         where: {
    //             user_id: req.session.passport.user.user_id
    //         }
    //     })




}