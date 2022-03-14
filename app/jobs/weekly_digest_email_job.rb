# frozen_string_literal: true

class WeeklyDigestEmailJob < ActiveJob::Base
  # Set the Queue as Default
  queue_as :default

  def perform(user)
    WeeklyDigestMailer.with(user: user).digest_email.deliver_now
  end
end
