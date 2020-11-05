class Useradvice < ApplicationRecord
  
  acts_as_paranoid
  
	belongs_to :user
  validates :user_id, presence: true
  belongs_to :idealweight
  validates :idealweight_id, presence: true
  has_many :advicediaries
  # belongs_to :card
end
