class CellPhone < ApplicationRecord
  validates :name, length: { minimum: 4}
  
  has_many :reviews
end
