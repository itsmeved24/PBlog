module ApplicationHelper
  def body_layout_class
    if controller_name == 'posts' && action_name == 'index'
      'layout-horizontal'
    else
      'layout-vertical'
    end
  end

  def markdown(text)
    Kramdown::Document.new(text, input: 'GFM').to_html.html_safe
  end
end
