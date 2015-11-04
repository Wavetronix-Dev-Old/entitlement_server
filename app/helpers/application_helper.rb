module ApplicationHelper
  def full_title(page_title = nil)
    if page_title.present?
      "Entitlement Server - #{page_title}"
    else
      "Entitlement Server"
    end
  end
end
