class Idealweight < ApplicationRecord
  
  acts_as_paranoid
  
	belongs_to :user
  has_many :fooddiaries
  has_many :advicediaries
  has_many :weightchanges
  has_one :useradvice, dependent: :destroy
  # belongs_to :card
  
  before_save do
    if user.sex == "男"
      self.basemetabolism = 13.397*(weight)+4.799*(height)-5.677*(user.age)+88.362 #男性の場合
    else
      self.basemetabolism = 9.247*(weight)+3.098*(height)-4.33*(user.age)+447.593 #女性の場合
    end
    self.kcalburned = (basemetabolism)*(exerciselevel)
    self.minusweight = (weight)-(targetweight)
    self.minuskcal = (minusweight)*7000
    self.period = ((last_day) - (start_day)).to_i+1
    self.minusweight_day = (minusweight) / (period)
    self.kcalintake = (kcalburned)-(minuskcal)/(period)
    self.intakeproteingram = (weight)*2
    self.intakeproteinkcal = (weight)*2*4
    self.intakefatkcal = (kcalintake)*0.2
    self.intakefatgram = (intakefatkcal)/9
    self.intakecarbokcal = (kcalintake)-(intakeproteinkcal)-(intakefatkcal)
    self.intakecarbogram = (intakecarbokcal)/4
  end
  
  def self.bye_idealweight
    Idealweight.where("last_day<?", Date.current).destroy_all
  end
  
  def start_days
    str_start_day = idealweight.start_day
    str_start_day.to_date
  end
  
  def last_days
    str_last_day = idealweight.last_day
    str_last_day.to_date
  end
  
end


