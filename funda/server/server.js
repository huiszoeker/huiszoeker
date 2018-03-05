const express = require('express');
const bodyParser = require('body-parser');
const fs = require('mz/fs');
const glob = require('glob-promise');
const path = require('path');
const exitHook = require('exit-hook');

const app = express();

app.use(bodyParser.json({ limit: '50MB' }));

fs.open(path.join(__dirname, '../', `${process.env.KIND}_${process.env.PLACE}_houses.json`), 'w+').then(fd => {
  app.post('/house', function (req, res) {
    return fs.writeFile(fd, JSON.stringify(req.body) + '\n', { flag: 'a' }).then(() => {
      return fs.fdatasync(fd);
    }).then(() => {
      res.status(201).send();
    }).catch(error => {
      console.log(error);
      res.status(400).send();
    });
  });

  exitHook(function () {
    fs.closeSync(fd);
  });
});

app.listen(4000, () => {
  console.log('Percy server listening on: 4000');
});