class ArticlesController < ApplicationController
  require "open-uri"

  skip_before_filter :require_authentication, :only => [:index, :show]
  # Apply to all: Only show up if user is logged in.

  def index
    @articles = Article.all
    session[:visitor_name] = "Paul"
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # Only show up if user is logged in.
    @article = Article.new
  end

  def edit
    # Only show up if user is logged in.
    @article = Article.find(params[:id])
  end

  def create
    # Only work if user is logged in.
    @article = Article.new(params[:article])

    if @article.content.blank?
      # Fetches content related to the title of the article
      # from Wikipedia (http://en.wikipedia.org/wiki/USA).
      wiki_content = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/#{@article.title}"))

      wiki_content = wiki_content.css("#mw-content-text p")[0].content

      @article.content = wiki_content

      @twilio_client.account.sms.messages.create(
        :from => '+18582076374',
        :to => '+18587742345',
        :body => "#{@article.title} article added with Wikipedia content."
      )
    end

    if @article.save
      redirect_to articles_path, :notice => "You did it! Nice article."
    else
      flash.now[:alert] = "FAIL."
      render :new
      # In Sinatra, it would be `erb :new`.
    end
  end

  def update
    # Only work if user is logged in.
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to articles_path
    else
      render :edit
      # In Sinatra, it would be `erb :edit`.
    end
  end

  def destroy
    # Only show up if user is logged in.
    @article = Article.find(params[:id])

    @article.destroy

    redirect_to articles_path
  end
end
