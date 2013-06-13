class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_author
    if session[:author_id]
      @current_author = Author.find(session[:author_id])
    end
  end

  # Remember: ApplicationController sets methods available to all
  # other controllers. But these methods aren't available in any
  # of the views. View methods are called "helpers" (See the app/helpers
  # folder). The `helper_method` line below adds the 'current_author'
  # controller method as a helper method as well. So now we can use
  # `current_author` in views.
  helper_method :current_author
end
