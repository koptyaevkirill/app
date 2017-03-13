class HomeController < ApplicationController
  before_action :set_auth
  def index
      @instruction = Instruction.all.paginate(page: params[:page])
  end

  private
	  def set_auth
	  	@auth = session[:omniauth] if session[:omniauth]
	  end
end
