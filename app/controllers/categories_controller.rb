class CategoriesController < ApplicationController
  attr_reader :category
  load_and_authorize_resource

  before_action :authenticate_user!

  def show
    @title = t "pages.title.category", param: category.name
    @books = category.books.paginate page: params[:page], per_page: 20
  end
end
