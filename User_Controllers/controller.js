const User_Login = require('../Configuration Files/Sequelize Files/Sequelize Models/User_Login_Model'),
    User_call_Center_Info = require('../Configuration Files/Sequelize Files/Sequelize Models/call_center_info'),
    call_Center_Employee_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_employee'),
    bcrypt = require('bcrypt'),
    salt_For_Bycrypt = 10

require('dotenv').config()
module.exports = (app) => {





    //change user password route 
    app.post('/change_User_Passowrd/:user_id', (req, res) => {
        console.log(req.body.new_Password)
        const hash_Password = bcrypt.hashSync(req.body.new_Password, salt_For_Bycrypt)
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


        const dataBaseResponse = call_Center_Employee_Model.update({ emp_deleted: true },
            {
                where: {
                    emp_id: req.body.employee_id
                }
            })
            .then((dataBaseResponse) => {
                return dataBaseResponse
            })
            .catch((error) => {
                return error
            })

        //resolving promise

        dataBaseResponse
            .then((response) => {
                if (response) {
                    res.send({ result: 'Updated', response })
                }
            })
            .catch((error) => {
                res.send({ result: 'Error', error })
            })
    })


    /**
     * this controller will add the a new into the DB.
     * there will be no validation on the server
     * because email should be unique and it is been validated and verified at the client side
     * you have to put the data into the DB.
     */
    app.post('/add_Employee_AJAX_call', (req, res) => {
        const hashPassword = bcrypt.hashSync(req.body.password, salt_For_Bycrypt);


        const db_Response = call_Center_Employee_Model.create({
            emp_fullName: req.body.fullname,
            emp_username: req.body.username,
            emp_email: req.body.email,
            emp_password: hashPassword,
            emp_role: req.body.role,
            emp_timing: req.body.timing,
            emp_salary: req.body.salary,
            emp_commission: req.body.commission,
            emp_target: req.body.target,
            call_cent_id: req.session.passport.user.call_Center_Info.call_cent_id,
            compaign_id: req.body.compaign
        })
            .then()
            .then((dBResponse) => {
                return dBResponse
            })
            .catch((error) => {
                return error
            })



        db_Response
            .then((response) => {
                res.send({ response: "Updated" })
            })
            .catch((error) => {
                res.send({ error })
            })


    })






    app.post('/updateEmployee_info', (req, res) => {
        const hashPassword = bcrypt.hashSync(req.body.emp_password, salt_For_Bycrypt)
        console.log(hashPassword,req.body.emp_fullname)

        const dataBaseResponse = call_Center_Employee_Model.update({
            emp_fullName: req.body.emp_fullname,
            emp_username: req.body.emp_username,
            emp_email: req.body.emp_email,
            emp_password: hashPassword,
            emp_role: req.body.emp_role,
            emp_timing: req.body.emp_timing,
            emp_salary: req.body.emp_salary,
            emp_commission: req.body.emp_commission,
            emp_target: req.body.emp_target,
            call_cent_id: req.session.passport.user.call_Center_Info.call_cent_id,
            compaign_id: req.body.emp_compaign_modal,
        },
            {
                where: {
                    emp_id: req.body.edit_employee_id
                }
            })
            .then((dataBaseResponse) => {
                return dataBaseResponse
            })
            .catch((error) => {
                return error
            })


        dataBaseResponse
            .then((response) => {
                if (response) {
                    console.log(response)
                    res.send({ result: 'Updated', response })
                }
            })
            .catch((error) => {
                res.send({ result: 'Error', error })
            })








        res.send(hashPassword)
    })











}