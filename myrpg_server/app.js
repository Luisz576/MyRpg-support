const { port, link_mongodb } = require('./configs.json')
const { app, serverHttp } = require('./src/http')
const mongoose = require('mongoose')
const routes = require('./src/routes')
const { startWebSocket } = require('./src/websocket');

mongoose.connect(link_mongodb, {
    useNewUrlParser: true,
    useUnifiedTopology: true
})

app.use(routes)

startWebSocket()

serverHttp.listen(port, () => console.log("Server is running on por " + port))