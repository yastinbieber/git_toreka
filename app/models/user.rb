class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  # 論理削除にすると同じアドレスで再登録できなくなるから一旦USERは物理削除で
  # acts_as_paranoid
         
  has_one_attached :image
  has_many :workoutdiaries, dependent: :destroy
  has_many :workoutstocks, dependent: :destroy
  has_many :fooddiaries, dependent: :destroy
  has_one :useradvice, dependent: :destroy
  has_one :idealweight, dependent: :destroy
  has_many :weightchanges, dependent: :destroy
  has_many :withdrawals
  has_many :cards
  has_many :advicediaries
  
  
  def set_date
    birthday.try(:strftime, "%Y%m%d").to_i
  end
  
  def today_date
    @today = Date.current
    @today.strftime("%Y%m%d").to_i
  end
  
  def today
    @today = Date.current
  end
  
  before_save do
    self.age = (today_date-set_date)/10000
  end
  
  def start_day_date
    idealweight.start_day.strftime("%Y%m%d").to_i
  end
  
  def last_day_date
    idealweight.last_day.strftime("%Y%m%d").to_i
  end
  
  def what_day
    (today - idealweight.start_day).to_i+1
  end
  
end
