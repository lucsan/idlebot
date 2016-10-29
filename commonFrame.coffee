# Common frame activities (load parts, remove parts)
module.exports.loadPart = (botron, part) =>
    # identify part
    slot = part.slot.split '/'
    #console.log slot
    slot = slot[2]
    # check frame capacity for part
    capacity = botron.frame.max[slot]
    holding = 0
    for item of botron.frame.parts
        holding++ if item.slot == part.slot
    #holding = botron.frame[slot].length
    if holding == capacity then return #is full
    # if space, load part into frame
    botron.frame.parts.push part
    botron.logger.info 'loaded - ' + part.code + ' into bot ' + botron.name
    #console.log



module.exports.removePart = (botron, code) =>
    # idenftyfy part
    index = 0
    for part in botron.frame.parts
        # see if it exisits in framel list
        if part.code == code
            # remove
            botron.frame.parts.splice(index, 1)
            botron.logger.info 'removed - ' + code + ' from bot ' + botron.name
            break
        index++

module.exports.listParts = (botron) =>
    return botron.frame.parts

module.exports.loadHopper = (botron, resources) =>



#module.exports.loadPart = loadPart
#module.exports.removePart = removePart
#module.exports.listParts = listParts
#module.exports.loadHopper = loadHopper
