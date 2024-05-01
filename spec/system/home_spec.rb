require "rails_helper"

# frozen_string_literal: true

RSpec.describe "Home" do
  it "renders homepage" do
    visit root_path
    within "header" do
      expect(page).to have_content("My Blog")
    end
  end
end
