class User < ApplicationRecord
  validates :name, :email, presence: true, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
end
