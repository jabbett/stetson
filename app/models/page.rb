class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :parent, class_name: "Page", optional: true
  belongs_to :creator, class_name: "User"
  belongs_to :updater, class_name: "User", optional: true
  has_many :comments
end
