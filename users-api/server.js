// Import the 'dotenv' module
const dotenv = require('dotenv')
dotenv.config({ path: '.env' })


const server = require('./app')

// Get the port from the environment variables 
const port = process.env.PORT

 
// Start the server
server.server.listen(port, () => {
    console.log(`server running on port ${port}`)
   
})

