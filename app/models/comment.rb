class Comment < ApplicationRecord
  belongs_to :page
  belongs_to :creator, class_name: "User"
  belongs_to :resolved_by, class_name: "User", optional: true

  def resolved?
    resolved_at.present?
  end
end
