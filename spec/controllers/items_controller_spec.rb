require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) {create(:user)}
  let(:item) {create(:item, user: user)}
  before do
    sign_in :user, user
  end
  describe "POST #create" do
    it "increasesthe number of items" do
      expect{post :create, format: :js, user_id: user.id, item: {name: Faker::Hipster.sentence} }.to change(Item, :count).by(1)
    end
    it "returns http success" do
      post :create, format: :js, user_id: user.id, item: {name: Faker::Hipster.sentence}
      expect(response).to have_http_status :success
    end
  end
  describe "DELETE #destroy" do

    it "deletes the comment" do
      delete :destroy, format: :js, user_id: user.id, id: item.id
      count = Item.where({id: item.id}).count
      expect(count).to eq 0
    end
    it "returns http success" do
      delete :destroy, format: :js, user_id: user.id, id: item.id
      expect(response).to have_http_status(:success)
    end
  end


end
