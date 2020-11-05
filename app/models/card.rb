class Card < ApplicationRecord
	belongs_to :user
	# has_one :idealweight, dependent: :destroy
	# has_one :useradvice, dependent: :destroy
end
