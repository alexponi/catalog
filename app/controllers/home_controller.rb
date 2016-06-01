class HomeController < ApplicationController
	def index
		if params[:query].nil?
	    @things = []
	  else
	    @things = Thing.__elasticsearch__.search params[:query]
	  end
	end
end