class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    #show all categories, ordered by popularity (or some other measure...you decide..)
  end

  def show
    slug = params[:category_name]
    @category = Category.includes(:versions).find(Category.match_id(slug))
    #show all articles(most recent versions) associated with a given category
    @categories = Category.alphabetical_list
  end


end
