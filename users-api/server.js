const dotenv = require('dotenv')
dotenv.config({ path: '.env' })


const server = require('./app')
const port = process.env.PORT

 
// Start the server
server.server.listen(port, () => {
    console.log(`server running on port ${port}`)
   
})

