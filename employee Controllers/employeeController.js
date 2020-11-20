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
                    console.log(response);
                    if (response.length === 0)
                        res.status(200).send({ status: 'There is no more contacts' })
                    else {
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
                    }
                    res.status(200).send({ response })
                })
                .catch((error) => {
                    res.status(500).send({ error })
                })
        }
        addContacts_toEmployee()
    })



    app.post('/updateStatusof_Contact', (req, res) => {
        var d = new Date(),
            curr_date = d.getDate(),
            curr_month = d.getMonth() + 1,
            curr_year = d.getFullYear(),
            hours = d.getHours(),
            minutes = d.getMinutes(),
            seconds = d.getSeconds()

        const updateContact_Status = async () => {
            await employee_calling_Contacts.update({
                status: true,
                callingStatus: req.body.status,
                callingTime: hours + ":" + minutes + ":" + seconds,
                callingDate: curr_date + "-" + curr_month + "-" + curr_year,
                callMinutes: req.body.minutes,
                callSeconds: req.body.seconds
            }, {
                where: {
                    emp_id: req.session.passport.user.emp_id,
                    contact_ID: req.body.contact_ID
                }
            })
                .then()
                .then((response) => {
                    if (response.length > 0)
                        res.status(200).send(response)
                })
                .catch((error) => {
                    if (error.length > 0)
                        res.status(500).send(error)
                })
        }
        updateContact_Status()
    })







}