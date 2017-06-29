get '/' do
  if logged_in?
    erb :"static/index"
  else
    erb :"static/signup"
  end
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
    flash[:notice] = "Sign up successful. Please login to continue."
  else
    erb :"static/signup"
  end
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    login(@user)
    flash[:notice] = "Login Successful"
    redirect '/'
  elsif @user == nil
    redirect '/'
    flash[:error] = "Incorrect username"
  else
    redirect '/'
    flash[:error] = "Incorrect password"
  end
end

post '/logout' do
  session.clear
  redirect '/'
end

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

post '/answers' do
  answer = Answer.new(answer: params[:answer_text])
  answer.user_id = current_user.id
  answer.question_id = params[:question_id]
  answer.save
  redirect "/question/#{params[:question_id]}"
end

post '/question_vote' do
  @question = Question.find(params[:question_id])
  @vote = QuestionVote.find_or_initialize_by(question_id: params[:question_id], user_id: current_user.id, vote: params[:vote_submit])
  if @vote.vote == true   # if you click upvote
    if @vote.new_record?  # you have not clicked upvote before
      @vote.vote = true
    else                  # you have already clicked upvote
      @vote.destroy
    end
  else                    # if you click downvote
    if @vote.new_record?  # you have not clicked downvote before
      @vote.vote = false
    else                  # you have already clicked downvote
      @vote.destroy
    end
  end

  @vote.save

  if request.xhr?
    {upvote_count: @question.question_votes.where(vote: true).count, downvote_count: @question.question_votes.where(vote: false).count}.to_json
  else
    redirect "/question/#{params[:question_id]}"
  end

end

post '/answer_vote' do
  @answer = Answer.find(params[:answer_id])
  @vote = AnswerVote.find_or_initialize_by(answer_id: params[:answer_id], user_id: current_user.id, vote: params[:vote_submit])
  if @vote.vote == true   # if you click upvote
    if @vote.new_record?  # you have not clicked upvote before
      @vote.vote = true
    else                  # you have already clicked upvote
      @vote.destroy
    end
  else                    # if you click downvote
    if @vote.new_record?  # you have not clicked downvote before
      @vote.vote = false
    else                  # you have already clicked downvote
      @vote.destroy
    end
  end

  @vote.save

  if request.xhr?
    {upvote_count: @answer.answer_votes.where(vote: true).count, downvote_count: @answer.answer_votes.where(vote: false).count, answer_id: @answer.id}.to_json
  else
    redirect "/question/#{params[:question_id]}"
  end

end

get '/user/:id' do
  erb :"static/profile"
end

delete '/questions/:id' do
  Question.find(params[:id]).destroy
  redirect '/'
end
