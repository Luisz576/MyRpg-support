const Player = require('../models/Player')
const Room = require('../models/Room')

module.exports = {
    async index(req, res){
        const result = {}
        const { room } = req.query
        if(!room) return res.status(400).json({ error: "No room code was passed!" })
        result.target = room
        result.status = 404
        const roomGetted = await Room.findOne({room})
        if(roomGetted){
            result.status = 200
            result.result = roomGetted
        }
        return res.json(result)
    },
    async store(req, res){
        const result = {}
        const { room } = req.body
        result.status = -1
        if(room){
            result.target = room
            let newRoom = await Room.findOne({room})
            result.status = 0
            if(!newRoom){
                newRoom = await Room.create({room})
                result.result = newRoom
                result.status = 200
            }
        }
        return res.json(result)
    },
    async destroy(req, res){
        const result = {}
        const { room_id } = req.params
        if(room_id){
            result.target = room_id
            result.status = 404
            let newRoom = await Room.findOne({room: room_id})
            if(newRoom){
                result.status = 200
                const players = await Player.find({room: newRoom._id})
                for(let i in players)
                    Player.findByIdAndDelete(players[i]._id)
                await Room.deleteOne({room: room_id})
            }
        }else{
            return res.status(400).json({ error: "RoomID wasn't passed" })
        }
        return res.json(result)
    }
}