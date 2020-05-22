# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
warner = Studio.create(name: "Warner Bros", location: "Los Angeles, CA")
paramount = Studio.create(name: "Paramount", location: "Hollywood, CA")

reservoir = warner.movies.create!(title: "Reservoir Dogs", creation_year: 1992, genre: "Action")
pulp = warner.movies.create!(title: "Pulp Fiction", creation_year: 1994, genre: "Action")
true_romance = warner.movies.create!(title: "True Romance", creation_year: 1993, genre: "Action")

fight = paramount.movies.create!(title: "Fight Club", creation_year: 1999, genre: "Suspense")
romance = paramount.movies.create!(title: "Romancing the Stone", creation_year: 1984, genre: "Adventure")
indiana = paramount.movies.create!(title: "Indiana Jones", creation_year: 1981, genre: "Adventure")
