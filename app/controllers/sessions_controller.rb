class SessionsController < ApplicationController
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
end
