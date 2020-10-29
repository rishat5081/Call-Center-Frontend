module.exports = (io) => {
    io.on('connection', (socket) => {
        socket.on('DID_Access_granted', (data) => {
            console.log(data , "asdkhasdvasdhvasdhkasvbdkahsvdakshdvakshdvkh")
            socket.broadcast.emit('DID_Access_granted',data)
        })
    })
}