class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_authentication
  before_filter :setup_twilio_client

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

  def require_authentication
    if current_author.nil?
      redirect_to root_path, :alert => "You must be logged in."
    end
  end

  def setup_twilio_client
    if @twilio_client.nil?
      @twilio_client = Twilio::REST::Client.new(
        ENV["TWILIO_ID"],
        ENV["TWILIO_SECRET"]
      )
    end
  end
end















