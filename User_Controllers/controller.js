const { response } = require('express')
const call_center_compaign_info = require('../Configuration Files/Sequelize Files/Sequelize Models/call_center_compaign_info')
const call_Center_Info = require('../Configuration Files/Sequelize Files/Sequelize Models/call_center_info')

const User_Login = require('../Configuration Files/Sequelize Files/Sequelize Models/User_Login_Model'),
    User_call_Center_Info = require('../Configuration Files/Sequelize Files/Sequelize Models/call_center_info'),
    call_Center_Employee_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_employee'),
    contact_Lists_modal = require('../Configuration Files/Sequelize Files/Sequelize Models/Contacts_lists'),
    employee_calling_Contacts = require('../Configuration Files/Sequelize Files/Sequelize Models/employee_calling_Contacts'),
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
        /**
         * adding the employee into the database
         * and getting back the response of the database
         */

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
        /**
         * if the response if valid then rendering the updated status and 
         * if the response is the not valid then it will render error status
         */


        db_Response
            .then((response) => {
                res.send({ response: "Updated" })
            })
            .catch((error) => {
                res.send({ error })
            })


    })



    /**
     * This will update the Employee information 
     * it will bring all the Employee the new information
     * and hit the database and update the info..
     */


    app.post('/updateEmployee_info', (req, res) => {
        const hashPassword = bcrypt.hashSync(req.body.emp_password, salt_For_Bycrypt)

        /**getting the response of the database 
         * because it will just touch the and get back
         */
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
            .then()
            .then((dataBaseResponse) => {
                return dataBaseResponse
            })
            .catch((error) => {
                return error
            })
        /**
         * Now checking the response that the is valid or not 
         * then if the response is not valid then response of the server will render error 
         * else if the response is valid then response will be Updated
         */

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
    })

    /**
     * This controller is used to edit any information that a use can made
     * it will bring all the values to this controller and update the database...
     * it will get the values of the new or updated values of the Compaign
     * and update the values
     * and use of sync method return the status of the database
     */
    app.post('/edit_Compaign_info_AJAX', (req, res) => {


        const dataBaseResponse = call_center_compaign_info.update({
            compaign_name: req.body.compaign_name,
            compaign_type: req.body.compaign_type,
            compaign_country: req.body.compaign_country,
            compaign_start_Date: req.body.compaign_start_Date
        }, {
            where: {
                compaign_id: req.body.comapign_id
            }
        })
            .then()
            .then((response) => { return response })
            .catch((error) => { return error })


        dataBaseResponse
            .then((response) => {
                if (response)
                    res.send({ result: 'Updated', response })
            })
            .catch((error) => {
                res.send({ result: 'Error', error })
            })

    })

    /**
     * this controller will insert the new compaign into the database
     * it will bring in new Compaign info from Manage Compaign.EJS file modal
     */

    app.post('/add_new_Compaign_info_AJAX', (req, res) => {

        console.log(req.session.passport);

        const db_Response = call_center_compaign_info.create({
            compaign_name: req.body.compaign_name,
            compaign_type: req.body.compaign_type,
            compaign_country: req.body.compaign_country,
            compaign_start_Date: req.body.compaign_start_Date,
            call_cent_id: req.session.passport.user.call_Center_Info.call_cent_id
        })
            .then()
            .then((response) => {
                return response
            })
            .catch((error) => {
                return error
            })


        db_Response
            .then((response) => {
                res.send({ result: 'Added', response })
            })
            .catch((error) => {
                res.send({ result: 'Error', error })
            })



    })



    /**
     * This controller is responsibles to toggle the
     * boolean value of the Employee_isPaused to the email
     */

    app.post('/toggle_access_of_DID_for_Employees', (req, res) => {

        const dBResponse = call_Center_Employee_Model.update({
            emp_isPaused: req.body.booleanValue
        },
            {
                where: {
                    emp_email: req.body.emp_email,
                    // compaign_id: req.body.compaign_id,
                    did_Num_id: req.body.did_Num_id
                }
            })
            .then()
            .then((response) => {
                return response
            })
            .catch((error) => {
                return error
            })

        dBResponse
            .then((response) => {

                res.send({ result: "Updated", response })
            })
            .catch((error) => {
                res.send({ result: "Error", error })
            })



    })



    app.get('/addContacts_to_List', (req, res) => {
        var d = new Date(),
            curr_date = d.getDate(),
            curr_month = d.getMonth() + 1,
            curr_year = d.getFullYear(),
            hours = d.getHours(),
            minutes = d.getMinutes(),
            seconds = d.getSeconds()

        const addContacts_toEmployee = async () => {
            await contact_Lists_modal.findAll({
                where: {
                    contact_used_status: 0
                },
                limit: 10
            })
                .then((response) => {
                    for (const iterator of response) {
                        console.log(iterator.dataValues)
                        contact_Lists_modal.update({
                            contact_used_status: true
                        }, {
                            where: {
                                contact_ID: iterator.dataValues.contact_ID
                            }
                        })
                        employee_calling_Contacts.create({
                            time: hours + ":" + minutes + ":" + seconds,
                            date: curr_date + "-" + curr_month + "-" + curr_year,
                            status: false,
                            emp_id: req.session.passport.user.emp_id,
                            contact_ID: iterator.dataValues.contact_ID
                        })
                    }
                    res.status(200).send({ response })
                })
        }
        addContacts_toEmployee()
    })













}