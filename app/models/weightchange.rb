class Weightchange < ApplicationRecord
	belongs_to :user
  belongs_to :idealweight
  
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
      Weightchange.all
    end
  end
  scope :date_from, -> (from) { where('? <= date', from) if from.present? }
  scope :date_to, -> (to) { where('date <= ?', to) if to.present? }
  
  before_save do
    self.expected_weight = (idealweight.weight)-((idealweight.minusweight_day)*(user.what_day))
  end
end
