class HowtovideosController < ApplicationController
	def index
    @howtovideo = Howtovideo.search(params[:search])
  end
end
