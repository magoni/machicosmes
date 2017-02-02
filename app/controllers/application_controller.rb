class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :parse_links

  def parse_links(text)
    # replace '[[pagetitle]]' with '<a href="pageurl">pagetitle</a>'
    exp = /(\[\[)(\w*?)(\]\])/
    text = text.gsub(exp) do
      found_fragment = Fragment.find_by(title: Regexp.last_match[2])
      if found_fragment then
        '<a href="' + fragment_path(found_fragment) + '">'+ $2 +'</a>'
      else
        $2
      end
    end
    return text
  end
end
