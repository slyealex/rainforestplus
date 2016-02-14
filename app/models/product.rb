class Product < ActiveRecord::Base
  validates :name, :description, presence: true
  validates :price_in_cents, numericality: {only_integer: true}

  has_many :reviews
  has_many :users, through: :reviews
end
