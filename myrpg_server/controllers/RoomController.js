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
        const { room } = req.body
        result.status = -1
        if(room){
            result.target = room
            result.status = 404
            let newRoom = await Room.findOne({room})
            if(newRoom){
                result.status = 200
                await Room.deleteOne({room})
            }
        }
        return res.json(result)
    }
}