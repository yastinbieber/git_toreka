class Howtovideo < ApplicationRecord
# 	has_many :advicediaries
	
	def self.search(search) 
    if search
      Howtovideo.where(['menu LIKE ?', "%#{search}%"])
    else
      Howtovideo.all
    end
  end
end
