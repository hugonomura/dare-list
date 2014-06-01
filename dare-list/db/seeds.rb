# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Challenge.create(name: 'feijoada', type: false  , description: "blah blah", date: Date.tomorrow)
Challenge.create(name: 'caipirinha', type: false, description: "caipi caipi blah", date: Date.tomorrow)
Challenge.create(name: 'por do sol', type: false , description: "sol sol blah", date: Date.tomorrow)
Challenge.create(name: 'pastel de flango', type: false, description: "uhhhh flango", date: Date.tomorrow)
Challenge.create(name: 'surfar no ocenao', type: false, description: "surf surf", date: Date.tomorrow)




