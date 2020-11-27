var express = require('express'),
    router = express.Router(),
    employees_modal = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_employee'),
    call_center_sales = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_sales'),
    login_logout_modal = require('../Configuration Files/Sequelize Files/Sequelize Models/login_logout'),
    Contacts_lists = require('../Configuration Files/Sequelize Files/Sequelize Models/Contacts_lists'),
    employee_calling_Contacts = require('../Configuration Files/Sequelize Files/Sequelize Models/employee_calling_Contacts'),
    sequelize = require('../Configuration Files/Sequelize Files/Sequelize Config')

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
    res.status(200).render('emp_login')
})


/**getting the 
 * employee information from the DB and also getting the sales count from the sales table 
 * to show the user about the total sales count on its dashboard to encourage him/her
 */
router.get('/edashboard', user_logged_In, (req, res) => {

    const dbResponse = call_center_sales.findAll({

        attributes: { include: [[sequelize.fn('COUNT', sequelize.col('sales_id')), 'Sales_Of_Employee']] },
        include: {
            model: employees_modal,
            where: {
                emp_id: req.session.passport.user.emp_id
            },
            required: false
        },
        where:
        {
            emp_id: req.session.passport.user.emp_id,

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
            res.status(200).render('edashboard', { response })
        })
        .catch((error) => {
            res.status(500).render('edashboard', req.flash('danger', 'Sorry! Error in loading'))
        })

})


/**
 * sales page will display the success sales and all the pending sales also 
 */

router.get('/empSales', user_logged_In, (req, res) => {

    const dbResponse = call_center_sales.findAll({
        // attributes: { include: [[sequelize.fn('COUNT', sequelize.col('sales_id')), 'Sales_Of_Employee']] },
        where:
        {
            emp_id: req.session.passport.user.emp_id,
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
            res.status(200).render('empSales', { response })
        })
        .catch((error) => {
            res.status(500).render('empSales', req.flash('danger', 'Sorry! Error in loading'))
        })
    // res.render('empSales', { response: req.session.passport.user  })

})


/**
 * it is the route that will be responsible 
 * for the make call
 */

router.get('/makeCall', user_logged_In, (req, res) => {

    const dbResponse = employee_calling_Contacts.findAll({
        attributes: ["contact_ID"],
        where: {
            emp_id: req.session.passport.user.emp_id,
            status: false
        }
    })
        .then()
        .then((response) => {
            console.log(response)
            return response
        })
        .catch((error) => {
            return error
        })


    dbResponse
        .then((response) => {
            res.status(200).render('makeCall', { response })
        })
        .catch((error) => {
            res.status(500).render('makeCall', req.flash('danger', 'Sorry! Error in loading'))
        })
    // res.render('empSales', { response: req.session.passport.user  })

})

/**
 * it is the route that will be responsible 
 * upload profile image of the employee 
 * it will allow the employee to change its profile image
 */

router.get('/uploadProfileImage', user_logged_In, (req, res) => {
    console.log(req.session.passport.user)
    res.status(200).render('uploadProfileImage')
})





router.get('/elogout', (req, res) => {
    var d = new Date(),
        curr_date = d.getDate(),
        curr_month = d.getMonth() + 1,
        curr_year = d.getFullYear(),
        hours = d.getHours(),
        minutes = d.getMinutes(),
        seconds = d.getSeconds()

    login_logout_modal.update({
        logoutTime: hours + ":" + minutes + ":" + seconds,
        activityStatus: true
    }, {
        where: {
            emp_id: req.session.passport.user.emp_id,
            activityDate: curr_date + "-" + curr_month + "-" + curr_year,
            activityStatus: false
        }
    })
        .then((dbResult) => {
            if (dbResult)
                console.log("Logout Activity Triggered")
        })
        .catch((error) => {
            console.log("Logout Activity Error " + error)
        })
    req.session.destroy()
    res.redirect('/emp/elogin')
})

module.exports = router


