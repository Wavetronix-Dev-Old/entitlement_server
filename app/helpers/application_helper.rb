module ApplicationHelper

  def full_title(page_title = nil)
    if page_title.present?
      "Wavetronix - #{page_title}"
    else
      "Wavetronix"
    end
  end

end
