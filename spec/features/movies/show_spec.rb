require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit a movies show page' do
    before(:each) do
      @warner = Studio.create(name: "Warner Bros", location: "Los Angeles, CA")

      @reservoir = @warner.movies.create!(title: "Reservoir Dogs", creation_year: 1992, genre: "Action")
      @pulp = @warner.movies.create!(title: "Pulp Fiction", creation_year: 1994, genre: "Action")

      @harvey = Actor.create(name: "Harvey Keitel", age: 80)
      @mike = Actor.create(name: "Michael Madsen", age: 62)
      @tim = Actor.create(name: "Tim Roth", age: 59)

      @john = Actor.create(name: "John Travolta", age: 66)
      @quentin = Actor.create(name: "Quentin Tarantino", age: 57)
      @uma = Actor.create(name: "Uma Thurman", age: 50)

      ActorMovie.create(movie_id: @reservoir.id, actor_id: @harvey.id)
      ActorMovie.create(movie_id: @reservoir.id, actor_id: @mike.id)
      ActorMovie.create(movie_id: @reservoir.id, actor_id: @tim.id)

      ActorMovie.create(movie_id: @pulp.id, actor_id: @john.id)
    end
    it 'I see a the movies title, creation year and genre' do

      visit "/movies/#{@reservoir.id}"

      expect(page).to have_content("Movie Title: #{@reservoir.title}")
      expect(page).to have_content("Year of Release: #{@reservoir.creation_year}")
      expect(page).to have_content("Genre: #{@reservoir.genre}")

      expect(page).to_not have_content("Genre: #{@pulp.title}")

    end

    it 'I see a list of all the actors from oldest to youngest' do

      visit "/movies/#{@reservoir.id}"

      within ".actor-0" do
        expect(page).to have_content("#{@tim.name}")
      end

      within ".actor-1" do
        expect(page).to have_content("#{@mike.name}")
      end

      within ".actor-2" do
        expect(page).to have_content("#{@harvey.name}")
      end

    end

    it 'I see an average of all the ages of the actors in movie' do

      visit "/movies/#{@reservoir.id}"

      expect(page).to have_content("Average age of actors in film: 67")
    end

    it 'I see a form to add another actor to the movie' do

      visit "/movies/#{@reservoir.id}"
      expect(page).to_not have_content("#{@john.name}")

      fill_in :name, with: @john.name
      click_button "Add actor to film"

      expect(page).to have_content("#{@john.name}")
    end
  end
end
# Story 3
# As a visitor,
# When I visit a movie show page,
# I see a form for an actors name
# and when I fill in the form with an existing actor's name
# I am redirected back to that movie's show page
# And I see the actor's name listed
# (This should not break story 3, You do not have to test for a sad path)
