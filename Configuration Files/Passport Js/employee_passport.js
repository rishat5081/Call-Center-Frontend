const empPassport = require('passport'),
    bcrypt = require('bcrypt'),
    LocalStrategy = require('passport-local').Strategy,
    Employee_Modal = require('../Sequelize Files/Sequelize Models/call_cent_employee'),
    login_logout_Modal = require('../Sequelize Files/Sequelize Models/login_logout')



/**
 * Serialize and Deserialize will be use once
 * Goto passport.js 
 * handle there
 */
empPassport.use('local-login-forEmployees', new LocalStrategy({

    usernameField: 'login_email',
    passwordField: 'login_password',
    passReqToCallback: true
}, authenticate_login))

function authenticate_login(req, email, password, done) {

    //hiting the database for once only...
    const user_Data_Response = Employee_Modal.findOne(
        {
            where: {
                emp_email: email
            }
        })
        .then()
        .then((res) => {
            return res
        })
        .catch((err) => {
            return err
        })

    user_Data_Response.then((response) => {
        if (response.emp_deleted)
            return done(null, false, req.flash('danger', 'Sorry! No user found'))
        if (validate_Password(password, response.emp_password)) {
            var d = new Date(),
                curr_date = d.getDate(),
                curr_month = d.getMonth() + 1,
                curr_year = d.getFullYear(),
                hours = d.getHours(),
                minutes = d.getMinutes(),
                seconds = d.getSeconds()
            /**
             * Adding the activity of the login 
             * which will store the login activity 
             */
            login_logout_Modal.create({
                loginTime: hours + ":" + minutes + ":" + seconds,
                activityDate: curr_date + "-" + curr_month + "-" + curr_year,
                logoutTime: null,
                ipAddress: req.connection.remoteAddress,
                emp_id: response.dataValues.emp_id

            })
                .then((dbResult) => {
                    if (dbResult)
                        console.log("Login Activity Triggered !")
                })
                .catch((error) => {
                    console.log("Login Activity Error  " + error)
                })
            //sending the response, all went okay....
            return done(null, response)
        }
        else
            return done(null, false, req.flash('danger', 'Incorrect Password'))

    })

}


function validate_Password(user_loginForm_password, hashPassword) {
    return bcrypt.compareSync(user_loginForm_password, hashPassword)
}


module.exports = empPassport