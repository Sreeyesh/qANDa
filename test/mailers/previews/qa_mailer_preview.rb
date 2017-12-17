# Preview all emails at http://localhost:3000/rails/mailers/qa_mailer
class QaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/qa_mailer/notify_question_author
  def notify_question_author
    question = Question.create email: "author@question.com", body: "test question"
  	answer = Answer.create email:"author@answer.com", body:"test answer"
  	question.answers << answer 
    mail = QaMailer.notify_question_author(answer)
  end

end
