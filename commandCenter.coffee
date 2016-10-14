# commandcenter holds the relevant information for the users context,
# ie: which building, and robot the user is currently controling
# list of available buildings and bots to controling
# active building stats
# amount of staorage space available
# occupied and free bays
# fabricator, refiner and labs and thier stats
# active robot stats (robot currently being inspected)
# fuel
# hopper capacity
# raws carried
# tractor, amature sensors mounted
# position and location
#
# command
# bot return, bot stop,
#

# maybe 3 command modules (bots, building and equipment)
# maybe franchise is command center for buildings

class CommandCenter
    constructor: () ->

module.exports.CommandCenter = CommandCenter
