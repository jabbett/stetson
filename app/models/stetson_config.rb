class StetsonConfig < ApplicationRecord
  belongs_to :home_page, class_name: "Page"
end
