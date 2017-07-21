# Sign Up/Login Page
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

# User Profile
get '/user/:id' do
  erb :"static/profile"
end
