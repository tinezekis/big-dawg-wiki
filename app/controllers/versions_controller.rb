class VersionsController < ApplicationController

  def new
    if current_user
      @version = Version.new
      slug = params[:article_title]
      @article = Article.find(Article.match_id(slug))
      @version.article = @article
  else
    redirect_to "/"
  end
  end

  def create
    if current_user
      @version = Version.new(content: params[:version][:content], footnotes: params[:version][:footnotes])
      @version.updating_author = current_user
      slug = params[:article_title]
      @article = Article.find(Article.match_id(slug))
      @version.article = @article

      if @version.save
        redirect_to "articles/#{@article.slug}"
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