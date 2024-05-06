require "rails_helper"

RSpec.describe Page, type: :model do
  subject { build(:page) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  describe "scopes" do
    describe ".published" do
      let(:page1) { create(:page, :published) }
      let(:page2) { create(:page) }

      before do
        [page1, page2]
      end

      it "returns only published pages" do
        expect(Page.published).to eq([page1])
      end
    end

    describe ".ordered" do
      let(:page1) { create(:page, created_at: 2.days.ago) }
      let(:page2) { create(:page, created_at: 1.days.ago) }

      before do
        [page1, page2]
      end

      it "returns ordered pages" do
        expect(Page.ordered).to eq([page2, page1])
      end
    end

    describe ".by_term" do
      let(:page) { create(:page, content: "foo") }
      let(:page1) { create(:page, content: "foo bar") }
      let(:page2) { create(:page, content: "foo bar baz") }
      before { [page, page1] }
      it "should return pages for the given term" do
        expected = [page, page1, page2]
        expect(Page.by_term("foo")).to eq(expected)
      end
      it "should return pages for multiple terms" do
        expected = [page2]

        expect(Page.by_term("foo bar baz")).to eq(expected)
      end
    end
  end

  describe "validations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "#slug" do
    let!(:page) { create(:page, title: "--Foo Bar! _ 87 --") }

    it "is generated from the title" do
      expect(page.slug).to eq("foo-bar-87")
    end

    it "generate a unique slug" do
      new_page = build(:page, title: "title one")
      new_page.slug = page.slug
      new_page.valid?
      expect(new_page.errors[:slug]).to include("has already been taken")
    end

    it "validates uniqueness of title" do
      new_page = build(:page, title: page.title)
      expect(new_page.title).to eq(page.title)
      expect(new_page).to_not be_valid
    end

    it "is generate different slug from a title that will generate same slug" do
      new_page = build(:page, title: "--Foo Bar! _ 87 -- ")
      expect(new_page).to be_valid
      expect(new_page.slug).to_not eq(page.slug)
    end
  end
end
