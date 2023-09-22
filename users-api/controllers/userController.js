const fs = require("fs");

exports.allUsers = (req, res) => {
  fs.readFile("./Data/users.json", "utf8", (err, data) => {
    if (err) {
      console.error(err);
      res.status(500).json({ error: "Internal server error" });
      return;
    }

    const userData = JSON.parse(data);
    res.json(userData);
  });
};
