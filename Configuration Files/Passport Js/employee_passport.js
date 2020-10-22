const empPassport = require('passport'),
    bcrypt = require('bcrypt'),
    LocalStrategy = require('passport-local').Strategy,
    Employee_Modal = require('../Sequelize Files/Sequelize Models/call_cent_employee')


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
            where:
            {
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
        if (validate_Password(password, response.emp_password))
            return done(null, response)
        else
            return done(null, false, req.flash('danger', 'Incorrect Password'))

    })

}


function validate_Password(user_loginForm_password, hashPassword) {
    return bcrypt.compareSync(user_loginForm_password, hashPassword)
}












module.exports = empPassport