module ApplicationHelper
  def bootstrap_classes(key)
    "alert #{{'alert': 'warning', 'notice': 'success', 'error': 'danger'}[key]}"
  end
end
