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
