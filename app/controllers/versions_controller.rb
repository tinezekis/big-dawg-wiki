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
      @version.categories = Category.parse_categories_from_string(params[:categories])
      slug = params[:article_title]
      @article = Article.find(Article.match_id(slug))
      @version.article = @article

      if @version.save
        redirect_to "/articles/#{@version.article.to_param}/versions/#{@version.id}"
      else
        @errors = @version.errors.full_messages
        render :"views/versions/new"
      end

    else
      redirect_to "/"
    end
  end

  def edit
    @version = Version.find(params[:id])
    if (@version.updating_author == current_user && @version.is_published == false)|| current_user.permission_level == 'big_dawg'
      render :"versions/edit"
    else
      redirect_to "/articles/#{@version.article.to_param}/versions/#{@version.id}"
    end

  end

  def update
    @version = Version.find(params[:id])
    @version.update(content: params[:version][:content], footnotes: params[:version][:footnotes])
    redirect_to "/articles/#{@version.article.to_param}/versions/#{@version.id}"
  end

  def show
    @version = Version.find(params[:id])
    @sections = @version.get_sections
    @markdown_content = @version.generate_markdown
  end

  def publish
    @version = Version.find(params[:id])
    @version.is_published = true
    @version.article.versions.each do |version|
      version.is_most_recent = false
    end
    @version.is_most_recent = true
    @version.save
    redirect_to "/articles/#{@version.article.to_param}"
  end

end
