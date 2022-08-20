const express = require('express')

const RoomController = require('./controllers/RoomController')
const PlayerController = require('./controllers/PlayerController')
const MissionController = require('./controllers/MissionController')

const routes = express.Router()

routes.get('/hasroom', RoomController.index)
routes.post('/newroom', RoomController.store)
routes.delete('/destroyroom/:room_id', RoomController.destroy)

routes.get('/players', PlayerController.index)
routes.get('/player/:player_id', PlayerController.show)
routes.post('/player/:player_id', PlayerController.update)
routes.post('/player', PlayerController.store)
routes.delete('/destroyplayer/:player_id', PlayerController.destroy)

routes.get('/missions', MissionController.index)
routes.post('/mission', MissionController.store)
routes.post('/mission/:mission_id', MissionController.update)
routes.delete('/destroymission/:mission_id', MissionController.destroy)

module.exports = routes