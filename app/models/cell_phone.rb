class CellPhone < ApplicationRecord
  validates :name, length: { minimum: 4}
  belongs_to :user, optional: true
  has_many :reviews

  def self.search(search)
    where("name ILIKE ? OR manufacturer ILIKE ?", "%#{search}%", "%#{search}%")
  end
 end
