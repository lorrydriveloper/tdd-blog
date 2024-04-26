require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "has a valid factory" do
    expect(user).to be_valid
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to_not allow_value("test").for(:email) }
    it { is_expected.to_not allow_value("@test.com").for(:email) }
    it { is_expected.to_not allow_value("bla@").for(:email) }
    it { is_expected.to allow_value("test@test.com").for(:email) }
  end
end
