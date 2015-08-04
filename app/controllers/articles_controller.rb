class ArticlesController < ApplicationController

  def show_recent
    slug = params[:article_title]
    @article = Article.find(Article.match_id(slug))
    @version = @article.versions.where(is_most_recent: true)[0]
    @sections = @version.get_sections
    @markdown_content = @version.generate_markdown
    render :"versions/show"
    #this should find the most recent version associated with the given article and display it on a show page
  end

  def index
    #this should show the ten longest (order by content.length DESC limit 10) most recent versions on an index page
    @recent_versions = Article.recent_versions
    ## refactor later
    @ordered_by_content_length = @recent_versions.sort_by{|version| version.content.length}.reverse ## to get desc
    #for edwin
    @articles = @ordered_by_content_length[0..9]
  end

  def new
    if current_user
      @article = Article.new
    else
      redirect_to "/"
    end
  end

  def create

    if current_user
      @article = Article.new({title:params[:article][:title],orig_author_id:current_user.id})
      if @article.save
        redirect_to "/articles/#{@article.to_param}/new_version"
      else
        @errors = @article.errors.full_messages
        render :"articles/new"
      end
    else
      redirect_to "/"
    end
  end

  def search
    @articles = Article.search(params[:term])
    # view not implemented yet
    # render: index
  end



end
