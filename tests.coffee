resources = require './resources'
parts = require './parts'
Buildings = require './buildings'
common = require './common_machine'
Refinery = require './refinery'
Assembler = require './assembler'


refinery = new Refinery.Refinery('smokie')
assembler = new Assembler.Assembler('makie')


raws = {'raws/iron': 100, 'raws/wood': 50}

refinery.loadMaterials(raws)
refinery.refine(resources.mats['mats/iron'])

mats = {'mats/iron': 100,
'mats/fuel': 50,
'mats/copper': 100,
'mats/plastic/1': 20,
'mats/gold': 20,
'mats/steel': 50,
'parts/cpnt/lens/plastic': 4,
}
assembler.loadMaterials(mats)
assembler.assemble(parts.components['parts/cpnt/curcuit/basic'], 15)
assembler.assemble(parts.sensors['parts/sensors/sight/basic'], 2)
assembler.assemble(parts.frames['parts/frames/basic'], 1)
console.log refinery
console.log assembler



# resources.mats['mats/iron'].code = 'mats/iron';
# blueprint = resources.mats['mats/iron']
#
# r = new Refinery('smokie')
# inputs = {'raws/iron': 10}
#
# inputs2 = {'raws/wood': 10, 'raws/iron': 11, 'raws/oil': 5}
# r.loadMaterials(inputs2, r)
#
# r.refine(blueprint)
# #loadMaterials(inputs2, r)
#
# console.log r
