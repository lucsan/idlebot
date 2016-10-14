

class Mesenger
    messages = null

    constructor: () ->
        messages = []

    add: (Text) =>
        messages.push Text

    print: () =>
        console.log messages

    clear: () =>
        messages = []

module.exports.Mesenger = Mesenger
