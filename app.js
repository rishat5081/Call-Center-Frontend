var express = require('express'),
  app = express(),
  path = require('path'),
  session = require('express-session'),
  cookieParser = require('cookie-parser'),
  logger = require('morgan'),
  bodyparser = require('body-parser'),
  webPages_Routes = require('./routes/webPages_Routes'),
  usersRouter = require('./routes/users_routes'),
  employeeRoutes = require('.//routes/employee_routes'),
  { env } = require('process'),
  passport = require('passport'),
  server = require('http').createServer(app),
  io = require('socket.io').listen(server),
  flash = require('connect-flash'),
  createError = require('http-errors'),
  passportJs_File = require('./Configuration Files/Passport Js/passport'),
  employee_passport = require('./Configuration Files/Passport Js/employee_passport')
require('dotenv').config()

// view engine setup
app.set('views', [path.join(__dirname, 'views'), path.join(__dirname, 'views/Web_Pages'),
path.join(__dirname, 'views/Web_Sections'), path.join(__dirname, 'views/Employee_Files'),
path.join(__dirname, 'views/Employee_Section'), path.join(__dirname, 'views/User_Profile')])

//setting ejs as the view engine...
app.set('view engine', 'ejs')

//express for the css and bootstrap files
app.use(express.static(__dirname + '/public'))


//setting the morgon for loggs
app.use(logger('dev'))

//setting the express session 

app.use(express.urlencoded({ extended: false }))
app.set('view engine', 'ejs')
app.use(cookieParser())

app.use(bodyparser.json())

app.use(session({
  saveUninitialized: false,
  secret: 'VOIP Call Center',
  // cookie: { secure: false },
  resave: true
}))


app.use(passport.initialize())
app.use(passport.session())


app.use(flash())
app.use(function (req, res, next) {
  res.locals.messages = require('express-messages')(req, res);
  next();
});

//require('./Configuration Files/Sequelize Files/Sequelize Config')
// require('./Configuration Files/My Sql/mysql')

// web pages routes and rendering the pages of the web pages like home, about , contact
app.use(webPages_Routes.router)

// user profiles routes like profile,
app.use(usersRouter)

//setting the routes of the employees
app.use('/emp', employeeRoutes)

//getting user profile controller
const user_controller = require('./User_Controllers/controller')
user_controller(app)

//passport login function
app.get('/login_HomePage', passportJs_File.authenticate('local-login',
  {
    successRedirect: '/',
    failureRedirect: '/login',
    failureFlash: true,
  })
)


//passport login function
app.get('/login_of_Employee', employee_passport.authenticate('local-login-forEmployees',
  {
    successRedirect: '/emp/edashboard',
    failureRedirect: '/emp/elogin',
    failureFlash: true,
    session: true
  })
)

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error')
});






app.listen(process.env.Server_Port, () => console.log('Server Listen at', process.env.Server_Port))
