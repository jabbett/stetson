module PagesHelper
  WIKI_LINK_REGEXP =
    /\[\[
      (?:([^\[\]\|]+)\|)?
      ([^\[\]]+)
     \]\]
     (\w+)?/xu

  def wiki_linkify(str)
    str.gsub WIKI_LINK_REGEXP do |_m|
      text = "#{Regexp.last_match(2)}#{Regexp.last_match(3)}"
      link, anchor = Regexp.last_match(1) ? Regexp.last_match(1).split('#', 2) : Regexp.last_match(2)

      "<a href=\"#{link.parameterize}#{'#' + anchor if anchor}\">#{text}</a>"
    end.html_safe
  end
end
