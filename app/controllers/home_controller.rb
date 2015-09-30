class HomeController < ApplicationController
	def index
		@things = Thing.search(params[:search])
	end
end