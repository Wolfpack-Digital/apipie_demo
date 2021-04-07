# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :email

  has_one :tokens, if: :with_auth_tokens?

  def with_auth_tokens?
    instance_options[:with_auth_tokens]
  end
end
