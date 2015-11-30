require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) {create(:user)}
  let(:item) { create(:item, user: user)}

  it { should belong_to(:user)}
  it { should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(3)}

  describe "attributes" do
    it "responds to name" do
      expect(item).to respond_to :name
    end
    it "responds to user" do
      expect(item).to respond_to :user
    end
  end
end
