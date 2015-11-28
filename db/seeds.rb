# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do
    
	chef = Chef.create(chef_name: "Ahmed", email: "ahmed.elmasry707@gmail.com", password: "password")
    
    10.times do |num|
       Recipe.create(name: "Recipe-#{num}", 
                    summary: "The summary of the recipe-#{num}", 
                    description: "1. put oil in pin.\n2. heat the oil.\n3. put the vegetables.\n4. cook for 20 minutes.",
                    chef: chef)
    end
end