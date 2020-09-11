// const mysql = require('mysql')

// module.exports = () => {
//     const mySQL_Connection = mysql.createConnection({
//         host: process.env.host,
//         user: process.env.user,
//         password: '',
//         database: 'voip'
//     })
//     mySQL_Connection.connect((error, res) => {
//         if (!error)
//             console.log("helo")
//     })

//     mySQL_Connection.connect(() => { console.log('Database Connected') })
// }