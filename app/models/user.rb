class User < ApplicationRecord
  has_many :comments, foreign_key: "creator_id"
  has_many :created_pages, class_name: "Page", foreign_key: "creator_id"
end
