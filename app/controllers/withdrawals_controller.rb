class WithdrawalsController < ApplicationController
	
	def new
		@withdrawal = Withdrawal.new
	end
	
	def create
		@withdrawal = Withdrawal.create(withdrawal_params)
		# redirect_to controller: :mainpages, action: :index
	end
	
	private
	def withdrawal_params
		params.require(:withdrawal).permit(:user_id, :reason)
	end
end
