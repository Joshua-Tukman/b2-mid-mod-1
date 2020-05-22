require 'rails_helper'

RSpec.describe Studio, type: :model do
  
  it {should validate_presence_of :name}
  it {should validate_presence_of :location}

  it {should have_many :movies}

end
