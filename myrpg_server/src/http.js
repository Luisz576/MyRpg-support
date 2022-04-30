const express = require("express")
// const cors = require('cors')
const { Server } = require("socket.io")

const app = express()

// app.use(cors())
app.use(express.json())

const serverHttp = require('http').createServer(app)

const io = new Server(serverHttp)

module.exports = { app, serverHttp, io }