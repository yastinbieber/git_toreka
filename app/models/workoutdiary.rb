class Workoutdiary < ApplicationRecord

  belongs_to :user
  # validates :user_id, presence: true
  
  belongs_to :workoutdate
  # validates :workoutdate_id, presence: true
  
  # 検索
  scope :search, -> (search_params) do
    unless search_params.blank?

    workoutdate_id_is(search_params[:workoutdate_id])
      .date_from(search_params[:date_from])
      .date_to(search_params[:date_to])
    else
      Workoutdiary.where(date: Date.current.all_day)
    end
  end
  scope :date_from, -> (from) { where('? <= date', from) if from.present? }
  scope :date_to, -> (to) { where('date <= ?', to) if to.present? }
  scope :workoutdate_id_is, -> (workoutdate_id) { where(workoutdate_id: workoutdate_id) if workoutdate_id.present? }
  
  
end
