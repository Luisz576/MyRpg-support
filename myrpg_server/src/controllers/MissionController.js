const Mission = require('../models/Mission')
const Room = require('../models/Room')

module.exports = {
    async index(req, res){
        const result = {}
        const { room } = req.query
        if(!room) return res.status(400).json({ error: "No room code was passed" })
        const roomGetted = await Room.findOne({room})
        if(!roomGetted) return res.status(400).json({ error: "Room not founded" })
        result.status = 200
        result.missions = await Mission.find({room: roomGetted._id})
        result.missions_amount = result.missions.length
        return res.json(result)
    },
    async store(req, res){
        const result = {}
        const { room } = req.query
        if(!room) return res.status(400).json({ error: "No room code was passed" })
        const roomGetted = await Room.findOne({room})
        if(!roomGetted) return res.status(400).json({ error: "Room not founded" })
        const { title, descricao, recompensaType, recompensa, principal, quantItemRecive } = req.body
        all_params_were_passed = title && descricao && recompensaType && recompensa && quantItemRecive
        if(!all_params_were_passed) return res.status(400).json({ error: "Some param wasn't passed" })
        result.status = 200
        const newMission = await Mission.create({ room: roomGetted, title, descricao, recompensaType, recompensa, principal, quantItemRecive, completed: false, fail: false })
        result.mission = newMission
        return res.json(result)
    },
    async update(req, res){
        const result = {}
        const { mission_id } = req.params
        const { title, descricao, recompensaType, recompensa, principal, quantItemRecive, completed, fail } = req.body
        all_params_were_passed = title && descricao && recompensaType && recompensa && quantItemRecive
        if(!all_params_were_passed) return res.status(400).json({ error: "Some param wasn't passed" })
        try{
            const mission = await Mission.findById(mission_id)
            if(!mission) return res.status(400).json({ error: "Mission not founded" })
            mission.title = title
            mission.descricao = descricao
            mission.recompensaType = recompensaType
            mission.recompensa = recompensa
            mission.principal = principal
            mission.quantItemRecive = quantItemRecive
            mission.completed = completed
            mission.fail = fail
            await mission.save()
            result.status = 200
        }catch(e){
            return res.status(400).json({ error: "Error while updating mission..." })
        }
        return res.json(result)
    },
    async destroy(req, res){
        const result = {}
        const { mission_id } = req.params
        if(!mission_id) return res.status(400).json({ error: "MissionId wasn't passed" })
        try{
            const mission = await Mission.findById(mission_id)
            if(!mission) return res.status(400).json({ error: "No mission founded" })
            result.status = 200
            await Mission.deleteOne({_id: mission_id})
        }catch(e){
            return res.status(400).json({ error: "Error while deleting mission..." })
        }
        return res.json(result)
    }
}