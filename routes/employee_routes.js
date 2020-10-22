const { response } = require('express')

var express = require('express'),
    router = express.Router(),
    employees_modal = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_employee')

//permissions if the user is log in or not.
var user_logged_In = (req, res, next) => {
    //checking if the connected user IP address
    // console.log('The IP address of connected user is :: ', req.connection.remoteAddress)
    if (req.isAuthenticated()) {
        // console.log(req.session.passport.user)
        res.locals.user = req.session.passport.user
        next()
    }
    else
        res.redirect('/emp/elogin')
}

var not_logged_in = (req, res, next) => {
    console.log('The IP address of connected user is :: ', req.connection.remoteAddress)
    if (req.session.passport) {
        // console.log(req.session.passport.user)
        res.locals.user = req.session.passport.user
        next()
    }
    else {
        res.locals.user = 'not logged In'
        next()
    }
}

router.get('/elogin', not_logged_in, (req, res) => {
    res.render('emp_login')
})



router.get('/edashboard', user_logged_In, (req, res) => {
    const dbResponse = employees_modal.findOne({
        where:
        {
            emp_email: req.session.passport.user.emp_email
        }
    })
        .then()
        .then((response) => {
            return response
        })
        .catch((error) => {
            return error
        })


    dbResponse
        .then((response) => {
            console.log(response);
            res.render('edashboard', { response })
        })
        .catch((error) => {
            res.render('emp_login', req.flash('danger', 'Sorry! Error in loading'))
        })

})



router.get('/empSales', user_logged_In, (req, res) => {
    res.render('edashboard', { response: req.session.passport.user })

})




router.get('/elogout', (req, res) => {
    req.session.destroy()
    res.redirect('/emp/elogin')
})

module.exports = router
