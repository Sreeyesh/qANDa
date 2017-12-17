class QuestionsController < ApplicationController
	include ApplicationHelper
	before_action :require_login
	def create
		Question.create(question_params)
		#create_current_user_session question_params[:email]
		redirect_to root_path
	end

	def show
		@question = Question.find(params[:id])

		@answers = @question.answers.order(created_at: :desc).all
	end

	private 

	def question_params
		params.require(:question).permit(:email, :body)
	end

end
