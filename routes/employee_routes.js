var express = require('express'),
    router = express.Router(),
    employees_modal = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_employee'),
    call_center_sales = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_sales'),
    callee_contact_data = require('../Configuration Files/Sequelize Files/Sequelize Models/callee_contact_data'),
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
    res.render('emp_login')
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
            res.render('edashboard', { response, profilePic: req.session.passport.user.emp_profile_pic })
        })
        .catch((error) => {
            res.render('edashboard', req.flash('danger', 'Sorry! Error in loading'))
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
            res.render('empSales', { response, profilePic: req.session.passport.user.emp_profile_pic })
        })
        .catch((error) => {
            res.render('empSales', req.flash('danger', 'Sorry! Error in loading'))
        })
    // res.render('empSales', { response: req.session.passport.user, profilePic: req.session.passport.user.emp_profile_pic })

})





router.get('/makeCall', user_logged_In, (req, res) => {
    console.log(req.session.passport.user)

    const dbResponse = callee_contact_data.findAll({
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
            res.render('makeCall', { response, profilePic: req.session.passport.user.emp_profile_pic })
        })
        .catch((error) => {
            res.render('makeCall', req.flash('danger', 'Sorry! Error in loading'))
        })
    // res.render('empSales', { response: req.session.passport.user, profilePic: req.session.passport.user.emp_profile_pic })

})





































router.get('/elogout', (req, res) => {
    req.session.destroy()
    res.redirect('/emp/elogin')
})

module.exports = router



// call_center_sales.findAll({
//     attributes: {
//         include: [
//             [sequelize.fn('COUNT', sequelize.col('sales_id')), "Sales_Of_Employee"]
//         ]
//     },
//     where:
//     {
//         emp_id: 2,

//     }
// })
//     .then()
//     .then((response) => {
//         console.log(response)
//     })
//     .catch((error) => {
//         console.log(error)
//     })

    // 'sales_id',
    // 'sale_status',
    // 'sale_amount',
    // 'sale_date',
    // 'compaign_id',
    // 'emp_id',