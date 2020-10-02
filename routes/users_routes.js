var express = require('express'),
  router = express.Router(),
  //requiring the middleware which is used to 
  //check that the session have the user data or not 
  middleWares_Fucntions = require('./webPages_Routes'),

  //requiring the user call center information model schema
  User_call_Center_Info = require('../Configuration Files/Sequelize Files/Sequelize Models/call_center_info'),
  User_Login_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/User_Login_Model'),
  call_Center_Compaign_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/call_center_compaign_info'),
  call_Center_Employee_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/call_cent_employee')



//user profile call center information fetched from the database of VOIP. 
router.get('/user_Profile', middleWares_Fucntions.not_logged_in, function (req, res, next) {
  //getting user data which is logged in
  // getting the id from the session

  const response = User_call_Center_Info.findAll({
    include: [{
      model: call_Center_Compaign_Model,
      required: true
    }], where: { "user_id": req.session.passport.user.user_id }
  })
    .then()
    .then((res) => {
      // console.log("Helo");
      console.log(res[0]?.dataValues)
      return res[0]?.dataValues
      //console.log(res[0].call_center_compaign_info)
    })


  response.then((response) => {
    res.render('user_Profile', { response: response })
  })

})

//change password route
router.get('/change_Password', middleWares_Fucntions.user_logged_In, function (req, res, next) {

  res.render('change_Password', { user_id: req.session.passport.user.user_id })
})


// Manage access of the DID numbers.....
// Allow the employees about the did routes
router.get('/call_center_did_access', middleWares_Fucntions.user_logged_In, function (req, res, next) {

  res.render('call_center_did_access', { user_id: req.session.passport.user.user_id, number: 05 })
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
      required: true,
    }], where: {
      "user_id": req.session.passport.user.user_id
    }
  })
    .then()
    .then((res) => {
      // console.log("Helo");
      console.log(res[0]?.dataValues)
      console.log(res[0]?.dataValues.call_center_compaign_infos[0]?.dataValues)
      console.log(res[0]?.dataValues.call_cent_employees[0]?.dataValues)
      return res[0]?.dataValues
      //console.log(res[0].call_center_compaign_info)
    })

  response
    .then((response) => {
      res.render('call_center_manage_employee', { user_id: req.session.passport.user.user_id, response: response })
    })

})



// User_call_Center_Info.findAll({
//   include: [{
//     model: call_Center_Compaign_Model,
//     required: true,
//     // attributes: ['call_cent_id', 'call_cent_Name', 'no_Of_Seat']
//   }], where: { "user_id": 1 }
// })
//   .then()
//   .then((res) => {
//     // console.log("Helo");
//     console.log(res[0]?.dataValues)
//     return res[0]?.dataValues
//     //console.log(res[0].call_center_compaign_info)
//   })








// User_call_Center_Info.findAll({
//   include: [{
//     model: call_Center_Compaign_Model,
//     required: true
//   }, {
//     model: call_Center_Employee_Model,
//     required: true,
//   }], where: { "user_id": 1 }
// })
//   .then()
//   .then((res) => {
//     // console.log("Helo");
//     console.log(res[0]?.dataValues)
//     console.log(res[0]?.dataValues.call_center_compaign_infos[0]?.dataValues)
//     console.log(res[0]?.dataValues.call_cent_employees[0]?.dataValues)
//     return res[0]?.dataValues
//     //console.log(res[0].call_center_compaign_info)
//   })










// User_call_Center_Info.findAll().then((res) => console.log(res[0].dataValues))
// User_Login_Model.hasMany(User_call_Center_Info, { foreignKey: 'user_id' })
// User_call_Center_Info.belongsTo(User_Login_Model, { foreignKey: 'user_id', targetKey: 'user_id' })





// User_call_Center_Info.findAll({
//   include: [{
//     model: call_Center_Compaign_Model,
//     required: true
//   }, {
//     model: call_Center_Employee_Model,
//     where: {
//       'emp_deleted': 1
//     },
//     required: true,
//   }], where: {
//     "user_id": 1
//   }
// })
//   .then()
//   .then((res) => {
//     // console.log("Helo");
//     // console.log(res[0]?.dataValues)
//     // console.log(res[0]?.dataValues.call_center_compaign_infos[0]?.dataValues)
//     console.log(res[0]?.dataValues.call_cent_employees)
//     return res[0]?.dataValues
//     //console.log(res[0].call_center_compaign_info)
//   })





module.exports = router
