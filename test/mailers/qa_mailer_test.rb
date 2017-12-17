require 'test_helper'

class QaMailerTest < ActionMailer::TestCase
  test "notify_question_author" do

  	question = Question.create email: "author@question.com", body: "test question"
  	answer = Answer.create email:"author@answer.com", body:"test answer"
  	question.answers << answer 
    mail = QaMailer.notify_question_author(answer)
    assert_equal "New Answer to Your Question", mail.subject
    assert_equal [question.email], mail.to
    assert_equal [answer.email], mail.from
    assert_match answer.body, mail.body.encoded
  end

end
