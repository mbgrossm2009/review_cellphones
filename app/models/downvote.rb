class Downvote < ApplicationRecord
  belongs_to :cell_phone
  belongs_to :user

  validates :user, uniqueness: { scope: :cell_phone,
     message: "You are only allowed one vote by cell phone" }

  validates :user, :cell_phone, presence: true

end
