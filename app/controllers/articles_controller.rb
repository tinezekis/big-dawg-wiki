class ArticlesController < ApplicationController

  def show_recent
    slug = params[:article_title]
    @article = Article.find(Article.match_id(slug))
    @version = @article.versions.where(is_most_recent: true)[0]
    @sections = @version.get_sections
    @markdown_content = @version.generate_markdown
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


end