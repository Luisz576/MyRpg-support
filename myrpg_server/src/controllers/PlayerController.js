const Room = require('../models/Room')
const Player = require('../models/Player')
const { sendAUpdateToClients } = require('../websocket')

module.exports = {
    async index(req, res){
        const result = {}
        const { room } = req.query
        if(!room) return res.status(400).json({ error: "No room code was passed" })
        const roomGetted = await Room.findOne({room})
        if(!roomGetted) return res.status(400).json({ error: "Room not founded" })
        result.status = 200
        result.players = await Player.find({room: roomGetted._id})
        result.players_amount = result.players.length
        return res.json(result)
    },
    async show(req, res){
        const result = {}
        const { player_id } = req.params
        try{
            const player = await Player.findById(player_id)
            if(!player) res.status(400).json({ error: "No player founded" })
            result.player = player
            result.status = 200
        }catch(e){
            return res.status(400).json({ error: 'Invalid id' })
        }
        return res.json(result)
    },
    async store(req, res){
        const result = {}
        const { room, nome, raca, classe, lvl, gold, maxhp, maxmp, xp, at, def, vel, sort, influencia, hpatual, mpatual, image } = req.body
        all_params_were_passed = room && nome && raca && classe && lvl && gold && maxhp && maxmp && xp && at && def && vel && sort && influencia && hpatual && mpatual && image
        if(!all_params_were_passed) return res.status(400).json({ error: "Some param wasn't passed" })
        const roomGetted = await Room.findOne({room})
        if(!roomGetted) return res.status(400).json({ error: "Room not founded" })
        result.status = 200
        const newPlayer = await Player.create({ room: roomGetted, nome, raca, classe, lvl, gold, maxhp, maxmp, xp, at, def, vel, sort, influencia, hpatual, mpatual, image })
        result.player = newPlayer
        sendAUpdateToClients(room)
        return res.json(result)
    },
    async update(req, res){
        const result = {}
        const { player_id } = req.params
        const { nome, raca, classe, lvl, gold, maxhp, maxmp, xp, at, def, vel, sort, influencia, hpatual, mpatual, image } = req.body
        all_params_were_passed = nome && raca && classe && lvl && gold && maxhp && maxmp && xp && at && def && vel && sort && influencia && hpatual && mpatual && image
        if(!all_params_were_passed) return res.status(400).json({ error: "Some param wasn't passed" })
        try {
            const player = await Player.findById(player_id)
            if(!player) return res.status(400).json({ error: "Player not founded" })
            player.nome = nome
            player.raca = raca
            player.classe = classe
            player.lvl = lvl
            player.gold = gold
            player.maxhp = maxhp
            player.maxmp = maxmp
            player.xp = xp
            player.at = at
            player.def = def
            player.vel = vel
            player.sort = sort
            player.influencia = influencia
            player.hpatual = hpatual
            player.mpatual = mpatual
            player.image = image
            await player.save()
            result.status = 200
            const gettedRoom = await Room.findById(player.room);
            sendAUpdateToClients(gettedRoom.room)
        } catch (e) {
            return res.status(400).json({ error: "Player not founded" })
        }
        return res.json(result)
    },
    async destroy(req, res){
        const result = {}
        const { player_id } = req.params
        if(!player_id) return res.status(400).json({ error: "PlayerId wasn't passed" })
        try{
            const player = await Player.findById(player_id)
            if(!player) return res.status(400).json({ error: "No player founded" })
            result.status = 200
            await Player.deleteOne({_id: player_id})
            const gettedRoom = await Room.findById(player.room);
            sendAUpdateToClients(gettedRoom.room)
        }catch(e){
            return res.status(400).json({ error: "No player founded" })
        }
        return res.json(result)
    }
}