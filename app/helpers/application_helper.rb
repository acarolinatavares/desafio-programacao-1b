module ApplicationHelper
  def breadcrumb(paths_array = [], current_page)
    content_tag(:nav, class: 'breadcrumb-nav') do
      content_tag(:div, class: 'nav-wrapper') do
        paths = paths_array.collect { |name, path| content_tag(:a, href: path, class: 'breadcrumb') { name.to_s } }
        paths << content_tag(:a, href: '#!', class: 'breadcrumb') { current_page.to_s }
        paths.join.html_safe
      end
    end
  end

  def flash_messages
    content_tag(:script) do
      "setTimeout(function () { #{ flash.collect { |key, msg| "Materialize.toast('#{ msg }', 2000);" }.join } }, 400);".html_safe
    end
  end

  def array_to_string(string, delimiter)
    string.include?(delimiter) ? string.join(delimiter) : string[0]
  end
end
