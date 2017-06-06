class CellPhone < ApplicationRecord
  validates :name, length: { minimum: 4}
  belongs_to :user, optional: true
  has_many :reviews
  has_many :votes, dependent: :destroy

  def self.search(search)
    where("name ILIKE ? OR manufacturer ILIKE ?", "%#{search}%", "%#{search}%")
  end
 end
