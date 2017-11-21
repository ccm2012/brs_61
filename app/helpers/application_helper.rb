module ApplicationHelper
  def full_title page_title = ""
    base_title = page_title.empty? ? "" : "" + page_title + " | "
    base_title << t("pages.title.default")
  end

  def header text
    content_for(:header){text.to_s}
  end

  def book_search
    @search = Book.search params[:q]
  end
end
