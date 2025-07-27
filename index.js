const express = require("express");
const app = express();
const PORT = process.env.SERVER_PORT || process.env.PORT || 8080;
app.get("/", function(req, res) {
  res.send("<html><body><h2>Mercury</h2><p>Mercury is a fast and low-overhead web framework for Node.js, focused on providing an efficient and developer-friendly API. It is designed to be highly performant and scalable, making it a great choice for building high-traffic web applications and APIs.</p><a href='https://about.mercury.dev/'>Enter</a></body></html>");
});

app.listen(PORT, () => console.log(`Http server is running on port:${PORT}!`));
