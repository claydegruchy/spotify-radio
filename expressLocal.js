
const express = require('express');
const exp = express();
const port = 3000;

exp.get('/', (req, res) => {
  res.send('Hello World!');
});


app.use((req, res, next) => {
  logSumo('info', `[${req.method}] - ` + req.protocol + '://' + req.get('host') + req.originalUrl)
  next()
})

app.use((err, req, res, next) => {
  var unqiueErrorCode = Math.random().toString(36).substring(7)
  logSumo('error', {
    context: "generic error",
    input: req.code,
    error: err,
    code: unqiueErrorCode
  })
  return res.status(500).json({
    error: "Something failed! We're working to fix this.",
    code: unqiueErrorCode + "-" + "G"
  })
})

exp.listen(port, () => {
  console.log(`Example exp listening on port ${port}`);
});