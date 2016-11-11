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

module.exports.makeName = (length) =>
    length = 6 if length == undefined
    vowels = ['a', 'e', 'i', 'o', 'u', 'y']
    #fromCharCode()
    #charCodeAt
    vi = []
    vi.push rand 1, 6
    vi.push rand 1, 6
    ci = []
    ci.push rand 97, 122
    ci.push rand 97, 122
    ci.push rand 97, 122
    ci.push rand 97, 122

    l1 =  String.fromCharCode ci[0]
    l2 =  vowels[vi[0]]
    l3 =  String.fromCharCode ci[1]
    l4 =  String.fromCharCode ci[2]
    l5 =  vowels[vi[1]]
    l6 =  String.fromCharCode ci[3]

    # if c in vowels
    #     console.log 'errer'
    return l1 + l2 + l3 + l4 + l5 + l6





rand = (min, max) =>
    inrange = Math.floor(Math.random() * (max - min) + min)



    # s = ''
    # for obj in thing
    #     console.log obj
    #     arr = JSON.Stringify obj
    #     ars = arr.split ','
    #     for a in ars
    #         s += a + '\n'
    # return s
