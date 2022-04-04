const mongoose = require('mongoose')

const RoomSchema = new mongoose.Schema({
    room: String
})

module.exports = mongoose.model('Room', RoomSchema);