fs = require 'fs'

outputState = 'write'
state = (state) =>
    outputState = state

info = (info) =>
    stamp = new Date()
    msg = stamp.toISOString() + ': INFO: ' + info + "\r\n"
    if outputState == 'write'
        fs.appendFile "dev.log", msg
    if outputState = 'console'
        console.log msg

module.exports.info = info
module.exports.state = state
