// Import the 'fs' module to read files
const fs = require("fs");

// middleware to get users from list
exports.allUsers = (req, res) => {
  // Read the contents of the "users.json" 
  fs.readFile("./Data/users.json", "utf8", (err, data) => {
    if (err) {
      console.error(err);

      res.status(500).json({ error: "Internal server error" });

      return;
    }

    const userData = JSON.parse(data);

    // Respond with the parsed user data as a JSON response
    res.json(userData);
  });
};
