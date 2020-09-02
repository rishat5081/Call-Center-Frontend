var express = require('express'),
  app = express(),
  path = require('path'),
  session = require('express-session'),
  cookieParser = require('cookie-parser'),
  logger = require('morgan'),
  bodyparser = require('body-parser'),
  indexRouter = require('./routes/index'),
  usersRouter = require('./routes/users'),
  { env } = require('process'),
  passport = require('passport'),
  flash = require('connect-flash'),
  passportJs_File = require('./Configuration Files/Passport Js/passport')
require('dotenv').config()

// view engine setup
app.set('views', [path.join(__dirname, 'views'), path.join(__dirname, 'views/Web_Pages'), path.join(__dirname, 'views/Web_Sections')]);
app.set('view engine', 'ejs');

//setting the morgon for loggs
app.use(logger('dev'))

//setting the express session 

app.use(express.urlencoded({ extended: false }))
app.set('view engine', 'ejs')
app.use(cookieParser())

app.use(bodyparser.json())
app.use(session({
  saveUninitialized: true,
  secret: 'VOIP',
  cookie: { secure: false },
  resave: true
}))


app.use(flash())
app.use(passport.initialize())
app.use(passport.session())


//express for the css and bootstrap files
app.use(express.static(__dirname + '/public'));

app.use(require('connect-flash')());
app.use(function (req, res, next) {
  res.locals.messages = require('express-messages')(req, res);
  next();
});

//require('./Configuration Files/Sequelize Files/Sequelize Config')
// require('./Configuration Files/My Sql/mysql')

app.use(indexRouter)

require('./Configuration Files/Sequelize Files/Sequelize Models/User_Login_Model')


app.post('/login', passportJs_File.authenticate('local-login',
  {
    successRedirect: '/hello',
    failureRedirect: '/',
    failureFlash: true

  })
)























app.listen(process.env.Server_Port, () => console.log('Server Listen at', process.env.Server_Port))
