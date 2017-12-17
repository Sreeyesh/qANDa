class HomeController < ApplicationController

	before_action :require_login

  def index
  	@questions = Question.order(created_at: :desc).all
  end

end
