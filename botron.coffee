module.exports.loadFrame = (botron, frame) =>
    botron.frame = frame

module.exports.loadModule = (botron, botronModule) =>
    botron.frame.modules.push botronModule
