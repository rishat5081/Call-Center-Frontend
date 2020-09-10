const User_Login = require('../Configuration Files/Sequelize Files/Sequelize Models/User_Login_Model'),
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

    app.put('/abc', (req, res) => {
        console.log(req.body.new_Password)
        res.json("Saad")
    })

    // User_Login.update({ user_password: 1 }
    //     , {
    //         where: {
    //             user_id: req.session.passport.user.user_id
    //         }
    //     })




}