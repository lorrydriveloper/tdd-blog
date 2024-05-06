require "rails_helper"

RSpec.describe "shared/_page.html.erb", type: :view do
  let(:page) { build(:page) }

  it "renders the page object" do
    assign(:page, page)
    render partial: "shared/page", locals: {page: page, content: "<p>content</p>"}
    expect(rendered).to have_css("h2", text: page.title)
    within("section") do
      expect(rendered).to have_content("<p>content</p>")
    end
    expect(rendered).to have_css("footer", text: page.created_at.to_fs)
  end
end
