class SessionsController < ApplicationController
  def new
  end

  def create
    # If the user exists AND the password entered is correct.
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Sets user id inside the browser cookie. Logs in user
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/sessions/new'
  end

end
