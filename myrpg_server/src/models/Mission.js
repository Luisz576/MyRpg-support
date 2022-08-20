const mongoose = require('mongoose')

const MissionSchema = new mongoose.Schema({
    room: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Room'
    },
    title: String,
    descricao: String,
    recompensaType: Number,
    recompensa: Number,
    principal: Boolean,
    quantItemRecive: Number,
    completed: Boolean,
    fail: Boolean
})

module.exports = mongoose.model('Mission', MissionSchema)