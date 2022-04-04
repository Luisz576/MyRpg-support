const mongoose = require('mongoose')

const PlayerSchema = new mongoose.Schema({
    room: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Room'
    },
    nome: String,
    raca: String,
    classe: String,
    lvl: Number,
    gold: Number,
    maxhp: Number,
    maxmp: Number,
    xp: Number,
    at: Number,
    def: Number,
    vel: Number,
    sort: Number,
    influencia: Number,
    hpatual: Number,
    mpatual: Number,
    image: String
})

module.exports = mongoose.model('Player', PlayerSchema)