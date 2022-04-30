const { io } = require('./http')

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
        socket.on("select_room", data => {
            console.log(data)
            //TODO: VERIFICAR SE O ROOM EXISTE
            //TODO: SE EXISTE ARMAZENA NA VARIAVEL "withRoom"
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
        console.log(room)
        return data
    }
    const data = getDataToSend(room)
    //TODO: EMITIR UM UPDATE PARA TODOS OS CLIENTS CONECTADOS À AQUELE ROOM
    // io.emit("update_data", )
}

module.exports = { startWebSocket, sendAUpdateToClients }