var express = require('express'),
  router = express.Router(),
  //requiring the middleware which is used to 
  //check that the session have the user data or not 
  middleWares_Fucntions = require('./webPages_Routes'),
  //requiring the user call center information model schema
  User_call_Center_Info = require('../Configuration Files/Sequelize Files/Sequelize Models/user_call_center_info'),
  User_Login_Model = require('../Configuration Files/Sequelize Files/Sequelize Models/User_Login_Model')


//user profile call center information fetched from the database of VOIP. 
router.get('/user_Profile', middleWares_Fucntions.not_logged_in, function (req, res, next) {
  //getting user data which is logged in
  // getting the id from the session

  const response = User_call_Center_Info.findAll({
    include: [{
      model: User_Login_Model,
      required: true
    }], where: { "user_id": req.session.passport.user.user_id }
  })
    .then()
    .then((res) => { return res[0]?.dataValues })

  response.then((response) => {
    res.render('user_Profile', { response: response })
  })

})

//change password route
router.get('/change_Password',middleWares_Fucntions.user_logged_In, function (req, res, next) {

  res.render('change_Password', { user_id: req.session.passport.user.user_id })
})



// User_call_Center_Info.findAll({
//   include: [{
//     model: User_Login_Model,
//     required: true
//   }], where: { "user_id": 2 }
// })
//   .then((res) => { console.log(res[0]?.dataValues) })






// User_call_Center_Info.findAll().then((res) => console.log(res[0].dataValues))
// User_Login_Model.hasMany(User_call_Center_Info, { foreignKey: 'user_id' })
// User_call_Center_Info.belongsTo(User_Login_Model, { foreignKey: 'user_id', targetKey: 'user_id' })






const a = {
  user_call_center_request_id: 1,
  callCenterName: 'Saad Call Center',
  no_Of_Seat: 5,
  nameofCompaing: 'Security System',
  nameOfCountry: 'Pakistan',
  inbound_outbound_select: 'In bound',
  callback_Dialing_YES_checkBox: 1,
  numberOf_Callback: 3,
  user_id: 1,
  User_Login: {
    dataValues: {
      user_id: 1,
      user_full_name: 'Farooq Sohail',
      user_username: 'saad14',
      user_email: 'a@a',
      user_contact_Number: '0345-5536125',
      user_password: '$2b$10$gMIfavSiLxMgq7veWB57f.uWOUlGSZuVjhuUvxEl/r8tE0CI0zf06',
      user_Type_user_type_id: 1,
      user_added_Admin_user_added_Admin_id: 1,
      user_first_time_login: true
    }
  }
}

// const aa = a?.User_Login?.dataValues?.user_email
//   console.log(aa);






module.exports = router
