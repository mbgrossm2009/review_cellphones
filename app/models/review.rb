class Review < ApplicationRecord
  validates :name, length: { minimum: 4}

  belongs_to :cell_phone
end
