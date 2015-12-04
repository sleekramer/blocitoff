class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at, :confirmation_token, :items

  def items
    object.items.pluck(:id)
  end

end
