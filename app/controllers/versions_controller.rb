class VersionsController < ApplicationController

  def new
    if current_user
      @version = Version.new
      @article = Article.find_by slug: params[:article_title]
      @version.article = @article
  else
    redirect_to "/"
  end
  end

  def create
    if current_user
      @version = Version.new(content: params[:version][:content], footnotes: params[:version][:footnotes])
      @version.updating_author = current_user
      @version.article = Article.find_by slug: params[:aritcle_title]
      if @version.save
        redirect_to "/"
        # USE ROUTE BELOW ONCE SHOW_RECENT TEMPLATE IS CREATED
        # redirect_to "articles/#{@article.slug}"
      else
        @errors = @version.errors.full_messages
        render :"views/version/new"
      end

    else
      redirect_to "/"
    end
  end

  def edit
    #same as new version form but pre-populated
  end

  def update
    #save updates
  end

end