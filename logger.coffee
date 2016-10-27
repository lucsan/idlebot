fs = require 'fs'

info = (info) =>
    stamp = new Date()
    fs.appendFile "dev.log", stamp.toISOString() + ': INFO: ' + info + "\r\n"

module.exports.info = info
