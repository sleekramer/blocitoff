class Item < ActiveRecord::Base
  belongs_to :user
  default_scope { order(created_at: :desc)}
  validates :name, length: {minimum: 3}, presence: true
  validates :user, presence: true

  def completed?
    completed_at?
  end

  def mark_complete!
    touch :completed_at
  end

  def mark_incomplete!
    update(completed_at: nil)
  end
end
