class ReadingHistoriesController < ApplicationController
  attr_reader :reading_history, :book
  load_and_authorize_resource

  before_action :authenticate_user!, :find_book

  def create
    if reading_history.save
      success_mark reading_history.mark_as
      redirect_to book
    else
      fail_mark
    end
  end

  def update
    reading_history = current_user.reading_histories.find_by book_id:
      reading_history_params[:book_id]
    if reading_history.update_attributes reading_history_params
      success_mark reading_history.mark_as
      redirect_to book
    else
      fail_mark
    end
  end

  def destroy
    reading_history = current_user.reading_histories.find_by book_id:
      reading_history_params[:book_id]
    if reading_history.destroy
      flash[:info] = t "book_for.unmark"
      redirect_to book
    else
      flash.now[:warning] = t "book_for.fail_unmark"
    end
  end

  private

  def success_mark mark_as
    flash[:success] = t "book_for.mark", param: mark_as.titleize
  end

  def fail_mark
    flash.now[:warning] = t "book_for.fail_mark"
  end

  def find_book
    @book = Book.find_by id: params[:book_id]
    return if book
    flash[:warning] = t "book_for.fail_find_book"
    redirect_to root_url
  end

  def reading_history_params
    params.require(:reading_history).permit ReadingHistory::ATTRIBUTE_PARAMS
  end
end
