# frozen_string_literal: true

require "rails_helper"

RSpec.describe PageSearch do
  describe ".search" do
    it "should return no pages with nil params" do
      expect(subject.search(nil)).to eq([])
    end

    it "should not allow searching by term if empty term is empty" do
      allow(Page).to receive(:by_term)
      PageSearch.search(term: "")
      expect(Page).to_not have_received(:by_term)
    end

    it "should not allow searching by term if empty term is nil" do
      allow(Page).to receive(:by_term)
      PageSearch.search(term: nil)
      expect(Page).to_not have_received(:by_term)
    end

    it "should allow searching by term if term is present" do
      allow(Page).to receive(:by_term)
      PageSearch.search(term: "test")
      expect(Page).to have_received(:by_term).with("test")
    end
  end
end
