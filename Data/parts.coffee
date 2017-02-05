# Domain - part, resources
# kingdom - module, frame, component, raws
# phylum - sensors, grabbers, lenses, curcuits, grasses, woods
# family - visual, radar, plastic, glass, bush, clump, tree, rock
# genus - basic, standard, brilliant
# species -

botrons = {
    'botron' : {
        position: [0,0,0]
        state: 'off'
        delay: 1
    }
}
modules = {
    'modules/sensors/sight/basic': {
        name: "Basic Sight"
        #slot: 'frames/sensors'
        gene: 'vision'
        bulk: 1
        range: 10
        power: 0.2
        uses: {'cpnts/lens/plastic': 1, 'cpnts/curcuit/basic': 1} #combo
    }
    'modules/sensors/sound': {
        name: "Basic Sound"
        #slot: 'frames/sensors'
        gene: 'audio'
        bulk: 1
        uses: {'cpnts/curcuit/basic': 1, 'cpnts/microphone/basic': 1}
    }
    'modules/sensors/detect': {
        name: "Basic Metalergy"
        gene: 'detect'
        bulk: 1
        uses: {}
    }
    'modules/sensors/radar': {
        name: "Basic radar"
        gene: 'radar'
        bulk: 1
        uses: {}
    }

    'modules/armatures/grabber': {
        name: "Basic grabing arm"
        gene: 'grabber'
        bulk: 1
        uses: {}
    }

    'modules/armatures/mower': {
        name: "Basic mowing arm"
        gene: 'mower'
        bulk: 1
        uses: {}
    }

    'modules/hoppers/general/basic': {
        name: "Basic general purpurse hopper"
        gene: 'hopper'
        bulk: 1
        uses: {'mats/iron': 1}
        capacity: 10
        contains: []
        carrying: 0
    }
}

components = { # combos
    'cpnts/lens/plastic': {
        name: 'plastic lens'
        bulk: 0.5
        uses: {'mats/plastic': 0.5}
    }
    'cpnts/lens/glass': {
        name: 'glass lens'
        bulk: 0.5
        uses: {'mats/glass': 0.5}
    }
    'cpnts/curcuit/basic': {
        name: 'basic curcuit'
        desc: ''
        bulk: 0.5
        uses: {'mats/copper': 0.2, 'mats/plastic/1': 0.2, 'mats/gold': 0.1} # all of these needed to create 1 component
    }
    'cpnts/microphone/basic': {
        name: 'basic microphone'
        desc: ''
        bulk: 0.5
        uses: {'cpnt/wire/copper': 0.2, 'mats/plastic/1': 0.1, 'cpnt/magnet/small': 1} # all of these needed to create 1 component
    }
    'cpnts/magnet/small': {
        name: 'small magnet'
        desc: ''
        bulk: 0.2
        uses: {'mats/iron': 0.2} # all of these needed to create 1 component
    }
}

frames = {
    'frames/basic': {
        name: 'basic frame'
        desc: ''
        uses: {'mats/steel': 10, 'mats/plastic/1': 2} #combo
        #modules: []
        max: {
            sensors: 2
            tractors: 1
            powerUnits: 2
            ambulators: 1
            hoppers: 10
            armatures: 2 # ie: grabber arm and a chainsaw
            commandModules: 1 # tells the robot to consentrate on certain materials
        }
    }
    'frames/squalid': {
        name: ''
    }
    'frames/meager': {
        name: ''
    }
    'frames/standard': {
        name: "standard"
        sensors: 2
        tractors: 4
        powerUnits: 4
    }
    'frames/brilliant': {
        name: ''
    }
}

modifyBotrons = () =>
    for code of botrons
        botrons[code].code = code
        botrons[code].quality = 0
        botrons[code].health = 100
    return botrons


modifyComponents = () =>
    for code of components
        components[code].code = code
        components[code].quality = 0
        components[code].health = 100
    return components

modifyFrames = () =>
    for code of frames
        frames[code].modules = []
        frames[code].code = code
        frames[code].quality = 0
        frames[code].health = 100
    return frames

modifyModules = () =>
    for code of modules
        infos = code.split('/')
        modules[code].slot = 'frames/' + infos[1] + '/' + infos[2]
        modules[code].code = code
        modules[code].quality = 0
        modules[code].health = 100
    return modules

# modifySensors = () =>
#     for code of sensors
#         sensors[code].slot = 'frame/sensors'
#         sensors[code].code = code
#         sensors[code].quality = 0
#         sensors[code].health = 100
#     return sensors
#
# modifyArmatures = () =>
#     for code of armatures
#         armatures[code].slot = 'frame/armatures'
#         armatures[code].code = code
#     return armatures
#
# modifyHoppers = () =>
#     for code of hoppers
#         hoppers[code].slot = 'frame/hoppers'
#         hoppers[code].code = code
#     return hoppers

module.exports.botrons = modifyBotrons() #frames
module.exports.frames = modifyFrames() #frames
module.exports.components = modifyComponents() #components
module.exports.modules = modifyModules()

#module.exports.sensors = modifySensors()
#module.exports.armatures = modifyArmatures()
#module.exports.hoppers = modifyHoppers()
