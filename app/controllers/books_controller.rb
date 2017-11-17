class BooksController < ApplicationController
  attr_reader :book
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :load_categories, only: %i(new create edit update show )

  def index
    @books = Book.paginate page: params[:page]
  end

  def new; end

  def create
    if book.save
      flash[:success] = t "book_for.success_create"
      redirect_to books_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if book.update_attributes book_params
      flash[:success] = t "book_for.success_update", param: book.title
      redirect_to books_url
    else
      render :edit
    end
  end

  def destroy
    book.destroy if book
    flash[:success] = t "book_for.success_delete", param: book.title
    redirect_to books_url
  end

  private

  def load_categories
    result = Hash.new
    Category.all.each do |child|
      result.store child.name, child.id
    end
    @result = result
  end

  def book_params
    params.require(:book).permit Book::ATTRIBUTE_PARAMS
  end
end
