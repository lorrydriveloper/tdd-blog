require "rails_helper"

RSpec.describe "pages/show", type: :view do
  let(:page) { build(:page) }

  it "renders the page object" do
    assign(:page, page)
    render
    expect(rendered).to have_css("h2", text: page.title)
    within("section") do
      expect(rendered).to have_content(page.content)
    end
    expect(rendered).to have_css("footer", text: page.created_at.to_fs)
  end
end
