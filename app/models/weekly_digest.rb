# frozen_string_literal: true

class WeeklyDigest
  attr_reader :week_message_count, :message_count_since_last_user_mesage, :last_message_date

  def initialize(user)
    @last_message_date = user.messages.order(created_at: :desc).limit(1).first.try(:created_at)
    @message_count_since_last_user_mesage = Message.where('created_at > ?', @last_message_date).count
    week_start = Time.now.beginning_of_week - 1.week
    week_end = Time.now.beginning_of_week
    @week_message_count = Message.where(created_at: week_start..week_end).count
  end
end
