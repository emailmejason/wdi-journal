class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_author
    if session[:author_id]
      @current_author = Author.find(session[:author_id])
    end
  end
  helper_method :current_author
end
