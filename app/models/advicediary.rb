class Advicediary < ApplicationRecord
  
  validates :weight, presence: true
  validates :reps, presence: true
  validates :weightsecond, presence: true
  validates :repssecond, presence: true
  validates :weightthird, presence: true
  validates :repsthird, presence: true
  # validates :memo, presence: true
  
  belongs_to :user
  validates :user_id, presence: true
  belongs_to :advicemenu
  # belongs_to :howtovideo
  belongs_to :useradvice
  validates :useradvice_id, presence: true
  belongs_to :idealweight
  validates :idealweight_id, presence: true
  # belongs_to :workoutdate
  # validates :workoutdate_id, presence: true
  
  # scope :search, -> (search_params) do
  #   unless search_params.blank?
  #   advicemenu_id_is(search_params[:advicemenu_id])
  #     .date_from(search_params[:date_from])
  #     .date_to(search_params[:date_to])
  #   else
  #     Advicediary.where(date: Date.current.all_day)
  #   end
  # end
  # scope :date_from, -> (from) { where('? <= date', from) if from.present? }
  # scope :date_to, -> (to) { where('date <= ?', to) if to.present? }
  # scope :advicemenu_id_is, -> (advicemenu_id) { where(advicemenu_id: advicemenu_id) if advicemenu_id.present? }
  
  scope :search, -> (search_params) do
    unless search_params.blank?
      date_from(search_params[:date_from])
      .date_to(search_params[:date_to])
    else
      Advicediary.where(date: Date.current.all_day)
    end
  end
  scope :date_from, -> (from) { where('? <= date', from) if from.present? }
  scope :date_to, -> (to) { where('date <= ?', to) if to.present? }
  
end
