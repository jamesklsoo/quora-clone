# Answers
post '/answers' do
  answer = Answer.new(answer: params[:answer_text])
  answer.user_id = current_user.id
  answer.question_id = params[:question_id]
  answer.save
  redirect "/question/#{params[:question_id]}"
end
