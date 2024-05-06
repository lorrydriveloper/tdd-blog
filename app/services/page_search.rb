# frozen_string_literal: true

module PageSearch
  def self.search(params)
    return Page.none unless params.present? && params[:term].present?
    Page.by_term(params[:term])
  end
end
