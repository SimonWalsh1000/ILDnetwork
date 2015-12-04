module ApplicationHelper
  def full_title(page_title = '')
    base_title = "The global ILD network"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end


  def flash_messages user
    if user.errors.full_messages.size > 0
      messages = user.errors.full_messages.uniq.map { |msg| content_tag(:li, msg) }.join
      html = <<-HTML
        <div class="alert alert-danger">
            <a href="#" data-dismiss="alert" class="close">×</a>
          <ul>
            #{messages}
          </ul>
         </div>
      HTML
      html.html_safe
    end
  end
end
