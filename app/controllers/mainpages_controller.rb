class MainpagesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :plan_comparison, :freeplan, :basicplan, :premiumplan, :termsofservice, :personalinformation]
	
	def index
	end
	
	def plan_comparison
	end
	
	def freeplan
	end
	
	def basicplan
	end
	
	def premiumplan
	end
	
	def termsofservice
	end
	
	def personalinformation
	end
	
end
