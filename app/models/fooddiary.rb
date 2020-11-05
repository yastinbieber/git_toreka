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
  
  # def calory_of_days(day_range) # start_day .. end_day で戻りがHash
  #   fooddiaries.where(created_at: day_range). # 期間のfooddiaryを集め
  #   group_by{|fooddiary| fooddiary.created_at.to_date}. # 日付でグループ分けし
  #   map{|date,ary_fooddiary|  # 日毎にカロリーを合計する
  #   [date,ary_fooddiary.inject(0){|cal,fooddiary| cal + fooddiary.kcal}]}.to_h
  # end
  
  
  
end
