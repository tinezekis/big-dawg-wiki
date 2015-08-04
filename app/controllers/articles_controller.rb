class ArticlesController < ApplicationController

  def show_recent
    #this should find the most recent version associated with the given article and display it on a show page
  end

  def index

    #this should show the ten longest (order by content.length DESC limit 10) most recent versions on an index page
  end

  def new
    #redirect to a page where we can title the article. This will render a partial that we can move to main page if we use js
  end

  def create
    #save that new article you just created, redirect to new version page
  end

  def search
    @articles = Article.search(params[:term])

    # accepts params keyword search
    # serves search results
  end


end
