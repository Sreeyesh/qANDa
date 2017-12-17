class AnswersController < ApplicationController
	include ApplicationHelper
	def create
		question = Question.find(params[:answer][:question_id])
		answer 	 = Answer.create(answer_params)
		question.answers << answer

		#QaMailer.notify_question_author(answer).deliver_now
		QaMailer.notify_question_author(answer).deliver_later
		#create_current_user_session answer_params[:email]
		redirect_to question
	end

	private

	def answer_params
		params.require(:answer).permit(:question_id, :email, :body)
	end
end
