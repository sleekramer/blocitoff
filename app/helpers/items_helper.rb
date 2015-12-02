module ItemsHelper
  def can_be_deleted?(item)
    item.subitems.all?{|s| s.completed == true} || item.subitems == []
  end
end
