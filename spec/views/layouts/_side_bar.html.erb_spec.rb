# frozen_string_literal: true

require "rails_helper"

RSpec.describe "layouts/_side_bar", type: :view do
  it "renders the application layout" do
    allow(view).to receive(:render).and_call_original
    render

    expect(view).to have_received(:render).with("layouts/search_form")
    expect(view).to have_received(:render).with("layouts/archives")
  end
end
