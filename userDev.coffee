fs          = require "fs"
parts       = require "./parts"
resources   = require "./resources"

userData = [
    { 'raws/coal': 10 }
    { 'raws/iron': 10 }
    { blueprints: [
            'mats/iron'
            'mats/steel'
        ]
    }
]



    frames: [basic: 1]
    materials: [metal: 20]

 # fs.writeFile "user.data", JSON.stringify(userData), (error) ->
 #     console.error("error") if error

ud = ->
     fs.readFileSync 'user.data', 'utf8'

console.log ud()
#console.log JSON.parse(ud()).frames
