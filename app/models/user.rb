# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :todo_tasks, dependent: :destroy

  before_save { email.downcase! }

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, allow_nil: true

  def tokens
    access_token = Doorkeeper::AccessToken.create!(
      resource_owner_id: id,
      expires_in: Doorkeeper.configuration.access_token_expires_in,
      use_refresh_token: Doorkeeper.configuration.refresh_token_enabled?,
      application_id: Doorkeeper::Application.last.id
    )
    Doorkeeper::OAuth::TokenResponse.new(access_token).body
  end
end
