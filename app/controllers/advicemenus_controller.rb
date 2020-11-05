class AdvicemenusController < ApplicationController
	def introduction
    @advicemenus = Advicemenu.search(params[:search])
  end
end
