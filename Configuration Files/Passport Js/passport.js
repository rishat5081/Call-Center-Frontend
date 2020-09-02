const { response } = require('express');

const passport = require('passport'),
     LocalStrategy = require('passport-local').Strategy,
     User_login_model = require('../Sequelize Files/Sequelize Models/User_Login_Model')

passport.serializeUser(function (user, done) {
     done(null, user.id);
});

passport.deserializeUser(function (id, done) {
     User.findById(id, function (err, user) {
          done(err, user);
     });
});


passport.use('local-login', new LocalStrategy({

     usernameField: 'user_loginemail',
     passwordField: 'user_login_password',
     passReqToCallback: true
}, authenticate_login))

function authenticate_login(req, email, password, done) {
     req.flash()
     User_login_model.findOne({ user_email: email })
     .then((response)=>{

     })
     .catch((error)=>{
          
     })
}




















module.exports = passport