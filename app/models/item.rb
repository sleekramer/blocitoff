class Item < ActiveRecord::Base
  belongs_to :user
  has_many :subitems, dependent: :destroy
  default_scope { order(created_at: :desc)}
  validates :name, length: {minimum: 3}, presence: true
  validates :user, presence: true
end
