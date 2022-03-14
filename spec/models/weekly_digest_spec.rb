# frozen_string_literal: true

##
# The system should send to all the users a weekly email specifying how many
# messages were sent and received in the last week and the total number of
# messages received since the user has sent his last message.
# I.e.:
# 600 messages have been exchanged in the last week.
# 750 since your last message on the 1st of February.

require 'rails_helper'

RSpec.describe WeeklyDigest, type: :model do
  describe '.new' do
    let(:user) { FactoryBot.create(:user) }

    context 'last user messages' do
      let!(:last_user_message) { FactoryBot.create(:message, user: user) }
      let(:weekly_digest) { WeeklyDigest.new(user) }

      it 'return number of messages since last user messages' do
        FactoryBot.create(:message)
        expect(weekly_digest.message_count_since_last_user_mesage).to eq(1)
      end

      it 'return the date of the latest user message' do
        expect(weekly_digest.last_message_date).to eq(last_user_message.created_at)
      end
    end
    describe 'week_message_count' do
      before do
        Timecop.travel(Time.now.beginning_of_week - 1.week)
        FactoryBot.create(:message)
        FactoryBot.create(:message)
        Timecop.return
        FactoryBot.create(:message)
      end

      let(:weekly_digest) { WeeklyDigest.new(user) }

      it 'return number of messages in the last week.' do
        expect(weekly_digest.week_message_count).to eq(2)
      end
    end
  end
end
