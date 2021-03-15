# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password, presence: true
end
