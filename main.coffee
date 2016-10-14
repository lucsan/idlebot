# main controller for the program

# import list
resources = require './resources'
parts = require './parts'
units = require './units' # buildings
# import classes
common = require './common_machine'
refinery = require './refinery'
fabricator = require './fabricator'
Botron = require './botron'
User = require './user'
Franchise = require './franchise'
Building = require './building'
CommandCenter = require './CommandCenter'

# get user class and populate with saved user data.

user = new User.User('baz')

console.log user
#$franchise = new Franchise.Franchise('baz place')
# start the show

console.log user.franchise.buildings
