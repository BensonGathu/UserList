// Import required modules
const express = require("express");
const http = require("http");

// Create an instance of Express
const app = express();

// Add middleware to parse incoming JSON data
app.use(express.json());

// Create an HTTP server using the Express application
const server = http.createServer(app); 

// Import userRoutes
const userRoutes = require("./routes/userRoutes");

// our API route
app.use("/api/v1/users", userRoutes);

module.exports = { server };
