# Questions
post '/questions' do
  question = Question.new(question: params[:question])
  question.user_id = current_user.id
  if question.save
    redirect "/question/#{question.id}"
    flash[:notice] = "Question Successfully Created"
  else
    question = Question.find_by(question: params[:question])
    redirect "/question/#{question.id}"
  end
end

get '/question/:id' do
  @question = Question.find(params[:id])
  @answer = Answer.where(question_id: params[:id])
  erb :"static/question"
end

# Delete Question
delete '/questions/:id' do
  Question.find(params[:id]).destroy
  redirect '/'
end

# View Questions without Login
get '/questions' do
  erb :"static/index"
end
