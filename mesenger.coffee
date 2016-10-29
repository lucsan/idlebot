
class Mesenger
    messages = null

    constructor: () ->
        @messages = []

    add: (Text) =>
        @messages.push Text

    print: () =>
        for msg in @messages
            process.stdout.write msg + '\n'
        #console.log messages

    clear: () =>
        messages = []

module.exports.Mesenger = Mesenger
