require 'rails_helper'

RSpec.describe Actor, type: :model do

  it {should validate_presence_of :name}
  it {should validate_presence_of :age}

  it {should have_many :actor_movies}
  it {should have_many(:movies).through(:actor_movies)}


  describe 'instance methods' do
    describe '#order_age' do
      it 'organizes actors by their age' do

      @warner = Studio.create(name: "Warner Bros", location: "Los Angeles, CA")

      @reservoir = @warner.movies.create!(title: "Reservoir Dogs", creation_year: 1992, genre: "Action")

      @harvey = Actor.create(name: "Harvey Keitel", age: 80)
      @mike = Actor.create(name: "Michael Madsen", age: 62)
      @tim = Actor.create(name: "Tim Roth", age: 59)

      ActorMovie.create(movie_id: @reservoir.id, actor_id: @harvey.id)
      ActorMovie.create(movie_id: @reservoir.id, actor_id: @mike.id)
      ActorMovie.create(movie_id: @reservoir.id, actor_id: @tim.id)

      expect(@reservoir.actors.order_age).to eq([@tim, @mike, @harvey])
      end
    end

    describe '#avg_age' do
      it 'gives the average age of all actors' do

        @warner = Studio.create(name: "Warner Bros", location: "Los Angeles, CA")

        @reservoir = @warner.movies.create!(title: "Reservoir Dogs", creation_year: 1992, genre: "Action")

        @harvey = Actor.create(name: "Harvey Keitel", age: 80)
        @mike = Actor.create(name: "Michael Madsen", age: 62)
        @tim = Actor.create(name: "Tim Roth", age: 59)

        ActorMovie.create(movie_id: @reservoir.id, actor_id: @harvey.id)
        ActorMovie.create(movie_id: @reservoir.id, actor_id: @mike.id)
        ActorMovie.create(movie_id: @reservoir.id, actor_id: @tim.id)

        expect(@reservoir.actors.avg_age).to eq(67)
      end
    end
  end
end
