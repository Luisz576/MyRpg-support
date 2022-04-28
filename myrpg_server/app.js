const { port, link_mongodb } = require('./configs.json')
const { app, serverHttp } = require('./src/http')
const express = require('express')
// const cors = require('cors')
const mongoose = require('mongoose')
const routes = require('./src/routes')

mongoose.connect(link_mongodb, {
    useNewUrlParser: true,
    useUnifiedTopology: true
})

// app.use(cors())
app.use(express.json())
app.use(routes)

serverHttp.listen(port, () => console.log("Server is running on por " + port))