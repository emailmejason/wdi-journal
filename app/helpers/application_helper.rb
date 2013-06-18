module ApplicationHelper
  def title
    if (content_for :page_title).blank?
      "Journal"
    else
      content_for :page_title
    end
  end
end
