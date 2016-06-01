class HomeController < ApplicationController

	def index
		if params[:query].nil?
	    @things = []
	  else
	    @things = Thing.search params[:query]
	  end
	end

end
