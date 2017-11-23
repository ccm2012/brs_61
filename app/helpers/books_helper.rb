module BooksHelper
  def link_to_toggle_book_reading_histories book, mark_as
    history = current_user.reading_histories.find_by book_id: book
    url = book_reading_histories_path book,
      reading_history: {user_id: current_user, book_id: book, mark_as: mark_as}
    load_link_to history, mark_as, url
  end

  private

  def load_link_to history, mark_as, url
    link_name = t "book_for.name_mark", param: mark_as

    if history && history.mark_as == mark_as
      link_to link_name, url,
        method: "DELETE",
        remote: true,
        class: "fa fa-bookmark-o btn btn-sm clicked"
    elsif history
      link_to link_name, url,
        method: "PATCH",
        remote: true,
        class: "fa fa-bookmark btn btn-sm btn-default"
    else
      link_to link_name, url,
        method: "POST",
        remote: true,
        class: "fa fa-bookmark btn btn-sm color-black"
    end
  end
end
