module.exports.loadFrame = (botron, frame) =>
    botron.frame = frame
    botron.frame.modules = []

module.exports.loadModule = (botron, botronModule) =>
    slotCode = botronModule.slot.split('/')
    modSlot = slotCode[slotCode.length - 1]
    max = botron.frame.max[modSlot]
    counter = 0
    counter++ for i, module of botron.frame.modules when module.slot is botronModule.slot
    if counter >= max then return
    botron.frame.modules.push botronModule
