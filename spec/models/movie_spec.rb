require 'rails_helper'

RSpec.describe Movie, type: :model do

  it {should validate_presence_of :title}
  it {should validate_presence_of :creation_year}
  it {should validate_presence_of :genre}

  it {should belong_to :studio}
  it {should have_many :actor_movies}
  it {should have_many(:actors).through(:actor_movies)}

end
