const { io } = require('./http')
const Room = require('./models/Room')

const noRoom = []
const withRoom = {}
function startWebSocket(){
    function removeFromNoRoom(id){
        const index = noRoom.indexOf(id);
        if(index != -1){
            noRoom.splice(index, 1)
        }
    }
    function removeFromWithRoom(id){
        for(room in withRoom)
            if(withRoom[room].includes(id)){
                const index = withRoom[room].indexOf(id);
                if(index != -1)
                    noRoom.splice(index, 1)
            }
    }
    function isInSomeRoom(id){
        for(room in withRoom)
            if(withRoom[room].includes(id))
                return true;
        return false;
    }
    console.log("WebSockets started!")
    io.on("connection", socket => {
        console.log("New Client Connected: " + socket.id)
        noRoom.push(socket.id)
        setTimeout(() => {
            removeFromNoRoom(socket.id)
            if(!isInSomeRoom(socket.id))
                socket.disconnect()
        }, 2000)
        socket.on("select_room", async (data) => {
            if(typeof data == "number")
                if(await Room.findOne({room: data})){
                    if(withRoom[data]){
                        withRoom[data].push(socket.id)
                    }else
                        withRoom[data] = [socket.id]
                }
        })
    })
    io.on("disconnection", socket => {
        removeFromNoRoom(socket.id)
        removeFromWithRoom(socket.id)
    })
}

function sendAUpdateToClients(room){
    function getDataToSend(room){
        const data = {}
        //TODO: GET ALL DATA
        data["players"] = []
        data["missions"] = []
        data["map"] = ""
        return data
    }
    const data = getDataToSend(room)
    if(withRoom[room]){
        for(index in withRoom[room])
            io.to(withRoom[room][index]).emit("update_data", data)
    }
}

module.exports = { startWebSocket, sendAUpdateToClients }