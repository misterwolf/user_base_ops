class HomeController < ApplicationController

  def index
  end

  def welcome
    if !user_signed_in?
      redirect_to root_path
    end
  end

end
