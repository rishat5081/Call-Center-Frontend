const {
  response
} = require('express')

var express = require('express'),
  router = express.Router(),
  //requiring the middleware which is used to 
  //check that the session have the user data or not 
  middleWares_Fucntions = require('./webPages_Routes'),

  //requiring the user call center information model schema
  User_call_Center_Info = require('../Configuration Files/Sequelize Files/Sequelize Models/call_center_info'),
  call_Center_Compaign_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/call_center_compaign_info'),
  call_Center_Employee_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_employee'),
  call_Center_Sales_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_sales'),
  did_Number_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/did_Number_info'),
  sequelize = require('../Configuration Files/Sequelize Files/Sequelize Config'),
  avatarCategory_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/avatarCategory')




//user profile call center information fetched from the database of VOIP. 
router.get('/user_Profile', middleWares_Fucntions.not_logged_in, function (req, res, next) {
  //getting user data which is logged in
  // getting the id from the session
  // console.log(req.session)

  const response = User_call_Center_Info.findAll({
      include: [{
        model: call_Center_Compaign_Model,
        required: true
      }],
      where: {
        "user_id": req.session.passport.user.user_id
      }
    })
    .then()
    .then((res) => {
      // console.log("Helo");
      console.log(res[0]?.dataValues)
      return res[0]?.dataValues
      //console.log(res[0].call_center_compaign_info)
    })


  response.then((response) => {
    res.render('user_Profile', {
      response: response
    })
  })

})

//change password route
router.get('/change_Password', middleWares_Fucntions.user_logged_In, function (req, res, next) {

  res.render('change_Password', {
    user_id: req.session.passport.user.user_id
  })
})



// Manage access of the DID numbers.....
// Allow the employees about the did routes
router.get('/call_center_manage_employee', middleWares_Fucntions.user_logged_In, function (req, res, next) {


  const response = User_call_Center_Info.findAll({
      include: [{
        model: call_Center_Compaign_Model,
        required: true
      }, {
        model: call_Center_Employee_Model,
        where: {
          'emp_deleted': 0
        },
        required: false,
      }],
      where: {
        "user_id": req.session.passport.user.user_id
      }
    })
    .then()
    .then((res) => {
      return res[0]?.dataValues
    })

  response
    .then((response) => {
      res.render('call_center_manage_employee', {

        response: response
      })
    })

})


router.get('/call_center_manage_compaign', middleWares_Fucntions.user_logged_In, function (req, res, next) {


  const response = call_Center_Compaign_Model.findAll({
      include: [{
        model: call_Center_Sales_Model,
        attributes: [
          [sequelize.fn('COUNT', sequelize.col('compaign_country')), "SALES_of_Compaign"]
        ],
        required: false
      }, {
        model: call_Center_Employee_Model,
        where: {
          'emp_deleted': 0,
          'call_cent_id': req.session.passport.user.call_Center_Info.call_cent_id
        },
        required: false,
      }],
      group: ['call_center_compaign_info.compaign_id'],
      where: {
        'call_cent_id': req.session.passport.user.call_Center_Info.call_cent_id
      }
    })
    .then((response) => {
      return response
    })

  response
    .then((response) => {
      console.log(response)
      res.render('manage_compaign', {

        response: response
      })
    })

})






// Manage access of the DID numbers.....
// Allow the employees about the did routes
router.get('/call_center_did_access', middleWares_Fucntions.user_logged_In, function (req, res, next) {

  const db_Response = call_Center_Compaign_Model.findAll({
      include: [{
          model: did_Number_Model,
          required: false,
          where: {
            call_cent_id: req.session.passport.user.call_Center_Info.call_cent_id
          }
        },
        {
          model: call_Center_Employee_Model,
          attributes: ['emp_email', 'emp_fullName', 'emp_username', 'emp_role', 'emp_timing', 'emp_isPaused', 'did_Num_id'],
          required: false,
          where: {
            call_cent_id: req.session.passport.user.call_Center_Info.call_cent_id
          }

        }
      ],
      where: {
        call_cent_id: req.session.passport.user.call_Center_Info.call_cent_id
      }
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
      res.render('call_center_did_access', {
        response: response
      })
    })

})



/**
 * this route is related to the categories of the buttons which are present in the avatar
 * like the greeting, closing and etc 
 * this allow the user to manage the category according to the their choice...!
 */


router.get('/create_avatar_category', middleWares_Fucntions.user_logged_In, function (req, res, next) {


  const dbResponse = call_Center_Compaign_Model.findAll({
      include: [{
        model: avatarCategory_Model,
        required: false,
      }],
      where: {
        'call_cent_id': req.session.passport.user.call_Center_Info.call_cent_id
      }
    })
    .then()
    .then((response) => {
      return response
    })
    .catch((error) => {
      res.status(500).render('create_avatar_category', req.flash('danger', 'Sorry! Error in loading'))
    })


  dbResponse.then((response) => {
      if (response) {
        res.status(200).render('create_avatar_category', {
          response
        })
      }
    })
    .catch((error) => {
      res.status(500).render('create_avatar_category', req.flash('danger', 'Sorry! Error in loading'))
    })





})


router.get('/create_avatar', middleWares_Fucntions.user_logged_In, function (req, res, next) {

  res.render('create_avatar', {
    user_id: req.session.passport.user.user_id
  })
})

module.exports = router