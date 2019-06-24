class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :parent, class_name: "Page", optional: true
end
