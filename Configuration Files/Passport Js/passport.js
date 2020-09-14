const { serializeUser } = require('passport');

const passport = require('passport'),
     bcrypt = require('bcrypt'),
     LocalStrategy = require('passport-local').Strategy,
     User_login_model = require('../Sequelize Files/Sequelize Models/User_Login_Model')


// serialize user 
passport.serializeUser(function (user, done) {
     done(null, user)
});

// getting the user data from the database ....
// and passing the data into the session .... 
passport.deserializeUser(function (id, done) {
     User_login_model.findOne({ where: { user_email: id.user_email } })
          .then((res) => {
               done(null, res)
          })
          .catch((err) => {
               done(null, false)
          })
})



passport.use('local-login', new LocalStrategy({

     usernameField: 'user_login_email',
     passwordField: 'user_login_password',
     passReqToCallback: true
}, authenticate_login))

function authenticate_login(req, email, password, done) {

     //hiting the database for once only...
     const user_Data_Response = User_login_model.findAll({
          where: {
               user_email: email
          }
     })
          .then()
          .then((response) => {
               if (response.length === 0)
                    return done(null, false, req.flash('danger', 'Sorry! Invalid Email'))
               return response
          })
          .catch((error) => {
               return done(null, false, req.flash('danger', 'Sorry! For Inconvenience'))
          })
     //end of database operation.

     //start of validation of the user
     user_Data_Response
          .then((response) => {
               //  console.log(response)
               if (!validate_Password(password, response[0].dataValues.user_password))
                    return done(null, false, req.flash('danger', 'Invalid Password'))

               else if (response[0].dataValues.user_first_time_login) {
                    User_login_model.update({ user_first_time_login: 0 }, { where: { user_id: response[0].dataValues.user_id } })
                    return done(null, response[0].dataValues, req.flash('success', 'You have logged in for first time. Kindly Chnage Your Password'))
               }

               else if (validate_Password(password, response[0].dataValues.user_password))
                    return done(null, response[0].dataValues)
          })
          .catch((err) => {
               req.flash('danger', 'Sorry! Something Went Wrong')
          })
}

//validating the password by the bycrpt compareSync method...

function validate_Password(user_loginForm_password, hashPassword) {
     return bcrypt.compareSync(user_loginForm_password, hashPassword)
}













// const uuid = require('uuid')
// // const bcrypt = require('bcrypt');
// const saltRounds = 10;
// const myPlaintextPassword = uuid.v4()
// // const someOtherPlaintextPassword = 'not_bacon';
// console.log('sad :::: ', myPlaintextPassword);
// const salt = bcrypt.genSaltSync(saltRounds);
// // console.log(salt);
// bcrypt.genSalt(saltRounds, function (err, salt) {
//      bcrypt.hash(myPlaintextPassword, salt, function (err, hash) {
//           console.log(hash);
//      });
// });

// async and await example


// async function f() {

//      let promise = new Promise((resolve, reject) => {
//           setTimeout(() => resolve("done!"), 100)
//      });

//      let result = await promise; // wait until the promise resolves (*)

//      console.log(result); // "done!"
// }

// f();




// split function

// var names = 'Harry Trump ;Fred Barney; Helen Rigby ; Bill Abel ;Chris Hand';

// console.log(names);

// var re = /\s*(?:;|$)\s*/;
// var nameList = names.split(re);

// console.log(nameList);











module.exports = passport