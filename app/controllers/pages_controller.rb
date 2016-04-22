class PagesController < ApplicationController
	def show
	  if params[:id].match "legal"
	    render :legal
	  else
	  	render 'errors/not_found'
	  end
	end
end
