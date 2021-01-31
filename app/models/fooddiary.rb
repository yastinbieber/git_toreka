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
    self.kcal = (gram)*(fooddate.kcal)
    self.protein = (gram)*(fooddate.protein)
    self.fat = (gram)*(fooddate.fat)
    self.carbo = (gram)*(fooddate.carbo)
  end
  
  
  
end
