class CellPhone < ApplicationRecord

  validates :name, presence: true, length: { minimum: 4}
  validates :manufacturer, presence: true
  belongs_to :user, optional: true
  has_many :reviews
  has_many :votes, dependent: :destroy
  has_many :downvotes

  def self.search(search)
    where("name ILIKE ? OR manufacturer ILIKE ?", "%#{search}%", "%#{search}%")
  end
 end
