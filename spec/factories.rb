# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'John' }
    email { "#{SecureRandom.uuid}@example.com" }
    password { 'password123' }
  end
end
