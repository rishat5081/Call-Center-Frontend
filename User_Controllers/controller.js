const User_Login = require('../Configuration Files/Sequelize Files/Sequelize Models/User_Login_Model'),
    User_call_Center_Info = require('../Configuration Files/Sequelize Files/Sequelize Models/call_center_info'),
    call_Center_Employee_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_employee'),
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
    })


    /**
     * this controller is for the owner of the call center want to change the 
     * name of the call center 
     */
    app.post('/change_Call_Center_Name', (req, res) => {
        console.log(req.body.new_Call_CenterName)
        const response = User_call_Center_Info.update({ call_cent_Name: req.body.new_Call_CenterName }
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


    /**
     * This controller is used in the Manage Employee.EJS file 
     * it handles the working of the delete button which is present in front of the employee record
     * it will bring the employee id as the data and simply update the isdeleted to true
     */

    app.post('/delete_Employee_Data', (req, res) => {
        console.log(req.body)
        // call_Center_Employee_Model.update({ emp_deleted: 1 }, {
        //     where: {
        //         emp_id: req.body.emp_id
        //     }
        // })
        //     .then((response) => console.log(response))
        //     .catch((error) => console.log(error))







    })























}