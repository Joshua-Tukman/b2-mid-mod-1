class Actor < ApplicationRecord

  validates_presence_of :name,
                        :age

  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.order_age
    order(:age)
  end

  def self.avg_age
    average(:age).to_f
  end

end
