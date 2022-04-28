const express = require("express")
const { Server } = require("socket.io")

const app = express()
const serverHttp = require('http').createServer(app)
const io = new Server(serverHttp)

module.exports = { app, serverHttp, io }