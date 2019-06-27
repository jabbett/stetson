module ApplicationHelper
  def icon(name, classes: nil)
    image_tag "feather/#{name}.svg", class: "icon #{classes}"
  end
end
