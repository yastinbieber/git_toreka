class Fooddate < ApplicationRecord
	has_many :fooddiaries
	
# 	before_save do
# 		self.gram = (inputgram)/(inputgram)
#     self.kcal = (kcal)/(inputgram)
#     self.protein = (protein)/(inputgram)
#     self.fat = (fat)/(inputgram)
#     self.carbo = (carbo)/(inputgram)
#   end
end
