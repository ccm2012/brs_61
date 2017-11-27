class ReviewsController < ApplicationController
  attr_reader :review, :book
  load_and_authorize_resource

  before_action :authenticate_user!

  def new
    @where = params[:where]
    @book = Book.find_by id: params[:book_id]
    fail_review unless book
  end

  def create
    @book = Book.find_by id: review_params[:book_id]

    fail_review unless book
    if review.save
      flash[:info] = t "review_for.success_create"
      redirect_to book_path(review.book, anchor: "review-#{review.id}")
    else
      render :create
    end
  end

  def edit; end

  def update
    if review.update_attributes review_params
      flash[:info] = t "review_for.success_update"
      redirect_to book_path(review.book, anchor: "review-#{review.id}")
    else
      render :update
    end
  end

  def destroy
    if review.destroy
      flash[:info] = t "review_for.success_delete"
      redirect_to book_path(review.book, anchor: "new-link")
    else
      fail_review
    end
  end

  private

  def fail_review
    flash[:warning] = t "review_for.fail_attemped"
    redirect_to root_url
  end

  def review_params
    params.require(:review).permit Review::ATTRIBUTE_PARAMS
  end
end
