class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at, :confirmation_token, :items

  def items
    object.items.map {|i| i.id}
  end

end
