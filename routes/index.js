var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  req.flash('info', 'Flash is back!')
  res.render('login');
});
router.get('/hello', function (req, res, next) {
  res.send('Hello World')
});


module.exports = router;
