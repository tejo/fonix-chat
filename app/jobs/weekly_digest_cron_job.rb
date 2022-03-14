# frozen_string_literal: true

class WeeklyDigestCronJob < ActiveJob::Base
  # Set the Queue as Default
  queue_as :default

  def perform(*_args)
    User.all.map do |_user|
      WeeklyDigestEmailJob.perform_later user
    end
  end
end
