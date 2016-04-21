class PagesController < ApplicationController
	def show
	  if params[:id].match "legal"
	    render :legal
	  end
	end
end
