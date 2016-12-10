
#franchise = require './franchise'
#Buildings = require './buildings'

common = require './common'
structures = require './Data/structures' # buildings

class compound
    buildings = []
    currentBuilding = null
    constructor: () ->
        @buildings = []
        @currentBuilding = null

class building
    constructor: (@blueprint) ->
        for item, value of @blueprint
            @[item] = value

class bay
    constructor: (@blueprint) ->
        for item, value of @blueprint
            @[item] = value


setBuilding = (compound, building) =>
    compound.buildings.push building
    compound.currentBuilding = compound.buildings.length


setBay = (compound, buildingCode, bay) =>
    for i, b of compound.buildings
        if b.code == buildingCode
            compound.buildings[i].bays.push bay if checkBuildingCapacity b

checkBuildingCapacity = (building) =>
    return true if building.max.bays > building.bays.length
    false

findBays = (building, code) =>
    a = []
    for i, b of building.bays
        a.push b if b.code == code
    return a

rech = new bay structures.bays['structures/shed/bay/recharge']
stor = new bay structures.bays['structures/shed/bay/storage']

shed = new building structures.buildings['structures/buildings/shed/command']
comp = new compound

setBuilding comp, shed
setBay comp, 'structures/buildings/shed/command', rech
setBay comp, 'structures/buildings/shed/command', stor
setBay comp, 'structures/buildings/shed/command', stor

stbs = findBays shed, 'structures/shed/bay/storage'

console.log comp

console.log stbs



# console.log  comp.buildings.length
# console.log  comp.buildings[0].bays.length
# console.log comp.buildings
#
# for i, b of comp.buildings
#     for j, a of b.bays
#         console.log a


# bay = new Buildings.Bay
# shed = new Buildings.Building
#
# console.log bay
# console.log shed
#BotBits.listParts()



#console.log structures.buildings['structures/buildings/shed/command']



#console.log JSON.parse structures.buildings['structures/buildings/shed/command']

# objarr1 = { 'a':{'w','e'}, 'b':{'f':{'p':5},'g'} }
#
# console.log objarr1
# console.log  objarr1['a']
# console.log objarr1['b']['f']
# console.log objarr1['b']['f']['p']
#
# qq = {}
#
# qq['ww'] = 'ee'
#
# console.log qq

# array1 = { 'a', 'b', 'c' }
#
# array2 = { 's':1, '8':2, 'q':3 }
#
# array3 = [ 'd', 'e', 'f']
#
# array5 = ['f':['g'], 'h':'j','k':7]
#
# array4 = [
#     'ww':{
#         'aa'
#         'bb'
#         'cc'
#     }
#     'xx':{'dd':'qqq','ee':'www','ff':'eee'}
# ]
#
# console.log array1, array2, array3, array4, array5
#
# console.log array1['a'], array2['8']
#
#
# for i, a in array1
#     console.log 'in a1 ', i, a
#
# for a, i of array1
#     console.log 'of a1 ', i, a
#
# for a, i of array2
#     console.log 'of a2 (i)', i, a
#
# for a of array2
#     console.log 'of a2 ', a
#
# for a, i in array3
#     console.log 'in a3 (i) ', i, a
#
# for a in array3
#     console.log 'in a3 ', a
#
# for a of array3
#     console.log 'of a3 ' + a
#
# console.log array2['s']
#
# for a in array4
#     console.log 'in ', a
#
# for i, a in array4
#     console.log 'in (1) ', i, a
#
# for a of array4
#     console.log 'of ', a
#
# for a, i of array4
#     console.log 'of ', i, a
#
# console.log array4['ww'], array4[0], array4[1]
#
# for i, a of array5
#     console.log '5 of (1)', i , a
