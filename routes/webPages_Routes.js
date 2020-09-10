
const express = require('express'),
  router = express.Router(),
  User_Login = require('../Configuration Files/Sequelize Files/Sequelize Models/User_Login_Model')
//permissions if the user is log in or not.
var user_logged_In = (req, res, next) => {
  //checking if the connected user IP address
  // console.log('The IP address of connected user is :: ', req.connection.remoteAddress)
  if (req.isAuthenticated()) {
    //  console.log(req.session.passport.user)
    res.locals.user = req.session.passport.user
    next()
  }
  else
    res.redirect('/login')
}

var not_logged_in = (req, res, next) => {
  console.log('The IP address of connected user is :: ', req.connection.remoteAddress)
  if (req.session.passport) {
    // console.log(req.session.passport.user)
    res.locals.user = req.session.passport.user
    next()
  }
  else {
    res.locals.user = 'null'
    next()
  }
}
/**
 * Get Home Page Route
 */
router.get('/', not_logged_in, function (req, res, next) {
  // req.flash('success', 'Flash is back!')
  res.render('homePage')
})


/* GET Login page. */
router.get('/login', not_logged_in, function (req, res, next) {
  // req.flash('success', 'Flash is back!')
  res.render('login')
})

/* GET Sign Up page. */
router.get('/signUp', not_logged_in, function (req, res, next) {
  // req.flash('success', 'Flash is back!')
  res.render('signUp')
})

//log out route 
router.get('/logOut', user_logged_In, function (req, res, next) {
  req.logout()
  req.session.destroy()
  res.redirect('/login')
})

//change password route
router.get('/chnage_Password', user_logged_In, function (req, res, next) {

  res.render('change_Password', { user_id: req.session.passport.user.user_id })
})



module.exports = router;
