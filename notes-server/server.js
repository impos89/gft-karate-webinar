require('rootpath')();
const express = require('express');
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser');
const basicAuth = require('_config/basic-auth');
const errorHandler = require('_config/error-handler');
const hateoasLinker = require('express-hateoas-links');
app.use(hateoasLinker);
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());

app.use(basicAuth);
app.use('/notes', require('./notes/notes.controller'));
app.use(errorHandler);


const port = 3000;
app.listen(port,
    function () {
        console.log('Server listening on port %s', port)
    }
);


