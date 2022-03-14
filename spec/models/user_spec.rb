# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
  end

  describe 'associations' do
    it { should have_many(:messages) }
  end

  describe '.all_but_user' do
    let(:user) { FactoryBot.create(:user) }
    before { FactoryBot.create(:user) }
    it 'returns all users except the one passed in' do
      expect(User.all_but_user(user)).not_to include(user)
    end
  end
end
