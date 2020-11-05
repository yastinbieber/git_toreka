class Weightchange < ApplicationRecord
	belongs_to :user
  belongs_to :idealweight
  
  # scope :search, -> (search_params) do
  #   return if search_params.blank?

  #     date_from(search_params[:date_from])
  #     .date_to(search_params[:date_to])
  # end
  # scope :date_from, -> (from) { where('? <= date', from) if from.present? }
  # scope :date_to, -> (to) { where('date <= ?', to) if to.present? }
  
  def start_days
    str_start_day = idealweight.start_day
    str_start_day.to_date
  end
  
  def last_days
    str_last_day = idealweight.last_day
    str_last_day.to_date
  end
  
  # 仮
  scope :search, -> (search_params) do
    unless search_params.blank?

      date_from(search_params[:date_from])
      .date_to(search_params[:date_to])
    else
      # Weightchange.where(date: Idealweight.start_day)
      Weightchange.where(date: Date.current.all_day)
      # Weightchange.where(date: "Idealweight.start_day")
      # Weightchange.where(date: idealweight.start_day..idealweight.last_day)
      # Weightchange.where(date: Idealweight.start_day.."Idealweight.last_day")
      # Weightchange.where(date: '2020-08-23'..'2020-08-24')
      # Weightchange.where(date: 'start_day_date'..'last_day_date')
      # Weightchange.where(date: 'Date.today')
      # Weightchange.where(date: 'start_days'..'last_days')
    end
  end
  scope :date_from, -> (from) { where('? <= date', from) if from.present? }
  scope :date_to, -> (to) { where('date <= ?', to) if to.present? }
  
  before_save do
    self.expected_weight = (idealweight.weight)-((idealweight.minusweight_day)*(user.what_day))
  end
end
