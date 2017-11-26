class CommentsController < ApplicationController
  attr_reader :comment, :review
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :load_review, only: %i(update destroy)

  def new
    @review = Review.find_by id: params[:review_id]
  end

  def create
    @review = Review.find_by id: comment_params[:review_id]

    if comment.save
      flash[:info] = t "comment_for.success_create"
      success_redirect
    else
      fail_attemped
    end
  end

  def edit; end

  def update
    if comment.update_attributes comment_params
      flash[:info] = t "comment_for.success_update"
      success_redirect
    else
      fail_attemped
    end
  end

  def destroy
    if comment.destroy
      flash[:info] = t "comment_for.success_delete"
      destroy_redirect
    else
      flash[:warning] = t "review_for.fail_attemped"
      redirect_to root_url
    end
  end

  private

  def fail_attemped
    flash.now[:warning] = t "review_for.fail_attemped"
    respond_to do |format|
      format.html{fail_attemped_next}
      format.js
    end
  end

  def fail_attemped_next
    if URI(request.referer).path == "/reviews/#{review.id}"
      render "reviews/show", review: review
    else
      render "books/show", book: review.book
    end
  end

  def load_review
    @review = comment.review
  end

  def success_redirect
    id = comment.id

    if URI(request.referer).path == "/reviews/#{review.id}"
      redirect_to review_path(review, anchor: "comment-#{id}")
    else
      redirect_to book_path(review.book, anchor: "comment-#{id}")
    end
  end

  def destroy_redirect
    id = review.id

    if URI(request.referer).path == "/reviews/#{id}"
      redirect_to review_path(review, anchor: "rerect")
    else
      redirect_to book_path(review.book, anchor: "review-#{id}")
    end
  end

  def comment_params
    params.require(:comment).permit Comment::ATTRIBUTE_PARAMS
  end
end
