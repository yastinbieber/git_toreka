class Fooddiary < ApplicationRecord
	belongs_to :fooddate
  
  belongs_to :user
  validates :user_id, presence: true
  
  belongs_to :idealweight
  
  def self.search(search) 
    if search
      Fooddiary.where(['date LIKE ?', "%#{search}%"]) 
    else
      Fooddiary.where(date: Date.current.all_day)
    end
  end

  before_save do
    self.gram = (amount)*(fooddate.gram)
    self.unit = fooddate.unit
    self.kcal = (amount)*(fooddate.kcal)
    self.protein = (amount)*(fooddate.protein)
    self.fat = (amount)*(fooddate.fat)
    self.carbo = (amount)*(fooddate.carbo)
  end
  
  
  
end
