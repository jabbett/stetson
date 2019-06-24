module ApplicationHelper
  def icon(name, classes: nil)
    "<i class='zmdi zmdi-#{name} #{classes}'></i>".html_safe
  end
end
