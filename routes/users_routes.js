var express = require('express'),
  router = express.Router(),
  middleWares_Fucntions = require('./webPages_Routes')


//user profile call center information fetched from the database of VOIP. 
router.get('/user_Profile', middleWares_Fucntions.not_logged_in, function (req, res, next) {
  res.render('user_Profile')
})

module.exports = router
