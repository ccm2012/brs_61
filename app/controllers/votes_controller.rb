class VotesController < ApplicationController
  attr_reader :review
  load_and_authorize_resource

  before_action :authenticate_user!

  def create
    @review = Review.find_by id: params[:review_id]
    if review.liked_by current_user
      success_vote t("review_for.render_like")
    else
      fail_attemped
    end
  end

  def destroy
    @review = Review.find_by id: params[:review_id]
    if review.disliked_by current_user
      success_vote t("review_for.render_unlike")
    else
      fail_attemped
    end
  end

  private

  def fail_attemped
    flash.now[:warning] = t "review_for.fail_attemped"
    if URI(request.referer).path == "/reviews/#{review.id}"
      render "reviews/show", review: review
    else
      render "books/show", book: review.book
    end
  end

  def success_vote redirect
    flash.now[:info] = t "review_for.success_vote"
    respond_to do |format|
      format.html{success_redirect}
      format.js{render redirect}
    end
  end

  def success_redirect
    if URI(request.referer).path == review_path(review)
      redirect_to review
    else
      redirect_to book_path(review.book, anchor: "review-#{review.id}")
    end
  end
end
