class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :parse_links

  def parse_links(text)
    exp = /(\[\[)(\w*?)(\]\])/
    text = text.gsub(exp) { '<a href="' + fragment_path(Fragment.find_by(title: Regexp.last_match[2])) + '">'+ $2 +'</a>' }
    return text
  end
end
