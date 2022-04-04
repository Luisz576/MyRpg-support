const express = require('express')

const RoomController = require('./controllers/RoomController')
const PlayerController = require('./controllers/PlayerController')

const routes = express.Router()

routes.get('/hasroom', RoomController.index)
routes.post('/newroom', RoomController.store)
routes.delete('/destroyroom', RoomController.destroy)

routes.get('/players', PlayerController.index)
routes.get('/player/:player_id', PlayerController.show)
routes.post('/player/:player_id', PlayerController.update)
routes.post('/player', PlayerController.store)
routes.delete('/destroyplayer/:player_id', PlayerController.destroy)

module.exports = routes