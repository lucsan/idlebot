# Provide a decimal percentage and the chance it has happened is returned as true or false.
module.exports.chance = (decimal) =>
    if (rand 1, 100) <= (100 * decimal) then true else false

#
module.exports.rand = (min, max) =>
    inrange = Math.floor(Math.random() * (max - min) + min)

module.exports.inspect = (thing) =>
    s = ''
    for item of thing
        s += item + ': '
        if typeof thing[item] == 'object' and thing[item].length != null
            strs = JSON.stringify(thing[item]).split(',')
            for str in strs
                s += str + ',\n'
        else
            s += thing[item] + '\n'
    return s
    # s = ''
    # for obj in thing
    #     console.log obj
    #     arr = JSON.Stringify obj
    #     ars = arr.split ','
    #     for a in ars
    #         s += a + '\n'
    # return s
