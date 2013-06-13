class SessionsController < ApplicationController
  skip_before_filter :require_authentication

  def new
  end

  def create
    author = Author.find_by_email(params[:email])

    if author && author.authenticate(params[:password])
      session[:author_id] = author.id
      redirect_to root_path, :notice => "Nice! You logged in."
    else
      flash.now[:alert] = "Your email or password are not correct."
      render :new
    end
  end

  def destroy
    session[:author_id] = nil
    redirect_to root_path, :notice => "Okay, you're logged out."
  end
end
