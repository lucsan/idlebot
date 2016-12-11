module.exports.loadFrame = (botron, frameBlueprint) =>
    botron.frame = frameBlueprint

module.exports.loadModule = (botron, moduleBlueprint) =>
    botron.frame.modules.push moduleBlueprint
