class SessionsController < ApplicationController

  # Log in
  def create
    auth = request.env["omniauth.auth"]

    # Go find the user. If they do not exist yet, create them.
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)

    # Save the user_id in the session
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in successfully!"
  end

  # Log out
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Log out successful."
  end
end
