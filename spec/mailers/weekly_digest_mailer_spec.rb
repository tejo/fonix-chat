# frozen_string_literal: true

require 'rails_helper'

describe WeeklyDigestMailer, type: :mailer do
  describe 'digest_email' do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { WeeklyDigestMailer.with(user: user).digest_email }

    let(:weekly_digest) do
      double(:weekly_digest, week_message_count: 10, message_count_since_last_user_mesage: 12, last_message_date: 'now')
    end

    before do
      expect(WeeklyDigest).to receive(:new).with(user).and_return(weekly_digest)
    end

    it 'renders the subject' do
      expect(mail.subject).to eq('Weekly chat digest')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['notifications@example.com'])
    end

    it 'contains the username' do
      expect(mail.body.encoded).to match(user.username)
    end

    it 'contains the week_message_count' do
      expect(mail.body.encoded).to match('10 messages have been exchanged in the last week.')
    end

    it 'contains the message_count_since_last_user_mesage' do
      expect(mail.body.encoded).to match('12 since your last message ')
    end

    it 'contains the last_message_date' do
      expect(mail.body.encoded).to match('on the now.')
    end
  end
end
