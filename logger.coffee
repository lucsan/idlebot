class Logger
    fs = null
    state = 'write'
    msg = null
    msgs = []
    constructor: () ->
        @msgs = []
        if !@fs
            @fs = require 'fs'

    state: (state) =>
        @state = state

    info: (info) =>
        @output @common() + 'INFO: ' + info

    common: () =>
        stamp = new Date()
        stamp.toISOString() + ': '

    output: (msg) =>
        @msg = msg
        @msgs.push msg
        if @state == 'write' then @write()

    write: () =>
        @fs.appendFile "dev.log", msg

    console: () =>
        console.log msg

    getMsgs: () =>
        @msgs



module.exports.Logger = Logger

# fs = require 'fs'
#
# outputState = 'write'
# state = (state) =>
#     outputState = state
#
# info = (info) =>
#     stamp = new Date()
#     msg = stamp.toISOString() + ': INFO: ' + info + "\r\n"
#     if outputState == 'write'
#         fs.appendFile "dev.log", msg
#     if outputState = 'console'
#         console.log msg
#
# module.exports.info = info
# module.exports.state = state
