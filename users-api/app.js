const express = require("express");
const http = require("http");

const app = express();
app.use(express.json());
const server = http.createServer(app);
const userRoutes = require("./routes/userRoutes")

app.use("/api/v1/users", userRoutes);

module.exports = { server };