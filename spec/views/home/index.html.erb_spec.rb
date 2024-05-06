require "rails_helper"

RSpec.describe "home/index", type: :view do
  let(:page) { build(:page) }

  it "renders the page object" do
    assign(:pages, [page])
    render
    expect(rendered).to have_css("h2", text: page.title)
    within("section") do
      expect(rendered).to have_content(page.summary)
    end
    expect(rendered).to have_css("footer", text: page.created_at.to_fs)
  end
end
