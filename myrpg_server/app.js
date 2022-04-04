const { port, link_mongodb } = require('./configs.json')
const express = require('express')
const mongoose = require('mongoose')
const routes = require('./routes')

mongoose.connect(link_mongodb, {
    useNewUrlParser: true,
    useUnifiedTopology: true
})

const app = express()

app.use(express.json())
app.use(routes)

app.listen(port)