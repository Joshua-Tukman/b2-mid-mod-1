require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit a studio index page' do
    it 'I see a list of all the movies studios' do

      warner = Studio.create(name: "Warner Bros", location: "Los Angeles, CA")
      paramount = Studio.create(name: "Paramount", location: "Hollywood, CA")

      reservoir = warner.movies.create!(title: "Reservoir Dogs", creation_year: 1992, genre: "Action")
      pulp = warner.movies.create!(title: "Pulp Fiction", creation_year: 1994, genre: "Action")
      true_romance = warner.movies.create!(title: "True Romance", creation_year: 1993, genre: "Action")

      fight = paramount.movies.create!(title: "Fight Club", creation_year: 1999, genre: "Suspense")
      romance = paramount.movies.create!(title: "Romancing the Stone", creation_year: 1984, genre: "Adventure")
      indiana = paramount.movies.create!(title: "Indiana Jones", creation_year: 1981, genre: "Adventure")

      visit "/studios"

      expect(page).to have_content("List of Studios:")
      expect(page).to have_content("#{warner.name}")
      expect(page).to have_content("#{paramount.name}")

      within ".studio-#{warner.id}" do
        expect(page).to have_content("#{reservoir.title}")
        expect(page).to have_content("#{pulp.title}")
        expect(page).to have_content("#{true_romance.title}")

        expect(page).to_not have_content("#{fight.title}")
        expect(page).to_not have_content("#{indiana.title}")
        expect(page).to_not have_content("#{romance.title}")
      end

      within ".studio-#{paramount.id}" do
        expect(page).to have_content("#{fight.title}")
        expect(page).to have_content("#{indiana.title}")
        expect(page).to have_content("#{romance.title}")

        expect(page).to_not have_content("#{reservoir.title}")
        expect(page).to_not have_content("#{pulp.title}")
        expect(page).to_not have_content("#{true_romance.title}")
      end
          
    end
  end
end

# Story 1
# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.
