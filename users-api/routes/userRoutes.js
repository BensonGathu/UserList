const express = require("express");
const app = express();
const router = express.Router();
const userController = require("../controllers/userController");
module.exports = router;

router.get("/", userController.allUsers);
