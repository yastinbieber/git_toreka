class Dashboard < ApplicationRecord
	
	# scope :search, -> (search_params) do
 #   return if search_params.blank?

 #     date_from(search_params[:date_from])
 #     .date_to(search_params[:date_to])
 # end
 # scope :date_from, -> (from) { where('idealweight.start_day <= date', from) if from.present? }
 # scope :date_to, -> (to) { where('date <= idealweight.last_day', to) if to.present? }
  
end