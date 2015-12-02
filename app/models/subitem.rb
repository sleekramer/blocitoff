class Subitem < ActiveRecord::Base
  belongs_to :item
  default_scope { order("completed, updated_at")}
  validates :name, length: {minimum: 3}, presence: true
  validates :item, presence: true
end
