class SubitemSerializer < ActiveModel::Serializer
  attributes :id, :name, :completed, :created_at, :updated_at, :item_name, :item_id

  def item_name
    object.item.name
  end
end
